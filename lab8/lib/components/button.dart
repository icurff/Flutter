import 'package:flutter/material.dart';

const double _bottomContainerHeight = 80.0;
const Color _bottomContainerColour = Color(0xFFEB1555);
const TextStyle _largeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: _bottomContainerColour,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: _bottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: _largeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
