import 'package:flutter/material.dart';

@Deprecated('Seeking new way to implement')
class ButtonActionNotifier with ChangeNotifier {
  String _data = '';
  String _message = '';
  bool _isLineOpen = true;
  List<_Sequence> list = [];

  String get data => _data;

  String get message => _message;

  set data(String value) {
    if (isNumeric(value))
      _number(int.parse(value));
    else
      _elements(value);
    notifyListeners();
  }

  bool isNumeric(String s) {
    return int.tryParse(s) != null;
  }

  void _number(int value) {
    if (list.isEmpty) _openParentheses();
    if (list.last.value != ')') {
      if (list.last.type == _Type.NUMBER)
        list.last = list.last.concat(value.toString());
      else
        this.list.add(_Sequence(type: _Type.NUMBER, value: value.toString()));
      this._data = _data + value.toString();
    } else {
      this._message = 'Parentheses not allowed behind the!' +
          list.last.type.toString().toLowerCase();
    }
  }

  void _elements(String s) {
    switch (s) {
      case '(':
        _openParentheses();
        break;
      case ')':
        _closeParentheses();
        break;
      case 'AC':
        _allClear();
        break;
      case 'DEL':
        _delete();
        break;
      case '=':
        break;
      case '/':
        _line();
        break;
      case '+':
      case '-':
      case '×':
      case '÷':
        _operator(s);
        break;
    }
  }

  void _openParentheses() {
    if (list.isEmpty ||
        list.last.type == _Type.OPERATOR ||
        list.last.value == '(') {
      this.list.add(_Sequence(type: _Type.PARENTHESES, value: '('));
      this._data = _data + '(';
    } else {
      this._message = 'Parentheses not allowed behind the!' +
          list.last.type.toString().toLowerCase();
    }
  }

  void _closeParentheses() {
    if (list.isNotEmpty && list.last.type == _Type.NUMBER) {
      this.list.add(_Sequence(type: _Type.PARENTHESES, value: ')'));
      this._data = _data + ')';
      this._isLineOpen = true;
    } else {
      this._message = 'Parentheses not allowed behind the!' +
          list.last.type.toString().toLowerCase();
    }
  }

  void _line() {
    if (this._isLineOpen && list.last.type == _Type.NUMBER) {
      this.list.add(_Sequence(type: _Type.LINE, value: '/'));
      this._data = _data + '/';
      this._isLineOpen = false;
    } else {
      this._message = 'Parentheses not allowed behind the!' +
          list.last.type.toString().toLowerCase();
    }
  }

  void _operator(String value){
    if (list.isNotEmpty && list.last.value == ')') {
      this.list.add(_Sequence(type: _Type.OPERATOR, value: value));
      this._data = _data + value;
    } else {
      this._message = 'Parentheses not allowed behind the!' +
          list.last.type.toString().toLowerCase();
    }
  }

  void _allClear() {
    this.list = [];
    this._data = '';
    this._message = '';
  }

  void _delete() {
    if (this.list.last.value.length < 2)
      this.list.removeLast();
    else
      this.list.last = this.list.last.removeLastChar();
    this._data = _data.substring(0, _data.length - 1);
    this._message = '';
  }
}

class _Sequence {
  final _Type type;
  final String value;

  _Sequence({required this.type, required this.value});

  _Sequence concat(String value) {
    return _Sequence(type: this.type, value: this.value + value);
  }

  _Sequence removeLastChar() {
    return _Sequence(
        type: this.type, value: value.substring(0, value.length - 1));
  }
}

enum _Type { OPERATOR, NUMBER, PARENTHESES, LINE }

enum _Operator { PLUS, MINUS, MULTIPLY, DEVICE, ANSWER }

enum _Parentheses { OPEN, CLOSE }
