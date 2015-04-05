library uix_todomvc.src.ui.component.main;

import 'package:uix/uix.dart';
import 'package:uix/forms.dart';
import '../../env.dart';
import 'entry_list.dart';

$Main() => new Main();
class Main extends Component {
  String get tag => 'section';

  bool _checked;

  init() {
    element.onChange.matches('#toggle-all').listen(_toggleAll);
  }

  updateState() {
    final counters = countersCache.counters;
    addTransientSubscription(counters.onChange.listen(invalidate));

    _checked = (counters.active == 0);
    return true;
  }

  void _toggleAll(_) {
    entryStore.toggleAll(!_checked);
  }

  updateView() {
    updateRoot(vRoot(attrs: const {'id': 'main'})([
      vComponent($CheckedInput, data: _checked, attrs: {'type': 'checkbox', 'id': 'toggle-all'}),
      vComponent($EntryList)
    ]));
  }
}
