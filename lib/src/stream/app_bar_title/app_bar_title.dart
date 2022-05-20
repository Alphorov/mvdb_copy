import 'dart:async';
import 'dart:developer';

class AppBarBloc {
  final List<String> _screensNames = ['Новости', 'Фильмы', 'Сериалы'];

// that take number of screen
  final StreamController<int> _eventController = StreamController<int>();
  StreamSink<int> get sink => _eventController.sink;

  final StreamController<String> _stateController = StreamController<String>();
  Stream<String> get stream => _stateController.stream;

  void _mapEventToState(int numberOfPage) {
    _stateController.sink.add(_screensNames[numberOfPage]);
  }

  AppBarBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
