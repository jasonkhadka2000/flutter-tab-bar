import 'package:flutter/material.dart';
import 'package:tabbar/main.dart';

class FirstScreen extends StatefulWidget {
  // const FirstScreen({Key? key}) : super(key: key);
  List<Task> a;
  FirstScreen({required this.a});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {


  Row toRow(Task task)
  {
    return Row(
      children: [
        Text(task.taskName),
        Text(task.taskStatus),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: widget.a.map((e) => toRow(e)).toList(),
          )
      ),
    );

  }
}
