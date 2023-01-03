import 'package:audiocre/constants/app_constants.dart';
import 'package:audiocre/utilities/file_operations.dart';
import 'package:flutter/material.dart';
import 'package:audiocre/screens/home.dart' as home;

class StartRecordingButton extends StatefulWidget {
  const StartRecordingButton({Key? key}) : super(key: key);

  @override
  _StartRecordingButtonState createState() => _StartRecordingButtonState();
}

class _StartRecordingButtonState extends State<StartRecordingButton> {
  late Widget _containerChild;

  changeDisplay() {
    if(home.isRecording) {
      _containerChild = const Center(child: Icon(Icons.stop, size: 30,));
    }
    else {
      _containerChild = const Center(child: Text('Start Recording', style: buttonTextStyle));
    }
  }

  @override
  void initState() {
    super.initState();
    changeDisplay();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if(home.isRecording) {
            FileOperations.writeSequence(home.sequence);
            home.isRecording = false;
          }
          else {
            home.sequence = '';
            home.isRecording = true;
          }

          setState(() {
            changeDisplay();
          });
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onSurface: Colors.redAccent
        ),
        child: Container(
            width: 120,
            height: 50,
            child: _containerChild
        )
    );
  }
}
