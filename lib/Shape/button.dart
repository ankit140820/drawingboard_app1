import 'package:flutter/material.dart';
import 'package:drawingboard/Model/model.dart';


class ShapeWidget extends StatelessWidget {
  final Shape shape;
  final VoidCallback onTap;

  const ShapeWidget({super.key, required this.shape, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = 80.0;
    Widget shapeDisplay;

    switch (shape.type) {
      case ShapeType.circle:
        shapeDisplay = Container(
          width: size,
          height: size,
          decoration: BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
        );
        break;
      case ShapeType.square:
        shapeDisplay = Container(
          width: size,
          height: size,
          color: Colors.brown,
        );
        break;
      case ShapeType.rectangle:
        shapeDisplay = Container(
          width: size * 1.5,
          height: size,
          color: Colors.grey,
        );
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: shapeDisplay,
      ),
    );
  }
}
