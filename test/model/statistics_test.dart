import 'package:adwatcher/model/statistics.dart';
import 'package:test/test.dart';

void main() {
  test('Statistics are correctly initiated', () {
    final statistics = Statistics();

    expect(statistics.adsWatched, 0);
    expect(statistics.adsWatchedOnCurrentDay, 0);
    expect(statistics.mostAdsWatchedInASingleDay, 0);
    expect(statistics.lastAdWatchedDate.compareTo(DateTime.now()) < 0, true);
  });

  test('Statistics are correctly updated once one ad is watched', () {
    Statistics statistics = Statistics();
    final createdAt = statistics.lastAdWatchedDate;

    final laterDate = DateTime(
      createdAt.year,
      createdAt.month,
      createdAt.day,
      createdAt.hour,
      createdAt.minute + 5,
      createdAt.second,
      createdAt.millisecond,
      createdAt.microsecond,
    );

    statistics.didWatchAd(atDate: laterDate);

    expect(statistics.adsWatched, 1);
    expect(statistics.adsWatchedOnCurrentDay, 1);
    expect(statistics.mostAdsWatchedInASingleDay, 1);
    expect(statistics.lastAdWatchedDate.compareTo(laterDate), 0);
  });

  test('Statistics are correctly updated when watching multiple adds on the same day', () {
    Statistics statistics = Statistics();
    statistics.didWatchAd();
    expect(statistics.adsWatched, 1);
    expect(statistics.adsWatchedOnCurrentDay, 1);
    expect(statistics.mostAdsWatchedInASingleDay, 1);

    statistics.didWatchAd();
    expect(statistics.adsWatched, 2);
    expect(statistics.adsWatchedOnCurrentDay, 2);
    expect(statistics.mostAdsWatchedInASingleDay, 2);

    statistics.didWatchAd();
    expect(statistics.adsWatched, 3);
    expect(statistics.adsWatchedOnCurrentDay, 3);
    expect(statistics.mostAdsWatchedInASingleDay, 3);
  });

  test('Statistics are correctly updated when watching multiple adds on different days', () {
    Statistics statistics = Statistics();
    final laterDate = DateTime(
      statistics.lastAdWatchedDate.year,
      statistics.lastAdWatchedDate.month,
      statistics.lastAdWatchedDate.day+1,
      statistics.lastAdWatchedDate.hour,
      statistics.lastAdWatchedDate.minute,
      statistics.lastAdWatchedDate.second,
      statistics.lastAdWatchedDate.millisecond,
      statistics.lastAdWatchedDate.microsecond,
    );

    statistics.didWatchAd();
    expect(statistics.adsWatched, 1);
    expect(statistics.adsWatchedOnCurrentDay, 1);
    expect(statistics.mostAdsWatchedInASingleDay, 1);

    statistics.didWatchAd();
    expect(statistics.adsWatched, 2);
    expect(statistics.adsWatchedOnCurrentDay, 2);
    expect(statistics.mostAdsWatchedInASingleDay, 2);

    statistics.didWatchAd(atDate: laterDate);
    expect(statistics.adsWatched, 3);
    expect(statistics.adsWatchedOnCurrentDay, 1);
    expect(statistics.mostAdsWatchedInASingleDay, 2);
    expect(statistics.lastAdWatchedDate.compareTo(laterDate), 0);
  });
}
