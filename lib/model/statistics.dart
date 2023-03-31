import 'dart:math';

import 'package:flutter/material.dart';

class Statistics {
  int adsWatched = 0;
  int mostAdsWatchedInASingleDay = 0;

  int adsWatchedOnCurrentDay = 0;
  DateTime lastAdWatchedDate = DateTime.now();

  Statistics();
  Statistics.fromExistingData({
    required this.adsWatched,
    required this.mostAdsWatchedInASingleDay,
    required this.adsWatchedOnCurrentDay,
    required this.lastAdWatchedDate,
  });

  void didWatchAd({DateTime? atDate}) {
    adsWatched += 1;

    final dateWatched = atDate ?? DateTime.now();
    if (DateUtils.isSameDay(lastAdWatchedDate, dateWatched)) {
      adsWatchedOnCurrentDay += 1;
      mostAdsWatchedInASingleDay = max(mostAdsWatchedInASingleDay, adsWatchedOnCurrentDay);
    } else {
      adsWatchedOnCurrentDay = 1;
    }

    lastAdWatchedDate = dateWatched;
  }
}
