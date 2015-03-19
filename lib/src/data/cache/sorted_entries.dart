library uix_todomvc.src.data.cache.sorted_entries;

import '../../env.dart';
import '../store/entry.dart';
import 'cache.dart';

class SortedEntriesList extends CacheNode {
  List<Entry> data = <Entry>[];

  bool update() {
    addTransientSubscription(entryStore.onChange.listen(invalidate));

    data = entryStore.getAll().data.values.toList()
      ..sort((a, b) => a.id - b.id);

    return true;
  }
}

class SortedEntriesCache {
  final SortedEntriesList _entries = new SortedEntriesList();

  SortedEntriesList get entries => _entries..checkUpdates();
}
