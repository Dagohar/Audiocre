import 'package:audiocre/constants/app_constants.dart';
import 'package:audiocre/utilities/file_operations.dart';
import 'package:flutter/material.dart';

class DeleteRecordingButton extends StatefulWidget {
  const DeleteRecordingButton({Key? key}) : super(key: key);

  @override
  _DeleteRecordingButtonState createState() => _DeleteRecordingButtonState();
}

class _DeleteRecordingButtonState extends State<DeleteRecordingButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          FileOperations.deleteSequence();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onSurface: Colors.redAccent
        ),
        child: Container(
            width: 160,
            height: 60,
            child: const Center(child: Text('Delete Recording', style: buttonTextStyle))
        )
    );
  }
}

