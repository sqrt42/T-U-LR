package com.example.metropicker;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.app.ListActivity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class ListViewActivity extends ListActivity {

    String selectedStationName;
    SharedPreferences mSettings;
    boolean resetSelectedStation = false;
    Intent toMainActivityIntent;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Resources r = getResources();
        String[] stationsArray = r.getStringArray(R.array.stations);
        ArrayAdapter<String> aa = new ArrayAdapter<String>(this, R.layout.list_item, stationsArray);
        setListAdapter(aa);
        ListView lv = getListView();
        mSettings = getApplicationContext().getSharedPreferences(
                getString(R.string.preference_file_key), Context.MODE_PRIVATE);
        lv.setOnItemClickListener(this::onItemClick);
        registerForContextMenu(getListView());
        resetSelectedStation = false;
        Intent intent = getIntent();
        selectedStationName = intent.getStringExtra("selected_station");
        toMainActivityIntent = new Intent(getApplicationContext(), MainActivity.class);
    }

    public void onItemClick(AdapterView<?> parent, View v, int position, long id) {
        selectedStationName = ((TextView) v).getText().toString();
        SharedPreferences.Editor editor = mSettings.edit();
        editor.putString(getString(R.string.saved_selected_station_key), selectedStationName);
        editor.apply();
        toMainActivityIntent.putExtra("message_key", selectedStationName);
        startActivity(toMainActivityIntent);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.activity_list_menu, menu);
        return true;
    }
    public boolean onOptionsItemSelected(MenuItem item) {
        if(item.getItemId() == R.id.list_back_option){
            onBackPressed();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onCreateContextMenu(ContextMenu menu, View v,
                                    ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.activity_list_context_menu, menu);
        if(selectedStationName != null && selectedStationName != getString(R.string.you_didnt_select_station) &&
                selectedStationName != getString(R.string.you_reseted_station) && selectedStationName != getString(R.string.select_station) &&
        selectedStationName != "не обрано")
            menu.getItem(1).setTitle("Обрана станція: " + selectedStationName);
        else
            menu.getItem(1).setTitle("Станція не обрана");
    }

    public boolean onContextItemSelected(MenuItem item) {
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        if(item.getItemId() == R.id.selected_station_context)
            return true;
        else if(item.getItemId() == R.id.select_new_station_context){
            resetSelectedStation = true;
            selectedStationName = null;
            return true;
        }
        return super.onContextItemSelected(item);
    }

    @Override
    public void onBackPressed() {
        if(resetSelectedStation)
            selectedStationName = "Ви скинули станцію";
        else
            selectedStationName = "Ви не обрали станцію";
        SharedPreferences.Editor editor = mSettings.edit();
        editor.putString(getString(R.string.saved_selected_station_key), null);
        editor.apply();
        toMainActivityIntent.putExtra("message_key", selectedStationName);
        startActivity(toMainActivityIntent);
    }
}