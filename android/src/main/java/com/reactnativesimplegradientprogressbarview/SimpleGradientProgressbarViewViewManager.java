package com.reactnativesimplegradientprogressbarview;

import android.graphics.Color;
import android.view.View;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.bridge.ReadableArray;

public class SimpleGradientProgressbarViewViewManager extends SimpleViewManager<View> {
    public static final String REACT_CLASS = "SimpleGradientProgressbarView";

    @Override
    @NonNull
    public String getName() {
        return REACT_CLASS;
    }

    @Override
    @NonNull
    public View createViewInstance(ThemedReactContext reactContext) {
        return new SimpleGradientProgressbarView(reactContext);
    }

    @ReactProp(name = "progress")
    public void setProgress(SimpleGradientProgressbarView view, @Nullable float progress) {
        view.setProgress(progress);
    }

    @ReactProp(name = "cornerRadius")
    public void setCornerRadius(SimpleGradientProgressbarView view, @Nullable float cornerRadius) {
        view.setCornerRadius(cornerRadius);
    }

    @ReactProp(name = "fromColor", customType = "Color")
    public void setFromColor(SimpleGradientProgressbarView view, @Nullable int color) {
        view.setFromColor(color);
    }

    @ReactProp(name = "toColor", customType = "Color")
    public void setToColor(SimpleGradientProgressbarView view, @Nullable int color) {
        view.setToColor(color);
    }

    @ReactProp(name = "maskedCorners")
    public void setMaskedCorners(SimpleGradientProgressbarView view, ReadableArray maskedCorners) {
        view.setMaskedCorners(maskedCorners);
    }
}
