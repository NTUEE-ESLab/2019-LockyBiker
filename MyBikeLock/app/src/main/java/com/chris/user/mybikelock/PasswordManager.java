package com.chris.user.mybikelock;

import android.content.SharedPreferences;

public final class PasswordManager
{
    private PasswordManager(SharedPreferences s) { this.s = s; }

    private String password = "";
    private SharedPreferences s;
    private static PasswordManager manager = null;

    public static PasswordManager getInstance(SharedPreferences s)
    {
        if(manager == null && s == null)
            throw new RuntimeException("null preference.");
        else if(manager == null)
            manager = new PasswordManager(s);

        return manager;
    }

    public boolean noPassword()
    {
        return password.equals("");
    }

    public String getPassword()
    {
        if(noPassword())
        {
            password = s.getString("PASSWORD", "");
            if (noPassword())
            {
                throw new NoPasswordException();
            }
        }

        return this.password;
    }

    public void setPassword(String message)
    {
        s.edit().putString("PASSWORD", message).apply();
        System.out.println("password : -" + s.getString("PASSWORD", "") + "-");
        this.password = message;
    }
}
