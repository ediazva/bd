package org.bd;

import java.text.NumberFormat;
import java.util.Locale;

public class FormatFloat {
  public static String format(float f) {
    NumberFormat formatter = NumberFormat.getNumberInstance(Locale.US); 
    formatter.setMinimumFractionDigits(2);
    formatter.setMaximumFractionDigits(2);

    return formatter.format(f);
  }
}
