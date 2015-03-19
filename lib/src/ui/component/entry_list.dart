library uix_todomvc.src.ui.component.entry_list;

import 'package:uix/uix.dart';
import '../../env.dart';
import '../../data/store/entry.dart' as store;
import 'entry.dart';

part 'entry_list.g.dart';

@ComponentMeta()
class EntryList extends Component {
  String get tag => 'ul';

  List<store.Entry> _entries;

  updateState() {
    final entries = visibleEntriesCache.entries;
    addSubscriptionOneShot(entries.onChange.listen(invalidate));
    _entries = entries.data;

    return true;
  }

  build() => vRoot(attrs: const {'id': 'todo-list'})(
      _entries.map((e) => vEntry(key: e.id, data: e.id))
    );
}
