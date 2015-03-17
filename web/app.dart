library app;

import 'dart:async';
import 'stores/settings.dart';
import 'stores/entry.dart';

class Application {
  final SettingsStore settingsStore = new SettingsStore();
  final EntryStore entryStore = new EntryStore();

  final StreamController _onChangeController = new StreamController.broadcast();
  Stream get onChange => _onChangeController.stream;

  void _forwardChange(v) { _onChangeController.add(v); }

  Application() {
    settingsStore.onChange.listen(_forwardChange);
    entryStore.onChange.listen(_forwardChange);
  }

  static void init() {
    app = new Application();
  }
}

Application app;
