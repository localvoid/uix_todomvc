library app.stores.entry;

import 'store.dart';

class Entry {
  static int _nextId = 0;

  final id = _nextId++;
  String title;
  bool completed;

  Entry(this.title, [this.completed = false]);

  void toggle() { completed = !completed; }
}

class EntryStore extends Store {
  final List<Entry> entries = new List<Entry>();

  void add(String title) {
    title = title.trim();
    if (title.isNotEmpty) {
      entries.add(new Entry(title));
      notify();
    }
  }

  void remove(int id) {
    for (var i = 0; i < entries.length; i++) {
      if (entries[i].id == id) {
        entries.removeAt(i);
        break;
      }
    }
    notify();
  }

  void updateTitle(int id, String newTitle) {
    newTitle = newTitle.trim();
    if (newTitle.isEmpty) {
      remove(id);
    } else {
      final entry = entries.firstWhere((i) => i.id == id);
      entry.title = newTitle;
      notify();
    }
  }

  void toggleAll(bool checked) {
    for (final e in entries) {
      e.completed = checked;
    }
    notify();
  }

  /// Toggle completed flag of Todo item
  void toggle(int id) {
    final entry = entries.firstWhere((i) => i.id == id);
    entry.completed = !entry.completed;
    notify();
  }


  void clearCompleted() {
    entries.removeWhere((i) => i.completed);
    notify();
  }
}

