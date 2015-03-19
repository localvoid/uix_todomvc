library uix_todomvc.src.data.store.entry;

import 'dart:collection';
import '../observable.dart';
import 'store.dart';

class Entry extends StoreNode {
  static int _nextId = 0;

  final int id = _nextId++;
  String title;
  bool completed;

  Entry(this.title, [this.completed = false]);

  void toggle() { completed = !completed; }
}

class EntryMap extends StoreNode {
  final HashMap<int, Entry> data = new HashMap<int, Entry>();
}

class EntryStore extends ObservableNode {
  final EntryMap _entries = new EntryMap();

  EntryStore();

  EntryMap getAll() => _entries;
  Entry get(int id) => _entries.data[id];

  void add(String title) {
    title = title.trim();
    if (title.isNotEmpty) {
      final e = new Entry(title);
      _entries.data[e.id] = e;
      _entries.commit();
    }
    notify();
  }

  void remove(int id) {
    _entries.data.remove(id);
    _entries.commit();
    notify();
  }

  void updateTitle(int id, String newTitle) {
    newTitle = newTitle.trim();
    if (newTitle.isEmpty) {
      remove(id);
    } else {
      final e = get(id);
      e.title = newTitle;
      e.commit();
    }
    notify();
  }

  void toggleAll(bool checked) {
    _entries.data.forEach((_, e) {
      e.completed = checked;
      e.commit();
    });
    notify();
  }

  void toggle(int id) {
    final e = get(id);
    e.completed = !e.completed;
    e.commit();
    notify();
  }

  void clearCompleted() {
    for (final e in _entries.data.values.where((i) => i.completed).toList()) {
      _entries.data.remove(e.id);
    }
    _entries.commit();
    notify();
  }
}
