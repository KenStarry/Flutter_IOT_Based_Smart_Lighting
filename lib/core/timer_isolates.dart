import 'dart:async';
import 'dart:isolate';

class SetTimerModel {
  SendPort sendPort;
  Duration duration;

  SetTimerModel({required this.sendPort, required this.duration});
}

void trackCurrentTimeIsolate(SendPort sendPort) {
  Timer.periodic(const Duration(seconds: 1), (timer) {
    sendPort.send(DateTime.now());
  });
}

void setTimer(SetTimerModel setTimerModel) {
  final targetTimeInSeconds = setTimerModel.duration.inSeconds.toInt();
  var remainingSeconds = targetTimeInSeconds;

  Timer.periodic(const Duration(seconds: 1), (timer) {
    if (remainingSeconds <= 0) {
      timer.cancel();
    } else {
      remainingSeconds--;
    }

    setTimerModel.sendPort.send(remainingSeconds);
  });
}
