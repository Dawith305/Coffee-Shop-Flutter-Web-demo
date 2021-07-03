class Option{
  int _id;
  String _name;
  int _additionCost;


  Option(this._id,this._name, this._additionCost);


  set id(int value) {
    _id = value;
  }


  int get id => _id;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get additionCost => _additionCost;

  set additionCost(int value) {
    _additionCost = value;
  }
}