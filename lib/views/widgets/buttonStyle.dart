import 'package:flutter/material.dart';
import 'package:tic_tac_task/views/screen/start_screen.dart';

class ButtonInStart extends StatelessWidget {
  const ButtonInStart(
      {Key? key, required this.onTappedButton, required this.title})
      : super(key: key);
  final Function() onTappedButton;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTappedButton,
      child: Container(
        height: 40,
        width: 250,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(250)),
        child: Center(
          child: Text(title.toUpperCase(),
              style: TextStyle(
                  color: Colors.black.withOpacity(.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
