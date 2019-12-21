package com.chris.user.mybikelock;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class ChangePassword extends AppCompatActivity {

    private boolean enable;

    private EditText oldPasswd;
    private EditText newPasswd;
    private EditText confirmPasswd;
    private TextView oldPasswdText;

    private PasswordManager mgr;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_change_password);

        oldPasswd = findViewById(R.id.oldPasswd);
        newPasswd = findViewById(R.id.newPasswd);
        confirmPasswd = findViewById(R.id.confirmPasswd);
        oldPasswdText = findViewById(R.id.oldPasswdText);

        mgr = PasswordManager.getInstance(null);

        enable = mgr.noPassword();
        oldPasswd.setEnabled(!enable);
        oldPasswdText.setEnabled(!enable);
    }

    public void save(View view)
    {
        String _old = oldPasswd.getText().toString();
        String _new = newPasswd.getText().toString();
        String _con = confirmPasswd.getText().toString();

        System.out.println("saving password: " + _old + " , " + _new + " , " + _con);

        if(!enable)
        {
            if(_old.equals(""))
            {
                System.out.println("matching rule: no old password");
                Toast.makeText(this, "old password needed!!!", Toast.LENGTH_LONG).show();
                return;
            }
            else if(!_old.equals(mgr.getPassword()))
            {
                System.out.println("matching rule: old password not correct");
                Toast.makeText(this, "Mmm... password is not correct. Are you a thief? -_-\' ", Toast.LENGTH_LONG).show();
                return;
            }
        }

        if(_new.equals(""))
        {
            System.out.println("matching rule: no new password");
            Toast.makeText(this, "new password needed!!!", Toast.LENGTH_LONG).show();
            return;
        }
        else if(_con.equals(""))
        {
            System.out.println("matching rule: no confirm password");
            Toast.makeText(this, "confirm password needed!!!", Toast.LENGTH_LONG).show();
            return;
        }
        else if(!_new.equals(_con))
        {
            System.out.println("matching rule: passwords not matching");
            Toast.makeText(this, "password confirmation failed. please retype it. :| ", Toast.LENGTH_LONG).show();
            return;
        }
        else if(_new.length() < 8)
        {
            System.out.println("matching rule: weak password");
            Toast.makeText(this, "password too short!! someone's gonna hack it ~_~", Toast.LENGTH_LONG).show();
            return;
        }
        else
        {
            System.out.println("no rules matching");
            mgr.setPassword(_new);
            Toast.makeText(this, "password save successfully!! : )", Toast.LENGTH_LONG).show();
            finish();
        }
    }
}
