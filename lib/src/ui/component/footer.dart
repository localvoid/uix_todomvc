library uix_todomvc.src.ui.component.footer;

import 'package:uix/uix.dart';
import '../../env.dart';
import '../../data/store/settings.dart' as store;
import '../../data/cache/counters.dart' as cache;
import '../../utils.dart';

$Footer() => new Footer();
class Footer extends Component {
  final String tag = 'footer';

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

    addTransientSubscription(_showEntries.onChange.listen(invalidate));
    addTransientSubscription(_counters.onChange.listen(invalidate));

    return true;
  }

  updateView() {
    const selected = const ['selected'];

    final filters = vElement('ul', attrs: const {Attr.id: 'filters'})([
        vElement('li')(
          vElement('a', attrs: const {Attr.href: '#/'},
             classes: _showEntries.value == store.ShowType.all ? selected : null)('All')),
        vText(' '),
        vElement('li')(
          vElement('a', attrs: const {Attr.href: '#/active'},
             classes: _showEntries.value == store.ShowType.active ? selected : null)('Active')),
        vText(' '),
        vElement('li')(
          vElement('a', attrs: const {Attr.href: '#/completed'},
             classes: _showEntries.value == store.ShowType.completed ? selected : null)('Completed'))
    ]);

    final counter = vElement('span', attrs: const {Attr.id: 'todo-count'})([
        vElement('strong')(_counters.active.toString()),
        vText(' ${pluralize(_counters.active, 'item')} left')
    ]);

    final children = [counter, filters];
    if (_counters.completed > 0) {
      children.add(
          vElement('button', attrs: const {Attr.id: 'clear-completed'})('Clear completed (${_counters.completed})')
      );
    }

    updateRoot(vRoot(attrs: const {Attr.id: 'footer'})(children));
  }
}