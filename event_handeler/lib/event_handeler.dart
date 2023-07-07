library event_handeler;

import 'dart:async';

/// A Calculator.
class CustomEvent {
  final String data;
  final String type;

  CustomEvent(this.data, this.type);
}

class EventManager {
  static EventManager? _instance;

  factory EventManager() {
    _instance ??= EventManager._internal();
    return _instance!;
  }

  EventManager._internal();

  final StreamController<CustomEvent> _eventController =
      StreamController<CustomEvent>.broadcast();

  Stream<CustomEvent> get eventStream => _eventController.stream;

  void dispatchEvent(CustomEvent event) {
    _eventController.sink.add(event);
  }

  // void dispose() {
  //   _eventController.close();
  // }
}

dispatchCustomEvent(var eventValue, var type) {
  final event = CustomEvent(eventValue, type);
  EventManager().dispatchEvent(event);
}

addCustomEventListener(listenForType, callback) {
  EventManager().eventStream.listen((event) {
    print("ok listing..${event.data} ${event.type}");
    if (event.type == listenForType) {
      callback(event.data);
    }
  });
}
