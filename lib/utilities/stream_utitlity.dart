import 'dart:async';


class StreamUtil {
  StreamController streamController;
  StreamUtil(this.streamController);

  Timer? timer;
  void pollingStream(Function getter, int seconds) {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: seconds), (timer) async {
      var data = await getter();
      streamController.add(data);
    });
  }

  void dispose() {
    streamController.close();
    timer?.cancel();
  }

  Stream get stream => streamController.stream;
}
