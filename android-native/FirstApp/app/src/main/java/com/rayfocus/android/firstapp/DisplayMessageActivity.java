package com.rayfocus.android.firstapp;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class DisplayMessageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_message);

        // Get the Calling Intent
        Intent intent = getIntent();
        String intentExtra  = intent.getStringExtra(MainActivity.INTENT_EXTRA);
        // Display the text received from Parent Activity
        TextView txtView = findViewById(R.id.textView);
        txtView.setText(intentExtra);
    }
}
