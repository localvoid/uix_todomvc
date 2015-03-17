library app.stores.store;

import 'dart:async';

abstract class Store {
  bool _notifying = false;
  final StreamController _onChangeController = new StreamController.broadcast();
  Stream get onChange => _onChangeController.stream;

  void notify() {
    if (_onChangeController.hasListener) {
      if (!_notifying) {
        _notifying = true;
        scheduleMicrotask(_notifyFinish);
      }
    }
  }

  void _notifyFinish() {
    _notifying = false;
    _onChangeController.add(null);
  }
}