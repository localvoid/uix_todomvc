library uix_todomvc.src.data.store.settings;

import 'package:uix/uix.dart';

enum ShowType {
  all,
  active,
  completed
}

class ShowEntries extends StoreNode {
  ShowType value = ShowType.all;
}

class SettingsStore {
  ShowEntries _showEntries = new ShowEntries();
  ShowEntries get showEntries => _showEntries;

  void show(ShowType s) {
    _showEntries.value = s;
    _showEntries.commit();
  }
}
