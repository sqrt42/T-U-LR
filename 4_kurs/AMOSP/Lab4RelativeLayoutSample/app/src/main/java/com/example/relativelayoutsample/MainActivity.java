package com.example.relativelayoutsample;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    public Button cancelbutton;
    public TextView textview;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        cancelbutton = findViewById(R.id.cancel);
        textview = (TextView) findViewById(R.id.entry);

        cancelbutton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                textview.setText("");
            }
        });
    }
}