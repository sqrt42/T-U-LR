package com.example.sqltest;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.app.ListActivity;
import android.content.ContentValues;
import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import android.view.ContextMenu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends ListActivity {


    private static final String DATABASE_NAME = "myDatabase.db";
    private static final String DATABASE_TABLE = "mainTable2";
    private static final String DATABASE_CREATE = "create table IF NOT EXISTS " + DATABASE_TABLE + " ( _id INTEGER PRIMARY KEY AUTOINCREMENT, "
            + " columnone text not null)  ";
    SimpleCursorAdapter myAdapter;
    long contextMenuOpenedItemPosition = 0;
    SQLiteDatabase myDatabase;

    private void createDatabase() {
        myDatabase = openOrCreateDatabase("MyDatabase.db", MODE_PRIVATE, null);
        myDatabase.execSQL(DATABASE_CREATE);
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Resources r = getResources();

        //ContentValues values = new ContentValues();
        //values.put("columnone", "This is a value");
        //myDatabase.insert(DATABASE_TABLE, null, values);
        //List<String> columnValue = new ArrayList<String>();
        //columnValue.add(allRows.getString(0));
        createDatabase();
        registerForContextMenu(getListView());
        ContentValues values = new ContentValues();
        myDatabase.execSQL("delete from "+ DATABASE_TABLE);
        myDatabase.execSQL("DELETE FROM SQLITE_SEQUENCE WHERE NAME = '" + DATABASE_TABLE + "'");
        values.put("columnone", "This is the first value");
        myDatabase.insert(DATABASE_TABLE, null, values);
        values.put("columnone", "This is the second value");
        myDatabase.insert(DATABASE_TABLE, null, values);
        values.put("columnone", "This is the third value");
        myDatabase.insert(DATABASE_TABLE, null, values);
        String[] result_columns = new String[] {"_id", "columnone"};
        Cursor allRows = myDatabase.query(true, DATABASE_TABLE, result_columns,
                null, null, null, null, null, null);
        String[] fromColumns = new String[] {"_id", "columnone"};
        int[] toLayoutIDs = new int[] {R.id.id_text_view, R.id.columnone_text_view};
        myAdapter = new SimpleCursorAdapter(this, R.layout.list_item, allRows, fromColumns, toLayoutIDs);
        ListView lv = getListView();
        lv.setAdapter(myAdapter);

        lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> parent, View v, int position, long id) {
                Cursor cursor = (Cursor) myAdapter.getItem(position);

                int duration = Toast.LENGTH_LONG;
                Context context = getApplicationContext();
                Toast toast = Toast.makeText(context, String.valueOf(cursor.getPosition()), duration);
                toast.show();
            }});
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
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.activity_list_context_menu, menu);
    }

    public boolean onContextItemSelected(MenuItem item) {
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        if(item.getItemId() == R.id.delete_entry_context){
            String Query = " DELETE FROM " + DATABASE_TABLE + " WHERE _id=" + contextMenuOpenedItemPosition ;
            myDatabase.execSQL(Query);
            String[] result_columns = new String[] {"_id", "columnone"};
            Cursor allRows = myDatabase.query(true, DATABASE_TABLE, result_columns,
                    null, null, null, null, null, null);
            String[] fromColumns = new String[] {"_id", "columnone"};
            int[] toLayoutIDs = new int[] {R.id.id_text_view, R.id.columnone_text_view};
            myAdapter = new SimpleCursorAdapter(this, R.layout.list_item, allRows, fromColumns, toLayoutIDs);
            ListView lv = getListView();
            lv.setAdapter(myAdapter);
            return true;
        }
        return super.onContextItemSelected(item);
    }
}





