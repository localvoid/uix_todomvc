library uix_todomvc.src.data.cache.visible_entries;

import 'package:uix/uix.dart';
import '../store/entry.dart';
import '../store/settings.dart';
import '../../env.dart';

class VisibleEntriesList extends CacheNode {
  List<Entry> data;

  bool update() {
    final entries = sortedEntriesCache.entries;
    final showEntries = settingsStore.showEntries;

    listen(entries);
    listen(showEntries);

    switch (showEntries.value) {
      case ShowType.active:
        data = entries.data.where((i) => !i.completed).toList();
        break;
      case ShowType.completed:
        data = entries.data.where((i) => i.completed).toList();
        break;
      default:
        data = new List<Entry>.from(entries.data);
    }

    return true;
  }
}

class VisibleEntriesCache {
  final VisibleEntriesList _entries = new VisibleEntriesList();

  VisibleEntriesList get entries => _entries..checkUpdates();
}
