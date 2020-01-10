package com.chris.user.mybikelock;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class Login extends AppCompatActivity {

    private EditText password;
    private PasswordManager mgr;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

//        getSharedPreferences("mybikelock", MODE_PRIVATE).edit().putString("PASSWORD", "").putString("MAC", "").apply();

        String test = getSharedPreferences("mybikelock", MODE_PRIVATE).getString("PASSWORD", "");

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
