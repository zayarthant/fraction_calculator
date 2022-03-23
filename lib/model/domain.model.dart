import 'package:fraction/model/keys.enum.dart';
import 'package:fraction/model/types.enum.dart';

class DomainModel {
  final Types _type;
  final Keys _key;
  String _value;

  DomainModel(this._type, this._key, this._value);

  String get value => _value;

  Types get type => _type;

  Keys get key => _key;

  void put(String s) {
    _value = _value + s;
  }

  void pop() {
    if (_value.length < 1) {
      return;
    }
    _value = _value.substring(0, _value.length - 1);
  }
}
