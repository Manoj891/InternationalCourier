package com.ms.ware.online.solution.config.calendar;

import java.time.LocalDate;

public class BikramSambatConverter {
    private final BikramSambatCalendar calendar=new BikramSambatCalendar();
    private static final LocalDate START_AD = LocalDate.of(1943, 4, 14); // AD start
    private static final int START_BS_YEAR = 2000;
    private static final int START_BS_MONTH = 1;
    private static final int START_BS_DAY = 1;



    public String convertAdToBs(LocalDate adDate) {
        if (adDate.isBefore(START_AD)) {
            throw new IllegalArgumentException("Date before supported range.");
        }

        // Calculate total days from START_AD to target adDate
        long totalDays = java.time.temporal.ChronoUnit.DAYS.between(START_AD, adDate);

        // Start from base BS date
        int bsYear = START_BS_YEAR;
        int bsMonth = START_BS_MONTH;
        int bsDay = START_BS_DAY;

        // Add days to BS date
        while (totalDays > 0) {
            int daysInMonth = calendar.getDaysInMonth(bsYear, bsMonth);
            if (bsDay < daysInMonth) {
                bsDay++;
            } else {
                bsDay = 1;
                if (bsMonth < 12) {
                    bsMonth++;
                } else {
                    bsMonth = 1;
                    bsYear++;
                    if (calendar.isSupportedYear(bsYear)) {
                        throw new IllegalArgumentException("Date exceeds supported BS calendar range.");
                    }
                }
            }
            totalDays--;
        }

        // Format as yyyy-MM-dd
        return String.format("%04d-%02d-%02d", bsYear, bsMonth, bsDay);
    }

    public LocalDate convertBsToAd(int bsYear, int bsMonth, int bsDay) {
        if (calendar.isSupportedYear(bsYear)) {
            throw new IllegalArgumentException("Unsupported BS year: " + bsYear);
        }

        int totalDays = 0;

        // Step 1: Add days from complete years
        int referenceBsYear = 2000;
        for (int y = referenceBsYear; y < bsYear; y++) {
            for (int m = 1; m <= 12; m++) {
                totalDays += calendar.getDaysInMonth(y, m);
            }
        }

        // Step 2: Add days from complete months in the target year
        for (int m = 1; m < bsMonth; m++) {
            totalDays += calendar.getDaysInMonth(bsYear, m);
        }

        // Step 3: Add days in the target month
        int referenceBsDay = 1;
        totalDays += (bsDay - referenceBsDay);

        // Step 4: Return the corresponding AD date
        return START_AD.plusDays(totalDays);
    }
}
