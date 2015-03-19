library uix_todomvc.src.data.cache.visible_entries;

import '../../env.dart';
import '../store/entry.dart';
import '../store/settings.dart';
import 'cache.dart';

class VisibleEntriesList extends CacheNode {
  List<Entry> data;

  bool update() {
    final sortedEntries = sortedEntriesCache.entries;
    final showEntries = settingsStore.showEntries;

    addSubscriptionOneShot(sortedEntries.onChange.listen(invalidate));
    addSubscriptionOneShot(showEntries.onChange.listen(invalidate));

    switch (showEntries.value) {
      case ShowType.active:
        data = sortedEntries.data.where((i) => !i.completed).toList();
        break;
      case ShowType.completed:
        data = sortedEntries.data.where((i) => i.completed).toList();
        break;
      default:
        data = new List<Entry>.from(sortedEntries.data);
    }

    return true;
  }
}

class VisibleEntriesCache {
  final VisibleEntriesList _entries = new VisibleEntriesList();

  VisibleEntriesList get entries => _entries..checkUpdates();
}
