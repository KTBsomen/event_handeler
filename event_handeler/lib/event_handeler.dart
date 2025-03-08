library event_handeler;

import 'dart:async';

/// A custom event that carries data and a type.
class CustomEvent {
  /// The data associated with the event.
  final dynamic data;

  /// The type/category of the event.
  final dynamic type;

  /// Creates a new custom event with the provided [data] and [type].
  CustomEvent(this.data, this.type);
}

/// Manages event broadcasting and listening.
class EventManager {
  static EventManager? _instance;

  /// Returns a singleton instance of [EventManager].
  factory EventManager() {
    _instance ??= EventManager._internal();
    return _instance!;
  }

  EventManager._internal();

  /// A stream controller for broadcasting events.
  final StreamController<CustomEvent> _eventController =
      StreamController<CustomEvent>.broadcast();

  /// Provides a stream of incoming events.
  Stream<CustomEvent> get eventStream => _eventController.stream;

  /// Dispatches an event to all active listeners.
  void dispatchEvent(CustomEvent event) {
    _eventController.sink.add(event);
  }

  /// Closes the event stream controller.
  void dispose() {
    _eventController.close();
  }
}

/// Dispatches a new event with the given [eventValue] and [type].
void dispatchCustomEvent(var eventValue, var type) {
  final event = CustomEvent(eventValue, type);
  EventManager().dispatchEvent(event);
}

/// Listens for events of a specific [listenForType] and executes the [callback] when an event is received.
StreamSubscription addCustomEventListener(
    String listenForType, Function(dynamic) callback) {
  return EventManager().eventStream.listen((event) {
    if (event.type == listenForType) {
      callback(event.data);
    }
  });
}

/// Add a one-time event listener (auto-disposes after first event)
void addOneTimeEventListener(
    dynamic listenForType, Function(dynamic) callback) {
  late StreamSubscription subscription;

  subscription = addCustomEventListener(listenForType, (data) {
    callback(data);
    subscription.cancel(); // Automatically remove listener after first event
  });
}
