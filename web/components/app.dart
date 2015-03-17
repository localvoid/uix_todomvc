library app.components.app;

import 'package:uix/uix.dart';
import '../stores/settings.dart' as store;
import '../app.dart';
import 'header.dart';
import 'main.dart';
import 'footer.dart';

part 'app.g.dart';

@ComponentMeta()
class App extends Component {
  String get tag => 'section';

  init() {
    app.onChange.listen((_) {
      invalidate();
    });
  }

  build() {
    final entries = app.entryStore.entries;
    final showEntries = app.settingsStore.showEntries;

    final shownTodos = entries.where((i) {
      switch (showEntries) {
        case store.ShowType.active:
          return !i.completed;
        case store.ShowType.completed:
          return i.completed;
        default:
          return true;
      }
    }).toList();

    final activeCount = entries.fold(0, (acc, i) {
      return i.completed ? acc : acc + 1;
    });

    final completedCount = entries.length - activeCount;

    final children = [vHeader(key: #header)];

    if (shownTodos.isNotEmpty) {
      children.add(vMain(key: #main, data: new MainProps(entries: shownTodos, activeCount: activeCount)));
    }
    if (activeCount > 0 || completedCount > 0) {
      children.add(vFooter(key: #footer,
                           data: new FooterProps(activeCount: activeCount,
                                                 completedCount: completedCount)));
    }

    return vRoot(attrs: const {'id': 'main'})(children);
  }
}
