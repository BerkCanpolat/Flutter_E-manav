import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProjectButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const ProjectButton({super.key,required this.title,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
