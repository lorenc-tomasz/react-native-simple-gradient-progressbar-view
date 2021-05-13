package com.reactnativesimplegradientprogressbarview;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.ScaleDrawable;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import com.facebook.react.bridge.ReadableArray;

import androidx.annotation.Nullable;

public class SimpleGradientProgressbarView extends View {

    // leftTop, rightTop, leftBottom, rightBottom
    private static final int[] sDefaultMaskedCorners = {1, 1, 1, 1};

    float progress;
    float cornerRadius;
    int fromColor;
    int toColor;
    private int[] maskedCorners = sDefaultMaskedCorners;

    public SimpleGradientProgressbarView(Context context) {
        super(context);
    }

    public SimpleGradientProgressbarView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public SimpleGradientProgressbarView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public SimpleGradientProgressbarView(Context context, @Nullable AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    // update

    void update() {
        GradientDrawable gradient = new GradientDrawable();
        gradient.setColors(new int[]{
                this.fromColor,
                this.toColor
        });
        gradient.setOrientation(GradientDrawable.Orientation.LEFT_RIGHT);
        gradient.setGradientType(GradientDrawable.LINEAR_GRADIENT);
        gradient.setShape(GradientDrawable.RECTANGLE);
        // gradient.setCornerRadius(this.cornerRadius * 4);


        // setCornerRadii -> specifies radii for each of the 4 corners. For each corner,
        // the array contains 2 values, [X_radius, Y_radius].
        // The corners are ordered:
        //
        // top-left, top-right, bottom-right, bottom-left.
        //
        // This property is honored only when the shape is of type RECTANGLE.
        //
        // Note: changing this property will affect all instances of a drawable loaded from a resource.
        // It is recommended to invoke mutate() before changing this property.
        // More: https://developer.android.com/reference/android/graphics/drawable/GradientDrawable

        float radius = this.cornerRadius * 2;

        float leftTop = 0;
        if (this.maskedCorners[0] > 0) {
            leftTop = radius;
        }
        float rightTop = 0;
        if (this.maskedCorners[1] > 0) {
            rightTop = radius;
        }
        float leftBottom = 0;
        if (this.maskedCorners[2] > 0) {
            leftBottom = radius;
        }
        float rightBottom = 0;
        if (this.maskedCorners[3] > 0) {
            rightBottom = radius;
        }
        gradient.setCornerRadii(new float[]{ leftTop, leftTop,  rightTop, rightTop,  rightBottom, rightBottom, leftBottom , leftBottom});

        ScaleDrawable scale = new ScaleDrawable(gradient, Gravity.LEFT, 1, -1);
        scale.setLevel((int) (this.progress * 10000));

        this.setBackground(scale);
    }

    // Getter & setter

    public void setProgress(float progress) {
        this.progress = progress;
        this.update();
    }

    public void setCornerRadius(float cornerRadius) {
        this.cornerRadius = cornerRadius;
        this.update();
    }

    public void setFromColor(int fromColor) {
        this.fromColor = fromColor;
        this.update();
    }

    public void setToColor(int toColor) {
        this.toColor = toColor;
        this.update();
    }

    public void setMaskedCorners(ReadableArray maskedCorners) {
        if (maskedCorners == null) {
            this.maskedCorners = sDefaultMaskedCorners;
        } else {
            int[] maskedArr = {
                    maskedCorners.size () >= 1 ? (int) maskedCorners.getInt(0) : 0,
                    maskedCorners.size () >= 2 ? (int) maskedCorners.getInt(1) : 0,
                    maskedCorners.size () >= 3 ? (int) maskedCorners.getInt(2) : 0,
                    maskedCorners.size () >= 4 ? (int) maskedCorners.getInt(3) : 0,
            };
            this.maskedCorners = maskedArr;
        }

        this.update();
    }
}