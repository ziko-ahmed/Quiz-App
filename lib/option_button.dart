import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton(this.option, this.onTap, {super.key});

  final String option;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(option, textAlign: TextAlign.center),
    );
  }
}
