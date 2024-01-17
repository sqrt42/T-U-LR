package com.example.metropicker;


import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    SharedPreferences mSettings;
    Intent intent;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        TextView selectedStationTextView = findViewById(R.id.SelectedStationTextView);
        Button OpenListViewButton = (Button) findViewById(R.id.OpenListViewButton);
        OpenListViewButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
               Intent intent = new Intent("com.example.metropicker.intent.action.PICK_METRO_STATION");
               TextView textView = findViewById(R.id.SelectedStationTextView);
               if(textView.getText() != getString(R.string.you_didnt_select_station) && textView.getText() != getString(R.string.select_station))
                   intent.putExtra("selected_station", textView.getText());
               else
                   intent.putExtra("selected_station", "не обрано");
               startActivity(intent);
            }
        });
        Button CheckIntentButton = (Button) findViewById(R.id.CheckIntentButton);
        CheckIntentButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                String action = intent.getAction();
                Uri data = intent.getData();
                TextView textView = findViewById(R.id.SelectedStationTextView);
                textView.setText(action);
            }
        });
        mSettings = getSharedPreferences(getString(R.string.preference_file_key), MODE_PRIVATE);
        intent = getIntent();
        String defaultValue = getString(R.string.select_station);
        String str = mSettings.getString(getString(R.string.saved_selected_station_key), defaultValue);
        selectedStationTextView.setText(str);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.main_activity_menu, menu);
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        if(item.getItemId() == R.id.main_exit_option){
            finishAffinity();
            System.exit(0);
        }
        else if(item.getItemId() == R.id.main_reset_option){
            SharedPreferences.Editor editor = mSettings.edit();
            editor.putString(getString(R.string.saved_selected_station_key), null);
            editor.apply();
            TextView selectedStationTextView = findViewById(R.id.SelectedStationTextView);
            selectedStationTextView.setText(getString(R.string.you_reseted_station));
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onResume() {
        super.onResume();
        TextView textView = findViewById(R.id.SelectedStationTextView);
        String str = intent.getStringExtra("message_key");
        if(str != null)
            textView.setText(str);
    }
}