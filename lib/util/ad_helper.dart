import 'dart:io';

class AdHelper {
  static String get testingAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw UnsupportedError("");
    }
  }

  static String get realAdUnitid {
    if (Platform.isAndroid) {
      return "ca-app-pub-1659380120025565/2153069168";
    } else if (Platform.isIOS) {
      return "ca-app-pub-1659380120025565/7329659633";
    } else {
      throw UnsupportedError("");
    }
  }
}
