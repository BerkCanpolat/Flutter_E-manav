import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProjectOutlieButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Icon icon;
  const ProjectOutlieButton({super.key,required this.title,this.onPressed,required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 55,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        label: Text(title,style: TextStyle(color: Colors.black),),
        icon: icon,
      ),
    );
  }
}
