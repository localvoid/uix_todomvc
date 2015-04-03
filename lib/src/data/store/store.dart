library uix_todomvc.src.data.store.store;

import 'package:uix/uix.dart';
import '../observable.dart';

abstract class StoreNode extends RevisionedNode with ObservableNode {
  void commit() {
    updateRevision();
    notify();
  }
}