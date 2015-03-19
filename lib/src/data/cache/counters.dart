library uix_todomvc.src.data.cache.counters;

import '../../env.dart';
import 'cache.dart';

class Counters extends CacheNode {
  int all = 0;
  int active = 0;
  int completed = 0;

  bool update() {
    bool dirty = false;

    addTransientSubscription(entryStore.onChange.listen(invalidate));

    final entryMap = entryStore.getAll();

    final entries = entryMap.data.values.toList();

    final newAll = entries.length;
    final newActive = entries.fold(0, (acc, i) {
      return i.completed ? acc : acc + 1;
    });
    final newCompleted = newAll - newActive;

    if (all != newAll) {
      all = newAll;
      dirty = true;
    }
    if (active != newActive) {
      active = newActive;
      dirty = true;
    }
    if (completed != newCompleted) {
      completed = newCompleted;
      dirty = true;
    }

    return dirty;
  }
}

class CountersCache {
  Counters _counters = new Counters();

  Counters get counters => _counters..checkUpdates();
}
