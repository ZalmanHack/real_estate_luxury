package com.company.realestate.utils;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.Map;

@Service
public class ControllerUtils {
    public static Map<String, String> getErrors(BindingResult bindingResult) {
        Map<String, String> errors = new HashMap<String, String>();
        for(FieldError object : bindingResult.getFieldErrors()) {
            errors.put(object.getField() + "Error", object.getDefaultMessage());
        }
        return errors;
    }
}