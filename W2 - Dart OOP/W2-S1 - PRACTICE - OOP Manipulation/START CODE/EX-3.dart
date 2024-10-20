class MyDuration {
  final int _milliseconds;

  MyDuration(this._milliseconds)
      : assert(_milliseconds >= 0,
            "Duration shall always be greater or equal to 0!");
  factory MyDuration.fromHours(int hours) => MyDuration(hours * 3600000);
  factory MyDuration.fromMinutes(int minutes) => MyDuration(minutes * 60000);
  factory MyDuration.fromSeconds(int seconds) => MyDuration(seconds * 1000);

  int get getMillisecond => _milliseconds;

  bool operator >(MyDuration other) {
    return this._milliseconds > other._milliseconds;
  }

  MyDuration operator +(MyDuration other) {
    return MyDuration(this._milliseconds + other._milliseconds);
  }

  MyDuration operator -(MyDuration other) {
    int result = this._milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception('Resulting duration cannot be negative');
    }
    return MyDuration(result);
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}


void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
