import 'package:flutter/material.dart';

import 'main.dart';

abstract class AppModel extends ChangeNotifier {
  void incrementCounter();

  int get counter;
}

class AppModelImplementation extends AppModel {
  int _counter = 0;

  AppModelImplementation() {
    /// lets pretend we have to do some async initialization
    /// using signalReady is not necessary in most cases
    /// just use registerSingletonAsync instead
    Future.delayed(
      const Duration(seconds: 3),
    ).then((_) => getIt.signalReady(this));
  }

  @override
  int get counter => _counter;

  @override
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
