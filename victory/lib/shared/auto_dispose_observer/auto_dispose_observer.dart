import 'package:victory/shared/logger/logger.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

mixin AutoDisposeObserver on GetxController {
  /// Worker 释放管理
  final List<Worker> _disposableWorkers = [];

  /// rx 对象释放管理
  final disposeBag = CompositeSubscription();

  /// 手动释放Worker
  disposeWorker(Worker worker) {
    worker.dispose();
    _disposableWorkers.remove(worker);
  }

  Worker autoEver<T>(
    RxInterface<T> listener,
    WorkerCallback<T> callback, {
    dynamic condition = true,
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    final w = ever(listener, callback, condition: condition, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    _disposableWorkers.add(w);
    return w;
  }

  Worker autoEverAll(
    List<RxInterface> listeners,
    WorkerCallback callback, {
    dynamic condition = true,
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    final w = everAll(listeners, callback, condition: condition, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    _disposableWorkers.add(w);
    return w;
  }

  Worker autoOnce<T>(
    RxInterface<T> listener,
    WorkerCallback<T> callback, {
    dynamic condition = true,
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    final w = once(listener, callback, condition: condition, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    _disposableWorkers.add(w);
    return w;
  }

  Worker autoInterval<T>(
    RxInterface<T> listener,
    WorkerCallback<T> callback, {
    dynamic condition = true,
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    final w = interval(listener, callback, condition: condition, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    _disposableWorkers.add(w);
    return w;
  }

  Worker autoDebounce<T>(
    RxInterface<T> listener,
    WorkerCallback<T> callback, {
    Duration? time,
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    final w = debounce(listener, callback, time: time, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    _disposableWorkers.add(w);
    return w;
  }

  @override
  void onClose() {
    for (final w in _disposableWorkers) {
      w.dispose();
    }
    _disposableWorkers.clear();
    disposeBag.cancel();
    Logger.debug("controller dispose: $runtimeType");
    super.onClose();
  }
}
