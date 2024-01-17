package com.example.animsample;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ImageView ship = (ImageView) findViewById(R.id.shipView);
        Animation shipAnim = AnimationUtils.loadAnimation(this, R.anim.ship_anim); ship.startAnimation(shipAnim);

    }
}