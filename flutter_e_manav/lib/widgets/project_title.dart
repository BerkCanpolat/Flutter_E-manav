import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProjectTitle extends StatelessWidget {
  final String title,subtitle,doublesubtitle;
  const ProjectTitle({super.key,required this.title,required this.subtitle,required this.doublesubtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
        )),
        SizedBox(
          height: 12,
        ),
        Text(
          subtitle,
          style: TextStyle(letterSpacing: 1),
        ),
        SizedBox(height: 5,),
        Text(
          doublesubtitle,
          style: TextStyle(letterSpacing: 1),
        ),
      ],
    );
  }
}
