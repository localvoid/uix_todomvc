library app.components.components;

import 'dart:html' as html;
import 'package:uix/uix.dart';
import 'package:uix/forms.dart';
import '../app.dart';

part 'header.g.dart';

@ComponentMeta()
class Header extends Component {
  String get tag => 'header';
  String _input = '';

  init() {
    element
      ..onKeyDown
        .matches('#new-todo')
        .where((e) => e.keyCode == html.KeyCode.ENTER)
        .listen(_submit)

      ..onInput
        .matches('#new-todo')
        .listen(_updateInput);
  }

  void _submit(html.KeyboardEvent e) {
    e.preventDefault();
    app.entryStore.add(_input);
    _input = '';
    invalidate();
  }

  void _updateInput(html.Event e) {
    _input = (e.target as html.InputElement).value;
  }

  build() => vRoot()([
      vElement('h1')('todos'),
      vTextInput(
          data: _input,
          attrs: const {
            'id': 'new-todo',
            'type': 'text',
            'placeholder': 'What needs to be done',
            'autofocus': 'true'
          })
    ]);
}