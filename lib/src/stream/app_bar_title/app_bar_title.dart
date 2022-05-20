import 'dart:async';

class AppBarBloc {
  final String _appBarText = 'Новости';

// that take number of screen
  final StreamController<int> _eventController = StreamController<int>();
  StreamSink<int> get sink => _eventController.sink;

  final StreamController<String> _stateController = StreamController<String>();
  Stream<String> get stream => _stateController.stream;

  void _mapEventToState(int numberOfPage) {
    if (numberOfPage == 0) {
      _appBarText == 'Новости';
    } else if (numberOfPage == 1) {
      _appBarText == 'Фильмы';
    } else if (numberOfPage == 2) {
      _appBarText == 'Сериалы';
    } else {
      throw 'Type error';
    }
    _stateController.sink.add(_appBarText);
  }

  AppBarBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
