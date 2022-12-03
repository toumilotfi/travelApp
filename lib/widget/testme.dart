import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

/// StopWatchRecord
class StopWatchRecord {
  StopWatchRecord({
    this.day,
    this.rawValue,
    this.hours,
    this.minute,
    this.second,
    this.displayTime,
  });

  int? day;
  int? rawValue;
  int? hours;
  int? minute;
  int? second;
  String? displayTime;
}

/// StopWatch ExecuteType
enum StopWatchExecute { start, stop, reset, lap }

/// StopWatchMode
enum StopWatchMode { countUp, countDown }

/// StopWatchTimer
class StopWatchTimer {
  StopWatchTimer({
    this.isLapHours = true,
    this.mode = StopWatchMode.countUp,
    int presetMillisecond = 0,
    this.onChange,
    this.onChangeRawSecond,
    this.onChangeRawMinute,
    this.onChangeRawHour,
    this.onStop,
    this.onEnded,
  }) {
    /// Set presetTime
    _presetTime = presetMillisecond;
    _initialPresetTime = presetMillisecond;

    _elapsedTime.listen((value) {
      _rawTimeController.add(value);
      if (onChange != null) {
        onChange!(value);
      }
      final latestSecond = getRawSecond(value);
      if (_second != latestSecond) {
        _secondTimeController.add(latestSecond);
        _second = latestSecond;
        if (onChangeRawSecond != null) {
          onChangeRawSecond!(latestSecond);
        }
      }
      final latestMinute = getRawMinute(value);
      if (_minute != latestMinute) {
        _minuteTimeController.add(latestMinute);
        _minute = latestMinute;
        if (onChangeRawMinute != null) {
          onChangeRawMinute!(latestMinute);
        }
      }
      final latestHour = getRawHours(value);
      if (_hour != latestHour) {
        _hourTimeController.add(latestHour);
        _hour = latestHour;
        if (onChangeRawHour != null) {
          onChangeRawHour!(latestHour);
        }
      }
    });
    _executeController.listen((value) {
      switch (value) {
        case StopWatchExecute.start:
          _start();
          break;
        case StopWatchExecute.stop:
          _stop();
          break;
        case StopWatchExecute.reset:
          _reset();
          break;
        case StopWatchExecute.lap:
          _lap();
          break;
      }
    });

    if (mode == StopWatchMode.countDown) {
      _elapsedTime.add(_presetTime);
    }
  }

  final bool isLapHours;
  final StopWatchMode mode;
  final Function(int)? onChange;
  final Function(int)? onChangeRawSecond;
  final Function(int)? onChangeRawMinute;
  final Function(int)? onChangeRawHour;
  final VoidCallback? onStop;
  final VoidCallback? onEnded;

  final PublishSubject<int> _elapsedTime = PublishSubject<int>();

  final BehaviorSubject<int> _rawTimeController =
      BehaviorSubject<int>.seeded(0);

  ValueStream<int> get rawTime => _rawTimeController;

  final BehaviorSubject<int> _secondTimeController =
      BehaviorSubject<int>.seeded(0);

  ValueStream<int> get secondTime => _secondTimeController;

  final BehaviorSubject<int> _hourTimeController =
      BehaviorSubject<int>.seeded(0);

  ValueStream<int> get hourTime => _hourTimeController;

  final BehaviorSubject<int> _minuteTimeController =
      BehaviorSubject<int>.seeded(0);

  ValueStream<int> get minuteTime => _minuteTimeController;

  final BehaviorSubject<List<StopWatchRecord>> _recordsController =
      BehaviorSubject<List<StopWatchRecord>>.seeded([]);

  ValueStream<List<StopWatchRecord>> get records => _recordsController;

  final PublishSubject<StopWatchExecute> _executeController =
      PublishSubject<StopWatchExecute>();

  Stream<StopWatchExecute> get execute => _executeController;

  Sink<StopWatchExecute> get onExecute => _executeController.sink;

  final PublishSubject<bool> _onStopController = PublishSubject<bool>();

  Stream<bool> get fetchStop => _onStopController;

  final PublishSubject<bool> _onEndedController = PublishSubject<bool>();

  Stream<bool> get fetchEnded => _onEndedController;

  bool get isRunning => _timer != null && _timer!.isActive;

  int get initialPresetTime => _initialPresetTime;

  /// Private
  Timer? _timer;
  int _startTime = 0;
  int _stopTime = 0;
  late int _presetTime;
  int? _second;
  int? _minute;
  int? _hour;

  List<StopWatchRecord> _records = [];
  late int _initialPresetTime;

  /// Get display time.
  static String getDisplayTime(
    int value, {
    bool days = true,
    bool hours = true,
    bool minute = true,
    bool second = true,
    bool milliSecond = true,
    String daysRightBreak = ':',
    String hoursRightBreak = ':',
    String minuteRightBreak = ':',
    String secondRightBreak = '.',
  }) {
    final daysStr = getDisplayTimeDays(value);
    final hoursStr = getDisplayTimeHours(value, days: days);
    final mStr = getDisplayTimeMinute(value, hours: hours);
    final sStr = getDisplayTimeSecond(value);
    final msStr = getDisplayTimeMillisecond(value);
    var result = '';
    if (days) {

      result += '$daysStr';
    }
    if (hours) {
      if (days) {
        result += daysRightBreak;
      }
      result += '$hoursStr';
    }
    if (minute) {
      if (hours) {
        result += hoursRightBreak;
      }
      result += '$mStr';
    }
    if (second) {
      if (minute) {
        result += minuteRightBreak;
      }
      result += '$sStr';
    }
    if (milliSecond) {
      if (second) {
        result += secondRightBreak;
      }
      result += '$msStr';
    }
    return result;
  }

  /// Get display hours time.
  ///
  ///
  static String getDisplayTimeDays(int mSec) {
    return getRawdays(mSec).floor().toString().padLeft(2, '0');
  }

  static String getDisplayTimeHours(int mSec, {bool days = false}) {
    if (days) {
      return getHours(mSec).floor().toString().padLeft(2, '0');
    } else {
      return getRawHours(mSec).floor().toString().padLeft(2, '0');
    }
  }

  /// Get display minute time.
  static String getDisplayTimeMinute(int mSec, {bool hours = false}) {
    if (hours) {
      return getMinute(mSec).floor().toString().padLeft(2, '0');
    } else {
      return getRawMinute(mSec).floor().toString().padLeft(2, '0');
    }
  }

  /// Get display second time.
  static String getDisplayTimeSecond(int mSec) {
    final s = (mSec % 60000 / 1000).floor();
    return s.toString().padLeft(2, '0');
  }

  /// Get display millisecond time.
  static String getDisplayTimeMillisecond(int mSec) {
    final ms = (mSec % 1000 / 10).floor();
    return ms.toString().padLeft(2, '0');
  }

  static int getRawdays(int milliSecond) =>
      (milliSecond / (86400 * 1000)).floor();

  /// Get Raw Hours.
  static int getRawHours(int milliSecond) =>
      (milliSecond / (3600 * 1000)).floor();

  /// Get Raw Minute
  static int getRawMinute(int milliSecond) => (milliSecond / 60000).floor();

  static int getHours(int milliSecond) =>
      ((milliSecond / ((7200000) % 24).floor())).floor();

  /// Get Raw Minute. 0 ~ 59. 1 hours = 0.
  static int getMinute(int milliSecond) =>
      (milliSecond / (60 * 1000) % 60).floor();

  /// Get Raw Second
  static int getRawSecond(int milliSecond) => (milliSecond / 1000).floor();

  static int getMilliSecFromDay(int day) => (day * (86400 * 1000)).floor();

  /// Get milli second from hour
  static int getMilliSecFromHour(int hour) => (hour * (3600 * 1000)).floor();

  /// Get milli second from minute
  static int getMilliSecFromMinute(int minute) => (minute * 60000).floor();

  /// Get milli second from second
  static int getMilliSecFromSecond(int second) => (second * 1000).floor();

  /// When finish running timer, it need to dispose.
  Future<void> dispose() async {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }

    await Future.wait<dynamic>([
      _elapsedTime.close(),
      _rawTimeController.close(),
      _secondTimeController.close(),
      _minuteTimeController.close(),
      _hourTimeController.close(),
      _recordsController.close(),
      _executeController.close(),
      _onStopController.close(),
      _onEndedController.close(),
    ]);
  }

  /// Get display millisecond time.
  void setPresetHoursTime(int value, {bool add = true}) =>
      setPresetTime(mSec: value * 3600 * 1000, add: add);

  void setPresetMinuteTime(int value, {bool add = true}) =>
      setPresetTime(mSec: value * 60 * 1000, add: add);

  void setPresetSecondTime(int value, {bool add = true}) =>
      setPresetTime(mSec: value * 1000, add: add);

  /// Set preset time. 1000 mSec => 1 sec
  void setPresetTime({required int mSec, bool add = true}) {
    if (add) {
      _presetTime += mSec;
    } else {
      _presetTime = mSec;
    }
    _elapsedTime.add(_presetTime);
  }

  void clearPresetTime() {
    if (mode == StopWatchMode.countUp) {
      _presetTime = _initialPresetTime;
      _elapsedTime.add(isRunning ? _getCountUpTime(_presetTime) : _presetTime);
    } else if (mode == StopWatchMode.countDown) {
      _presetTime = _initialPresetTime;
      _elapsedTime
          .add(isRunning ? _getCountDownTime(_presetTime) : _presetTime);
    } else {
      throw Exception('No support mode');
    }
  }

  void _handle(Timer timer) {
    if (mode == StopWatchMode.countUp) {
      _elapsedTime.add(_getCountUpTime(_presetTime));
    } else if (mode == StopWatchMode.countDown) {
      final time = _getCountDownTime(_presetTime);
      _elapsedTime.add(time);
      if (time == 0) {
        _stop();
        _onEndedController.add(true);
        if (onEnded != null) {
          onEnded!();
        }
      }
    } else {
      throw Exception('No support mode');
    }
  }

  int _getCountUpTime(int presetTime) =>
      DateTime.now().millisecondsSinceEpoch -
      _startTime +
      _stopTime +
      presetTime;

  int _getCountDownTime(int presetTime) => max(
        presetTime -
            (DateTime.now().millisecondsSinceEpoch - _startTime + _stopTime),
        0,
      );

  void _start() {
    if (!isRunning) {
      _startTime = DateTime.now().millisecondsSinceEpoch;
      _timer = Timer.periodic(const Duration(milliseconds: 1), _handle);
    }
  }

  bool _stop() {
    if (isRunning) {
      _timer!.cancel();
      _timer = null;
      _stopTime += DateTime.now().millisecondsSinceEpoch - _startTime;
      _onStopController.add(true);
      if (onStop != null) {
        onStop!();
      }
      return true;
    } else {
      return false;
    }
  }

  void _reset() {
    if (isRunning) {
      _timer!.cancel();
      _timer = null;
    }
    if (isRunning || _startTime > 0) {
      _onStopController.add(true);
      if (onStop != null) {
        onStop!();
      }
      _onEndedController.add(true);
      if (onEnded != null) {
        onEnded!();
      }
    }

    _startTime = 0;
    _stopTime = 0;
    _second = null;
    _minute = null;
    _hour = null;
    _records = [];
    _recordsController.add(_records);
    _elapsedTime.add(_presetTime);
  }

  void _lap() {
    if (isRunning) {
      final rawValue = _rawTimeController.value;
      _records.add(StopWatchRecord(
        rawValue: rawValue,
        day: getRawdays(rawValue),
        hours: getRawHours(rawValue),
        minute: getRawMinute(rawValue),
        second: getRawSecond(rawValue),
        displayTime: getDisplayTime(rawValue, hours: isLapHours),
      ));
      _recordsController.add(_records);
    }
  }
}
