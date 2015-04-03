library uix_todomvc.src.ui.component.app;

import 'package:uix/uix.dart';
import '../../env.dart';
import 'header.dart';
import 'main.dart';
import 'footer.dart';

part 'app.g.dart';

@ComponentMeta()
class App extends Component {
  String get tag => 'section';
  bool _showMain;
  bool _showFooter;

  updateState() {
    final visibleEntries = visibleEntriesCache.entries;
    final counters = countersCache.counters;

    addTransientSubscription(visibleEntries.onChange.listen(invalidate));
    addTransientSubscription(counters.onChange.listen(invalidate));

    _showMain = visibleEntries.data.isNotEmpty;
    _showFooter = ((counters.active > 0) || (counters.completed > 0));

    return true;
  }

  updateView() {
    final children = [vComponent($Header, key: #header)];

    if (_showMain) {
      children.add(vComponent($Main, key: #main));
    }
    if (_showFooter) {
      children.add(vComponent($Footer, key: #footer));
    }

    updateRoot(vRoot(attrs: const {'id': 'main'})(children));
  }
}
