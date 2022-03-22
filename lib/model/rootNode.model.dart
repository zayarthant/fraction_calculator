import 'package:fraction/model/keys.enum.dart';
import 'package:fraction/model/node.model.dart';
import 'package:fraction/model/types.enum.dart';

class RootNode {
  Node? left;
  Node? right;
  Types type;
  Keys key;
  String value;

  RootNode(this.type, this.key, this.value, {this.left, this.right});
}
