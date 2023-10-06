package com.app.util;

import java.util.Locale;
import java.util.ResourceBundle;

public class LocalizationManager {
    private ResourceBundle messages;

    public LocalizationManager(Locale locale) {
        messages = ResourceBundle.getBundle("messages", locale);
    }

    public String getMessage(String key) {
        return messages.getString(key);
    }
}

