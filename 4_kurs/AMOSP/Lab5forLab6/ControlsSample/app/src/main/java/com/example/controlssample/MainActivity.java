package com.example.controlssample;


import androidx.appcompat.app.AppCompatActivity;


import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.content.Intent;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;


public class MainActivity extends AppCompatActivity {


    SharedPreferences mSettings;
    Intent intent;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        final EditText userName = (EditText) findViewById(R.id.user_name);

        userName.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) { if ((event.getAction() == KeyEvent.ACTION_DOWN)
                    && (keyCode == KeyEvent.KEYCODE_ENTER)) { Toast. makeText(getApplicationContext(), userName.getText(),
                    Toast.LENGTH_SHORT).show(); return true;
            }
                return false;
            }
        });
        mSettings = getSharedPreferences(getString(R.string.preference_file_key), MODE_PRIVATE);
        CheckBox checkBox = findViewById(R.id.checkbox);
        ToggleButton toggleButton = findViewById(R.id.toggle_button);
        RadioGroup radioGroup = findViewById(R.id.radio_group);
        EditText editText = findViewById(R.id.user_name);
        String str = mSettings.getString(getString(R.string.SAVED_CHECK_BOX_KEY), "");
        checkBox.setChecked(mSettings.getBoolean("SAVED_CHECK_BOX", false));
        toggleButton.setChecked(mSettings.getBoolean("SAVED_TOGGLE_BUTTON", false));
        radioGroup.check(mSettings.getInt("SAVED_RADIO_GROUP", 56));
        str = mSettings.getString("SAVED_EDIT_TEXT", "");
        editText.setText(str);
    }


    @Override
    protected void onPause() {
        super.onPause();
        SharedPreferences.Editor editor = mSettings.edit();
        CheckBox checkBox = findViewById(R.id.checkbox);
        ToggleButton toggleButton = findViewById(R.id.toggle_button);
        RadioGroup radioGroup = findViewById(R.id.radio_group);
        EditText editText = findViewById(R.id.user_name);
        editor.putBoolean("SAVED_CHECK_BOX", checkBox.isChecked()).commit();
        editor.putBoolean("SAVED_TOGGLE_BUTTON", toggleButton.isChecked()).commit();
        editor.putInt("SAVED_RADIO_GROUP", radioGroup.getCheckedRadioButtonId());
        editor.putString("SAVED_EDIT_TEXT", editText.getText().toString());
        editor.apply();
    }


    public void onButtonClicked(View v) {
        Toast.makeText(this, "Кнопка натиснута", Toast.LENGTH_SHORT).show();
    }


    public void onClearButtonClicked(View v) {
        final EditText userName = (EditText) findViewById(R.id.user_name);
        userName.setText("");
    }


    public void onCheckboxClicked(View v) { if (((CheckBox) v).isChecked()) {
        Toast.makeText(this, "Відмічено", Toast.LENGTH_SHORT).show();
    } else {
        Toast.makeText(this, "Не відмічено",
                Toast.LENGTH_SHORT).show();
    }
    }


    public void onToggleClicked(View v) { if
    (((ToggleButton) v).isChecked()) {
        Toast.makeText(this, "Увімкнено", Toast.LENGTH_SHORT).show(); } else {
        Toast.makeText(this, "Вимкнено", Toast.LENGTH_SHORT).show();
    }
    }


    public void onRadioButtonClicked(View v)
    {
        RadioButton rb = (RadioButton) v;
        Toast.makeText(this, "Вибраний звір:" + rb.getText(),Toast.LENGTH_SHORT).show();
    }








}
