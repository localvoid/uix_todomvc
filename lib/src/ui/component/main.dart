library uix_todomvc.src.ui.component.main;

import 'package:uix/uix.dart';
import 'package:uix_forms/uix_forms.dart';
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
    updateRoot(vRoot(attrs: const {Attr.id: 'main'})([
      vComponent($CheckedInput, data: _checked, attrs: const {Attr.type: 'checkbox', Attr.id: 'toggle-all'}),
      vComponent($EntryList)
    ]));
  }
}
