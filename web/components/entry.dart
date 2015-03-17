library app.components.entry;

import 'dart:html' as html;
import 'package:uix/uix.dart';
import 'package:uix/forms.dart';
import '../stores/entry.dart' as store;
import '../app.dart';

part 'entry.g.dart';

@ComponentMeta(dirtyCheck: false)
class Entry extends Component<store.Entry> {
  String get tag => 'li';

  bool _editing = false;
  String _editingTitle = null;
  VNode _input;

  init() {
    element
      ..onKeyDown.matches('.edit')
        .where((e) => e.keyCode == html.KeyCode.ENTER ||
                      e.keyCode == html.KeyCode.ESC)
        .listen(_inputKeyDown)

      ..onInput.matches('.edit')
        .listen(_inputChange)

      ..onDoubleClick.matches('label')
        .listen(_startEdit)

      ..onClick.matches('.destroy')
        .listen(_destroy)

      ..onChange.matches('.toggle')
        .listen(_toggle);

    element.onBlur.capture(_handleBlur);
  }

  void _inputKeyDown(html.KeyboardEvent e) {
    e.preventDefault();
    if (e.keyCode == html.KeyCode.ENTER){
      app.entryStore.updateTitle(data.id, _editingTitle);
    }
    _editing = false;
    _editingTitle = null;
    invalidate();
  }

  void _inputChange(html.Event e) {
    _editingTitle = (e.matchingTarget as html.InputElement).value;
  }

  void _startEdit(_) {
    _editing = true;
    _editingTitle = data.title;
    invalidate();
  }

  void _destroy(_) {
    app.entryStore.remove(data.id);
  }

  void _toggle(_) {
    app.entryStore.toggle(data.id);
  }

  void _handleBlur(html.FocusEvent e) {
    if ((e.target as html.Element).matches('.edit')) {
      if (_editing) {
        app.entryStore.updateTitle(data.id, _editingTitle);
        _editing = false;
        _editingTitle = null;
        invalidate();
      }
    }
  }

  build() {
    final view = vElement('div', type: 'view')([
      vCheckedInput(type: 'toggle', data: data.completed, attrs: const {'type': 'checkbox'}),
      vElement('label')(data.title),
      vElement('button', type: 'destroy')
    ]);

    final children = [view];
    if (_editing) {
      _input = vTextInput(type: 'edit', data: _editingTitle, attrs: const {'type': 'text'});
      children.add(_input);
    } else {
      _input = null;
    }

    final classes = [];
    if (_editing) classes.add('editing');
    if (data.completed) classes.add('completed');

    return vRoot(classes: classes)(children);
  }
}