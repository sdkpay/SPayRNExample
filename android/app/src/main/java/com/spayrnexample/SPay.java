package com.spayrnexample;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import java.util.Map;
import java.util.HashMap;
import com.facebook.react.bridge.Callback;

public class SPay extends ReactContextBaseJavaModule {
    SPay(ReactApplicationContext context) {
       super(context);
   }

    @Override
    public String getName() {
    return "SPay";
    }

    @ReactMethod
    public void setupSDK(Callback callBack) {
        callBack.invoke(true);
    }

    @ReactMethod
    public void isReadyForSPay(Callback callBack) {
        callBack.invoke(true);
    }

    @ReactMethod
    public void payWithBankInvoiceId(ReadableMap requestParams, Callback callBack) {
        callBack.invoke(null, "success");
    }

    @ReactMethod
    public void getPaymentToken(ReadableMap requestParams, Callback callBack) {
        callBack.invoke(null, "123", null, null);
    }

    @ReactMethod
    public void pay(ReadableMap requestParams, Callback callBack) {
        callBack.invoke(null, "success");
    }

    @ReactMethod
    public void close(String state, Callback callBack) {
        callBack.invoke(true);
    }
}