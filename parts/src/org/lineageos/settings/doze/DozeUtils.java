/*
 * Copyright (C) 2015 The CyanogenMod Project
 *               2017-2019 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.doze;

import android.content.Context;
import android.content.Intent;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.os.UserHandle;
import android.provider.Settings;
import android.util.Log;

import static android.provider.Settings.Secure.DOZE_ALWAYS_ON;
import static android.provider.Settings.Secure.DOZE_PICK_UP_GESTURE;

public final class DozeUtils {

    private static final String TAG = "DozeUtils";
    private static final boolean DEBUG = false;

    private static final String PULSE_INTENT = "com.android.systemui.doze.pulse";

    public static void startService(Context context) {
        if (DEBUG)
            Log.d(TAG, "Starting service");
        context.startServiceAsUser(new Intent(context, DozeService.class),
                    UserHandle.CURRENT);
    }

    public static boolean isAlwaysOnEnabled(Context context) {
        return Settings.Secure.getInt(context.getContentResolver(),
                    DOZE_ALWAYS_ON, 1) != 0;
    }

    public static boolean isPickUpEnabled(Context context) {
        return Settings.Secure.getInt(context.getContentResolver(),
                    DOZE_PICK_UP_GESTURE, 1) != 0;
    }

    protected static void requestPulse(Context context) {
        context.sendBroadcastAsUser(new Intent(PULSE_INTENT),
                    new UserHandle(UserHandle.USER_CURRENT));
    }

    protected static Sensor getSensor(SensorManager sm, String type) {
        for (Sensor sensor : sm.getSensorList(Sensor.TYPE_ALL)) {
            if (type.equals(sensor.getStringType())) {
                return sensor;
            }
        }
        return null;
    }
}
