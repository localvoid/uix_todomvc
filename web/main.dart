import 'dart:html' as html;
import 'package:route_hierarchical/client.dart';
import 'package:uix/uix.dart';

import 'package:uix_todomvc/src/env.dart';
import 'package:uix_todomvc/src/ui/component/app.dart' as ui;
import 'package:uix_todomvc/src/data/store/settings.dart' as store;

void initRouter() {
  final router = new Router(useFragment: true);
  router.root
    ..addRoute(name: 'showCompleted', path: '/completed', enter: (_) {
      settingsStore.show(store.ShowType.completed);
    })
    ..addRoute(name: 'showActive', path: '/active', enter: (_) {
      settingsStore.show(store.ShowType.active);
    })
    ..addRoute(name: 'showAll', path: '/', defaultRoute: true, enter: (_) {
      settingsStore.show(store.ShowType.all);
    });
  router.listen();
}

main() {
  initUix();

  initEnv();
  initRouter();

  scheduler.nextFrame.write().then((_) {
    injectComponent(new ui.App(), html.querySelector('#todoapp'));
  });
}
