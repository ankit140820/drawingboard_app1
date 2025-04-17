import 'package:drawingboard/Model/model.dart';
import 'package:drawingboard/Shape//button.dart';
import 'package:flutter/material.dart';

class dba_1 extends StatefulWidget {
  const dba_1({super.key});

  @override
  State<dba_1> createState() => _dba_1State();
}

class _dba_1State extends State<dba_1> {
  final List<Shape> _shapes = [];

  void _addShape(ShapeType type) {
    try {
      setState(() {
        _shapes.add(
          Shape(
            type: type,
            history: _shapes.map((s) => s.type).toList(),
          ),
        );
      });
    } catch (e) {
      _showError('Failed to add shape: $e');
    }
  }

  void _replaceShape(int index) {
    try {
      final history = List<ShapeType>.from(_shapes[index].history);
      if (history.isEmpty) {
        setState(() => _shapes.removeAt(index));
      } else {
        final last = history.removeLast();
        setState(() {
          _shapes[index] = Shape(type: last, history: history);
        });
      }
    } catch (e) {
      _showError('Error replacing shape: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,title: const Text("Drawing Board")),
      body: Column(
        children: [
          Expanded(
            child: _shapes.isEmpty
                ? const Center(child: Text("Tap a shape below to begin!"))
                : SingleChildScrollView(
              child: Wrap(
                children: List.generate(
                  _shapes.length,
                      (index) => ShapeWidget(
                    shape: _shapes[index],
                    onTap: () => _replaceShape(index),
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)
                  ,
                  onPressed: () => _addShape(ShapeType.circle),
                  child: const Text("Circle"),
                ),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)
                  ,onPressed: () => _addShape(ShapeType.square),
                  child: const Text("Square"),
                ),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)
                  ,
                  onPressed: () => _addShape(ShapeType.rectangle),
                  child: const Text("Rectangle"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
