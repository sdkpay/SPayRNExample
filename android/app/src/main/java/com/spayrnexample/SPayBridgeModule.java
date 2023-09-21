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
import spay.sdk.SPaySdkApp;
import spay.sdk.view.SPayButton;
import spay.sdk.api.SPayStage;

public class SPayBridgeModule extends ReactContextBaseJavaModule {
    SPayBridgeModule(ReactApplicationContext context) {
       super(context);
   }

    SPayButton sPayButton = SPayButton(reactContext.currentActivity, null);

    @Override
    public String getName() {
    return "SPayBridgeModule";
    }

    @ReactMethod
    public void setupSDK(Callback callBack) {
        SPaySdkApp.getInstance().initialize(
                reactContext.currentActivity.applicationContext,
                SPayStage.Prod,
                true
        );
    }

    @ReactMethod
    public void isReadyForSPay(Callback callBack) {
        callBack.invoke(sPayButton.isReadyForSPaySdk());
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