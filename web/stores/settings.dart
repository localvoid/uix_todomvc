library app.stores.settings;

import 'store.dart';

enum ShowType {
  all,
  active,
  completed
}

class SettingsStore extends Store {
  ShowType _showEntries = ShowType.all;
  ShowType get showEntries => _showEntries;
  set showEntries(ShowType t) {
    if (_showEntries != t) {
      _showEntries = t;
      notify();
    }
  }
}
