package com.chris.user.mybikelock;

import android.Manifest;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.w3c.dom.Text;

public class Login extends AppCompatActivity {

    private EditText password;
    private PasswordManager mgr;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        String test = getSharedPreferences("mybikelock", MODE_PRIVATE).getString("PASSWORD", "");
        System.out.println("password : -" + test + "-");

        mgr = PasswordManager.getInstance(getSharedPreferences("mybikelock", MODE_PRIVATE));

        try
        {
            mgr.getPassword();
        }
        catch(NoPasswordException e)
        {
            changePassword(null);
        }

        password = findViewById(R.id.password);
    }

    public void onClick(View view)
    {
        String _pass = password.getText().toString();
        if(_pass.equals(""))
        {
            Toast.makeText(this, "password needed!!!", Toast.LENGTH_LONG).show();
            return;
        }
        else if(!_pass.equals(mgr.getPassword()))
        {
            Toast.makeText(this, "Mmm... password is not correct. Are you a thief? -_-\' ", Toast.LENGTH_LONG).show();
            return;
        }

        Intent it = new Intent(this, Route.class);
        this.startActivity(it);
    }

    public void changePassword(View view)
    {
        Intent it = new Intent(this, ChangePassword.class);
        startActivity(it);
    }
}
