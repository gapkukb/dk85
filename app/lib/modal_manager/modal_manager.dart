import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalInstance {
  final String id;
  final int priority;
  final Widget Function() builder;

  ModalInstance({
    required this.id,
    required this.priority,
    required this.builder,
  });
}

abstract class ModalManager {
  static var _isOpen = false;
  static final _queue = <ModalInstance>[];

  static add(ModalInstance modal) async {
    print("_isOpen$_isOpen");
    if (_isOpen) {
      _queue.add(modal);
    } else {
      _isOpen = true;
      await Get.dialog(modal.builder());
      while (_queue.isNotEmpty) {
        await Future.delayed(Durations.medium2);
        await Get.dialog(_queue.first.builder());
        _queue.removeAt(0);
      }
      _isOpen = false;
    }
  }

  static remove(ModalInstance modal) {
    _queue.remove(modal);
  }
}
