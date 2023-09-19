class MeasureUnit {
  final int id;
  final String _one;
  final String _few;
  final String _many;
  final num _value;

  MeasureUnit(
    this.id,
    this._one,
    this._few,
    this._many,
    this._value,
  );

  @override
  String toString() {
    if (_value < 0) {
      return '';
    }

    if (_value == 0) {
      return _one;
    }

    if (_value == 1) {
      return '$_value $_one';
    }

    if (_value < 5) {
      return '$_value $_few';
    }

    return '$_value $_many';
  }
}
