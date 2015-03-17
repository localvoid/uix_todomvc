import 'dart:html' as html;
import 'package:uix/uix.dart';

import 'app.dart';
import 'components/app.dart' as ui;

main() {
  initUix();

  Application.init();
  final m = ui.createApp();

  scheduler.nextFrame.write().then((_) {
    injectComponent(m, html.querySelector('#todoapp'));
  });
}
