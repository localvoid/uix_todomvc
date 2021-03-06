library uix_todomvc.src.ui.component.entry;

import 'dart:html' as html;
import 'package:uix/uix.dart';
import 'package:uix_forms/uix_forms.dart';
import '../../env.dart';
import '../../data/store/entry.dart' as store;

$Entry() => new Entry();
class Entry extends Component<int> {
  final String tag = 'li';

  bool _editing = false;
  String _editingTitle = null;
  VNode _input;
  store.Entry _entry;

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

  updateState() {
    _entry = entryStore.get(data);
    addTransientSubscription(_entry.onChange.listen(invalidate));

    return true;
  }

  void _inputKeyDown(html.KeyboardEvent e) {
    e.preventDefault();
    if (e.keyCode == html.KeyCode.ENTER){
      entryStore.updateTitle(data, _editingTitle);
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
    _editingTitle = _entry.title;
    invalidate();
    scheduler.nextFrame.after().then((_) {
      if (_input != null) {
        (_input.ref as html.TextInputElement).focus();
      }
    });
  }

  void _destroy(_) {
    entryStore.remove(data);
  }

  void _toggle(_) {
    entryStore.toggle(data);
  }

  void _handleBlur(html.FocusEvent e) {
    if ((e.target as html.Element).matches('.edit')) {
      if (_editing) {
        entryStore.updateTitle(data, _editingTitle);
        _editing = false;
        _editingTitle = null;
        invalidate();
      }
    }
  }

  updateView() {
    final view = vElement('div', type: 'view')([
      vComponent($CheckedInput, type: 'toggle', data: _entry.completed, attrs: const {Attr.type: 'checkbox'}),
      vElement('label')(_entry.title),
      vElement('button', type: 'destroy')
    ]);

    final children = [view];
    if (_editing) {
      _input = vComponent($TextInput, type: 'edit', data: _editingTitle, attrs: const {Attr.type: 'text'});
      children.add(_input);
    } else {
      _input = null;
    }

    final classes = [];
    if (_editing) classes.add('editing');
    if (_entry.completed) classes.add('completed');

    updateRoot(vRoot(classes: classes)(children));
  }
}
