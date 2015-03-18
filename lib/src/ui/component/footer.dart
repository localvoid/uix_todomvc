library uix_todomvc.src.ui.component.footer;

import 'package:uix/uix.dart';
import '../../env.dart';
import '../../data/store/settings.dart' as store;
import '../../data/cache/counters.dart' as cache;
import '../../utils.dart';

part 'footer.g.dart';

@ComponentMeta()
class Footer extends Component {
  String get tag => 'footer';

  store.ShowEntries _showEntries;
  cache.Counters _counters;

  init() {
    element.onClick.matches('#clear-completed').listen((e) {
      e.preventDefault();
      entryStore.clearCompleted();
    });
  }

  updateState() {
    _showEntries = settingsStore.showEntries;
    _counters = countersCache.counters;

    listen(_showEntries);
    listen(_counters);

    return true;
  }

  build() {
    const selected = const ['selected'];

    final filters = vElement('ul', attrs: const {'id': 'filters'})([
        vElement('li')(
          vElement('a', attrs: const {'href': '#/'},
             classes: _showEntries == store.ShowType.all ? selected : null)('All')),
        vText(' '),
        vElement('li')(
          vElement('a', attrs: const {'href': '#/active'},
             classes: _showEntries == store.ShowType.active ? selected : null)('Active')),
        vText(' '),
        vElement('li')(
          vElement('a', attrs: const {'href': '#/completed'},
             classes: _showEntries == store.ShowType.completed ? selected : null)('Completed'))
    ]);

    final counter = vElement('span', attrs: const {'id': 'todo-count'})([
        vElement('strong')(_counters.active.toString()),
        vText(' ${pluralize(_counters.active, 'item')} left')
    ]);

    final children = [counter, filters];
    if (_counters.completed > 0) {
      children.add(
          vElement('button', attrs: const {'id': 'clear-completed'})('Clear completed (${_counters.completed})')
      );
    }

    return vRoot(attrs: const {'id': 'footer'})(children);
  }
}