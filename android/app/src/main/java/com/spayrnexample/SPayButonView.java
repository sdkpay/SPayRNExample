package com.spayrnexample;

import android.content.Context;
import android.graphics.Color;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;


public class SPayButonView extends FrameLayout {
  public SPayButonView(@NonNull Context context) {
    super(context);
    this.setBackgroundColor(Color.GREEN);
  }
}