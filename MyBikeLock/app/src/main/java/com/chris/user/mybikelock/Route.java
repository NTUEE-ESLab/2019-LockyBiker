package com.chris.user.mybikelock;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class Route extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_route);
    }

    public void onClick(View view)
    {
        Intent it;
        if(view.getId() == R.id.lock)
            it = new Intent(this, LockScan.class);
        else
            it = new Intent(this, KeyScan.class);

        startActivity(it);
    }
}
