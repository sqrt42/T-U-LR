package com.example.notessample;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ListActivity;
import android.database.Cursor;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private DBHandler dbHandler;
    private Button saveButton;
    private EditText editText;

    private long contextMenuOpenedItemPosition = 0;
    SimpleCursorAdapter myAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        saveButton = findViewById(R.id.save_button);
        editText = findViewById(R.id.edit_text);
        ListView lv = findViewById(R.id.list);
        dbHandler = new DBHandler(MainActivity.this);
        registerForContextMenu(lv);
        UpdateListView(lv);
        saveButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dbHandler.addNewCourse(String.valueOf(editText.getText()));
                UpdateListView(lv);
            }
        });
    }


    private void UpdateListView(ListView lv){
        dbHandler = new DBHandler(MainActivity.this);
        String[] result_columns = new String[] {"_id", "name"};
        Cursor allRows = dbHandler.getReadableDatabase().query(true, "mycourses", result_columns,
                null, null, null, null, null, null);
        String[] fromColumns = new String[] {"_id", "name"};
        int[] toLayoutIDs = new int[] {R.id.id_text_view, R.id.columnone_text_view};
        myAdapter = new SimpleCursorAdapter(this, R.layout.list_item, allRows, fromColumns, toLayoutIDs);
        lv.setAdapter(myAdapter);
        lv.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int position, long arg3) {
                contextMenuOpenedItemPosition = arg3;
                adapterView.showContextMenu();
                return true;
            }
        });
    }
    @Override
    public void onCreateContextMenu(ContextMenu menu, View v,
                                    ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.activity_list_context_menu, menu);
    }

    public boolean onContextItemSelected(MenuItem item) {
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        if(item.getItemId() == R.id.delete_row) {
            ListView lv = findViewById(R.id.list);
            String Query = " DELETE FROM " + "mycourses" + " WHERE _id=" + contextMenuOpenedItemPosition ;
            dbHandler.getWritableDatabase().execSQL(Query);
            UpdateListView(lv);
            return true;
        }
        return super.onContextItemSelected(item);
    }
}