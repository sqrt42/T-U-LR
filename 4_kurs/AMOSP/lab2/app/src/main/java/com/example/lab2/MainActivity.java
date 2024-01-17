package com.example.lab2;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button groupNameButton = findViewById(R.id.groupNameButton);
        TextView fioTextView = findViewById(R.id.fioTextView);
        groupNameButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                fioTextView.setVisibility(View.VISIBLE);
            }
        });
    }
}