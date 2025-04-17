enum ShapeType { circle, square, rectangle }

class Shape {
  final ShapeType type;
  final List<ShapeType> history;

  Shape({required this.type, required this.history});

  Shape copyWith({ShapeType? type, List<ShapeType>? history}) {
    return Shape(
      type: type ?? this.type,
      history: history ?? this.history,
    );
  }
}
