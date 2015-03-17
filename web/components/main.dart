library app.components.main;

import 'package:uix/uix.dart';
import 'package:uix/forms.dart';
import '../stores/entry.dart' as store;
import '../app.dart';
import 'entry_list.dart';

part 'main.g.dart';

class MainProps {
  final List<store.Entry> entries;
  final int activeCount;

  const MainProps({this.entries, this.activeCount});
}

@ComponentMeta(dirtyCheck: false)
class Main extends Component<MainProps> {
  String get tag => 'section';

  init() {
    element.onChange.matches('#toggle-all').listen(_toggleAll);
  }

  void _toggleAll(_) {
    app.entryStore.toggleAll(!(data.activeCount == 0));
  }

  build() {
    return vRoot(attrs: const {'id': 'main'})([
      vCheckedInput(data: data.activeCount == 0, attrs: {'type': 'checkbox', 'id': 'toggle-all'}),
      vEntryList(data: data.entries)
    ]);
  }
}
