package com.example.tabwidgetsample;

import androidx.appcompat.app.AppCompatActivity;

import android.app.TabActivity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.widget.TabHost;
import android.widget.Toast;

public class MainActivity extends TabActivity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState); setContentView(R.layout.activity_main);
        Resources res = getResources();
        String tab1Indicator = res.getString(R.string.tab1_indicator);
        String tab2Indicator = res.getString(R.string.tab2_indicator);
        String tab3Indicator = res.getString(R.string.tab3_indicator);
        TabHost tabHost = getTabHost();
        TabHost.TabSpec spec;
        Intent intent;
        int duration = Toast.LENGTH_LONG;
        Context context = getApplicationContext();
        Toast toast = Toast.makeText(context, getIntent().getAction(), duration);
        toast.show();
        intent = new Intent().setClass(this, StudentsActivity.class); spec = tabHost. newTabSpec("students ").setIndicator(tab1Indicator) .setContent(intent); tabHost.addTab(spec);
        intent = new Intent().setClass(this, TeachersActivity.class); spec = tabHost.newTabSpec("teachers").setIndicator(tab2Indicator) .setContent(intent); tabHost.addTab(spec);
        intent = new Intent().setClass(this, ClassesActivity.class); spec = tabHost.newTabSpec("class ").setIndicator(tab3Indicator) .setContent(intent); tabHost.addTab(spec); tabHost.setCurrentTab(1);
    }

}