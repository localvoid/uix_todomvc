library app.components.entry_list;

import 'package:uix/uix.dart';
import '../stores/entry.dart' as store;
import 'entry.dart';

part 'entry_list.g.dart';

@ComponentMeta(dirtyCheck: false)
class EntryList extends Component<List<store.Entry>> {
  String get tag => 'ul';

  build() => vRoot(attrs: const {'id': 'todo-list'})(
      data.map((e) => vEntry(key: e.id, data: e))
    );
}
