import 'package:flutter/material.dart';

class NumericKeyboard extends StatelessWidget {
  final TextEditingController controller;

  NumericKeyboard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(2),
      children: [
        _buildKeyboardButton('1'),
        _buildKeyboardButton('2'),
        _buildKeyboardButton('3'),
        _buildKeyboardButton('4'),
        _buildKeyboardButton('5'),
        _buildKeyboardButton('6'),
        _buildKeyboardButton('7'),
        _buildKeyboardButton('8'),
        _buildKeyboardButton('9'),
        _buildKeyboardButton('Borrar'),
        _buildKeyboardButton('0'),
        _buildKeyboardButton('Limpiar'),
      ],
    );
  }

  Widget _buildKeyboardButton(String key) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          _onKeyPressed(key);
        },
        child: Text(key, style: TextStyle(fontSize: 18)),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
                vertical: 2, horizontal: 2), // Ajusta el tamaño de los botones
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0), // Bordes redondeados
            ),
          ),
        ),
      ),
    );
  }

  void _onKeyPressed(String key) {
    if (key == 'Borrar') {
      if (controller.text.isNotEmpty) {
        controller.text =
            controller.text.substring(0, controller.text.length - 1);
      }
    } else if (key == 'Limpiar') {
      controller.clear();
    } else {
      controller.text += key;
    }
  }
}
