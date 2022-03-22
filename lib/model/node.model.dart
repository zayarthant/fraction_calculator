import 'package:fraction/model/keys.enum.dart';
import 'package:fraction/model/types.enum.dart';

class Node {
  Node parent;
  Node? left;
  Node? right;
  Types type;
  Keys key;
  String value;

  Node(
    this.type,
    this.key,
    this.value, {
    required this.parent,
    this.left,
    this.right,
  });
}
