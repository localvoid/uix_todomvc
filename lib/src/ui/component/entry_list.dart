library uix_todomvc.src.ui.component.entry_list;

import 'package:uix/uix.dart';
import '../../env.dart';
import '../../data/store/entry.dart' as store;
import 'entry.dart';

$EntryList() => new EntryList();
class EntryList extends Component {
  final String tag = 'ul';

  List<store.Entry> _entries;

  updateState() {
    final entries = visibleEntriesCache.entries;
    addTransientSubscription(entries.onChange.listen(invalidate));
    _entries = entries.data;

    return true;
  }

  updateView() {
    updateRoot(vRoot(attrs: const {Attr.id: 'todo-list'})(
        _entries.map((e) => vComponent($Entry, key: e.id, data: e.id))
    ));
  }
}
