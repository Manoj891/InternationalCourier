
package com.ms.ware.online.solution.config.calendar;


import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateConverted {

    private static final BikramSambatConverter converter = new BikramSambatConverter();
    private static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    private static final SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static String today() {
        return df.format(new Date());
    }

    public static String now() {
        return dateTime.format(new Date());
    }


    public static String toString(Date date) {
        return df.format(date);
    }


    public static String adToBs(Date date) {
        return converter.convertAdToBs(date.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDate());
    }

    public static String adToBs(String date) {
        return converter.convertAdToBs(LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
    }


}

