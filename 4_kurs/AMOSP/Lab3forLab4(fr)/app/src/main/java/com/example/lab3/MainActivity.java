package com.example.lab3;

import androidx.appcompat.app.AppCompatActivity;
import android.app.Activity;
import android.os.Bundle;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toast.makeText(this, "onCreateQ", Toast.LENGTH_LONG).show();
    }
    @Override
    protected void onPause()
    {
        Toast.makeText(this, "onPause()", Toast.LENGTH_LONG).show();
        super.onPause();
    }
    @Override
    protected void onRestart() {
        super.onRestart();
        Toast.makeText(this, "onRestart() ", Toast.LENGTH_LONG).show();
    }
    @Override
    protected void onStart() {
        super.onStart();
        Toast.makeText(this, "onStart() ", Toast.LENGTH_LONG).show();
    }
}