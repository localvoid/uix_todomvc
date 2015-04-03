// Copyright (c) 2015, the uix project authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library uix_todomvc.src.data.cache.cache;

import 'package:uix/uix.dart';
import '../observable.dart';

abstract class CacheNode extends RevisionedNode with StreamListenerNode, ObservableNode {
  bool isDirty = true;

  void invalidate([_]) {
    if (!isDirty) {
      isDirty = true;
      resetTransientSubscriptions();
      notify();
      invalidated();
    }
  }

  void invalidated() {}

  void checkUpdates() {
    if (isDirty) {
      isDirty = false;
      if (update()) {
        updateRevision();
      }
    }
  }

  bool update();
}
