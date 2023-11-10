import 'package:flutter/material.dart';

class ShowAlertDialogFillOut extends StatefulWidget {
  final String title;
  final String content;
  const ShowAlertDialogFillOut({Key? key,
    required this.title,
    required this.content
  }):super(key: key);

  @override
  State<ShowAlertDialogFillOut> createState() => _ShowAlertDialogFillOutState();
}

class _ShowAlertDialogFillOutState extends State<ShowAlertDialogFillOut> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.warning_rounded, size: 50,color: Colors.red),
      title: Text(widget.title),
      content: Text(widget.content),
      actions: [
        TextButton(
            onPressed: () =>
                Navigator.pop(context, 'Cancel'),
            child: Text("돌아가기"))
      ],
    );
  }
}
