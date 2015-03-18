library uix_todomvc.src.env;

import 'data/store/entry.dart';
import 'data/store/settings.dart';
import 'data/cache/counters.dart';
import 'data/cache/sorted_entries.dart';
import 'data/cache/visible_entries.dart';

EntryStore entryStore;
SettingsStore settingsStore;

CountersCache countersCache;
SortedEntriesCache sortedEntriesCache;
VisibleEntriesCache visibleEntriesCache;

initEnv() {
  entryStore = new EntryStore();
  settingsStore = new SettingsStore();
  countersCache = new CountersCache();
  sortedEntriesCache = new SortedEntriesCache();
  visibleEntriesCache = new VisibleEntriesCache();
}
