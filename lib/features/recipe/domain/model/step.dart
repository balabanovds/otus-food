class Step {
  final int id;
  final int stepNumber;
  final String text;
  final Duration _duration;

  Step(this.id, this.stepNumber, this.text, this._duration);

  String get duration => _printHoursMinutesSeconds(_duration);

  String _printHoursMinutesSeconds(Duration d) {
    var buf = StringBuffer();

    final int hours = d.inHours.remainder(24);

    if (hours > 0) {
      buf.write(hours.toString().padLeft(2, "0"));
      buf.write(':');
    }

    final int minutes = d.inMinutes.remainder(60);

    if (minutes > 0) {
      buf.write(minutes.toString().padLeft(2, "0"));
      buf.write(':');
    }

    final int seconds = d.inSeconds.remainder(60);
    buf.write(seconds.toString().padLeft(2, "0"));

    return buf.toString();
  }
}
