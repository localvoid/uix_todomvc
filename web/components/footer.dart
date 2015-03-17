library app.components.footer;

import 'package:uix/uix.dart';
import '../stores/settings.dart' as store;
import '../app.dart';
import '../utils.dart';

part 'footer.g.dart';

class FooterProps {
  final int activeCount;
  final int completedCount;

  const FooterProps({this.activeCount, this.completedCount});
}

@ComponentMeta(dirtyCheck: false)
class Footer extends Component<FooterProps> {
  String get tag => 'footer';

  build() {
    const selected = const ['selected'];

    final filters = vElement('ul', attrs: const {'id': 'filters'})([
        vElement('li')(
          vElement('a', attrs: const {'href': '#/'},
             classes: app.settingsStore.showEntries == store.ShowType.all ? selected : null)('All')),
        vText(' '),
        vElement('li')(
          vElement('a', attrs: const {'href': '#/active'},
             classes: app.settingsStore.showEntries == store.ShowType.active ? selected : null)('Active')),
        vText(' '),
        vElement('li')(
          vElement('a', attrs: const {'href': '#/completed'},
             classes: app.settingsStore.showEntries == store.ShowType.completed ? selected : null)('Completed'))
    ]);

    final counter = vElement('span', attrs: const {'id': 'todo-count'})([
        vElement('strong')(data.activeCount.toString()),
        vText(' ${pluralize(data.activeCount, 'item')} left')
    ]);

    final children = [counter, filters];
    if (data.completedCount > 0) {
      children.add(
          vElement('button', attrs: const {'id': 'clear-completed'})('Clear completed ($data.completedCount)')
      );
    }

    return vRoot(attrs: const {'id': 'footer'})(children);
  }
}