class Extra {
  int _max;
  int _min;

  Extra(this._max, this._min);

  int get min => _min;

  set min(int value) {
    _min = value;
  }

  int get max => _max;

  set max(int value) {
    _max = value;
  }
}