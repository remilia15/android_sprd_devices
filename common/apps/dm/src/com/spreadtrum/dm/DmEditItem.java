
package com.spreadtrum.dm;

import com.spreadtrum.dm.R;

import android.widget.EditText;
import android.util.Log;
import android.os.Bundle;
import android.content.Intent;
import android.app.Activity;
import android.view.View;
import android.content.Context;
import android.text.TextWatcher;
import android.text.Editable;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

public class DmEditItem extends Activity {
    private String TAG = DmReceiver.DM_TAG + "DmEditItem: ";

    private EditText mEditItem;

    private Context mContext;

    private String mEditType;

    private Toast mToast;

    private static final int MENU_SAVE = Menu.FIRST;

    private static final int MENU_CANCEL = Menu.FIRST + 1;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_edittext);

        mEditItem = (EditText) findViewById(R.id.edittext);

        // init edit item content
        Intent intent = getIntent();
        Bundle bundle = intent.getExtras();

        mEditType = (String) bundle.get("EditType");
        String editContent = (String) bundle.get("EditContent");

        Log.d(TAG, "onCreate : type = " + mEditType);
        Log.d(TAG, "onCreate : content = " + editContent);

        setTitle(mEditType);
        mEditItem.setText(editContent);
        mEditItem.addTextChangedListener(mTextWatcher);

        mContext = this;
    }

    private boolean saveEditContent() {
        boolean isSaved = true;
        boolean isValid = mEditItem.getText().length() > 0;

        if (isValid) {
            String editContent = mEditItem.getText().toString();
            String[] listArray = getResources().getStringArray(R.array.debug_list);

            Log.d(TAG, "saveEditContent : editContent = " + editContent);
            Log.d(TAG, "saveEditContent : mEditType = " + mEditType);

            if (mEditType.equals(listArray[DmDebugMenu.ITEM_MANUFACTORY])) {
                // manufactory
                DmService.getInstance().setManufactory(mContext, editContent);
            } else if (mEditType.equals(listArray[DmDebugMenu.ITEM_MODEL])) {
                // model
                DmService.getInstance().setModel(mContext, editContent);
            } else if (mEditType.equals(listArray[DmDebugMenu.ITEM_SW_VER])) {
                // software
                DmService.getInstance().setSoftwareVersion(mContext, editContent);
            } else if (mEditType.equals(listArray[DmDebugMenu.ITEM_IMEI])) {
                // IMEI
                DmService.getInstance().setImei(mContext, editContent);
            } else if (mEditType.equals(listArray[DmDebugMenu.ITEM_APN])) {
                // APN
                DmService.getInstance().setAPN(mContext, editContent);
                if (editContent.equals(DmService.APN_CMWAP)) {
                    // cmwap apn, need set proxy and proxy port
                    DmService.getInstance().setProxy(mContext, "10.0.0.172");
                    DmService.getInstance().setProxyPort(mContext, "80");
                } else {
                    // cmnet or cmdm apn, no need set proxy and proxy port
                    DmService.getInstance().setProxy(mContext, null);
                    DmService.getInstance().setProxyPort(mContext, null);
                }
            } else if (mEditType.equals(listArray[DmDebugMenu.ITEM_SERVER_ADDR])) {
                // Server address
                DmService.getInstance().setServerAddr(mContext, editContent);
            } else if (mEditType.equals(listArray[DmDebugMenu.ITEM_SMS_ADDR])) {
                // Sms address
                DmService.getInstance().setSmsAddr(mContext, editContent);
            } else if (mEditType.equals(listArray[DmDebugMenu.ITEM_SMS_PORT])) {
                // Sms port
                DmService.getInstance().setSmsPort(mContext, editContent);
            } else {
                Log.d(TAG, "saveEditContent : mEditType is invalid!");
                isSaved = false;
                ShowMessage("edit type is invalid!");
            }
        } else {
            isSaved = false;
            ShowMessage("Content can't be empty!");
        }

        return isSaved;
    }

    private final TextWatcher mTextWatcher = new TextWatcher() {
        public void beforeTextChanged(CharSequence s, int start, int before, int after) {
            Log.d(TAG, "beforeTextChanged : editContent = " + s);
        }

        public void onTextChanged(CharSequence s, int start, int before, int after) {
            Log.d(TAG, "onTextChanged : editContent = " + s);
            // updateContent();
        }

        public void afterTextChanged(Editable s) {
            Log.d(TAG, "afterTextChanged : editContent = " + s);
            // saveEditContent();
        }
    };

    private void ShowMessage(CharSequence msg) {
        if (mToast == null)
            mToast = Toast.makeText(this, msg, Toast.LENGTH_LONG);
        mToast.setText(msg);
        mToast.show();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);

        menu.add(0, MENU_SAVE, 0, R.string.menu_save).setIcon(android.R.drawable.ic_menu_save);
        menu.add(0, MENU_CANCEL, 0, R.string.menu_cancel).setIcon(
                android.R.drawable.ic_menu_close_clear_cancel);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case MENU_SAVE:
                if (saveEditContent()) {
                    finish();
                }
                return true;

            case MENU_CANCEL:
                finish();
                return true;
        }
        return super.onOptionsItemSelected(item);
    }

}
