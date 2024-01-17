package com.example.currencyrates;

import android.app.ListActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.SimpleAdapter;
import java.util.HashMap;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

public class CurrencyRates extends ListActivity {

    private final static String KEYCHARCODE = "targetCurrency";
    private final static String KEYVALUE = "exchangeRate";
    private final static String KEYNAME = "targetName";
    ArrayList<Map<String, String>> data;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    data = getData();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        thread.start();
        try {
            thread.join();
        } catch(InterruptedException e) {
            System.out.println("got interrupted!");
        }
        //Log.d("CUSTOM_TAG", String.valueOf(data.size()));
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                String[]from = {KEYCHARCODE, KEYVALUE, KEYNAME };
                int[] to = {R.id.charCodeView, R.id.valueView, R.id.nameView };
                SimpleAdapter sa = new SimpleAdapter(getApplicationContext(), data,
                        R.layout.item_view,
                        from, to);
                setListAdapter(sa);
                // Stuff that updates the UI

            }
        });
    }

    private ArrayList<Map<String, String>> getData() {
        ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Map<String, String> m;
        try{
            URL url = new URL(getString(R.string.ratesurl));
            HttpURLConnection httpConnection =
                    (HttpURLConnection) url.openConnection();
            int responseCode = httpConnection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                InputStream in = httpConnection.getInputStream();
                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                DocumentBuilder db = dbf.newDocumentBuilder();
                Document dom = db.parse(in);
                Element docElement = dom.getDocumentElement();
                String date = docElement.getAttribute("Currency Name");
                setTitle(getTitle() + " на " + date);
                NodeList nodeList = docElement.getElementsByTagName("item");
                int count = nodeList.getLength();
                if (nodeList != null && count > 0) {
                    for (int i = 0; i < count; i++) {
                        Element entry = (Element) nodeList.item(i);
                        m = new HashMap<String, String>();
                        String charCode = entry.getElementsByTagName(KEYCHARCODE).item(0).getFirstChild().getNodeValue();
                        String value = entry.getElementsByTagName(KEYVALUE).item(0).getFirstChild().getNodeValue();
                        String name = entry.getElementsByTagName(KEYNAME).item(0).getFirstChild().getNodeValue();
                        m.put(KEYCHARCODE, charCode);
                        m.put(KEYVALUE, value);
                        m.put(KEYNAME, name);
                        list.add(m);
                    }
                }
            }
            else {

            }
        }
        catch (MalformedURLException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
        catch (SAXException e) {
            e.printStackTrace();
        }
        return list;
    }

}