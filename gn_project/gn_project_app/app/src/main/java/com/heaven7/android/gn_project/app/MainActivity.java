package com.heaven7.android.gn_project.app;

import android.Manifest;
import android.os.Bundle;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.heaven7.core.util.PermissionHelper;

//libgn_wrapperDebug.a should be build by genie_build_android.bat
public class MainActivity extends AppCompatActivity {

    private final PermissionHelper mHelper = new PermissionHelper(this);

    static {
        System.loadLibrary("gn_study");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mHelper.startRequestPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE, 1, new PermissionHelper.ICallback() {
            @Override
            public void onRequestPermissionResult(String s, int i, boolean b) {
                System.out.println("WRITE_EXTERNAL_STORAGE = " + b);
            }
            @Override
            public boolean handlePermissionHadRefused(String s, int i, Runnable runnable) {
                return false;
            }
        });
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        mHelper.onRequestPermissionsResult(requestCode, permissions, grantResults);
    }

    @Override
    protected void onStop() {
        nReleaseTimer();
        super.onStop();
    }

    private static native void nTestTimer();
    private static native void nReleaseTimer();

    public void onClickTestTimer(View view) {
        nTestTimer();
    }
    public void onClickTimerEnd(View view) {
        nReleaseTimer();
    }
}
