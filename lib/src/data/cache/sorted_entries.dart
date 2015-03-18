library uix_todomvc.src.data.cache.sorted_entries;

import 'package:uix/uix.dart';
import '../store/entry.dart';
import '../../env.dart';

class SortedEntriesList extends CacheNode {
  List<Entry> data = <Entry>[];

  bool update() {
    final entries = entryStore.getAll();
    listen(entries);

    data = entries.data.values.toList()
      ..sort((a, b) => a.id - b.id);

    return true;
  }
}

class SortedEntriesCache {
  final SortedEntriesList _entries = new SortedEntriesList();

  SortedEntriesList get entries => _entries..checkUpdates();
}
