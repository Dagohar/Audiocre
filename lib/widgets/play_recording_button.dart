import 'dart:async';

import 'package:audiocre/constants/app_constants.dart';
import 'package:audiocre/utilities/file_operations.dart';
import 'package:flutter/material.dart';
import 'package:audiocre/screens/home.dart' as home;
import 'package:audiocre/widgets/pace_slider.dart' as pace_slider;

class PlayRecordingButton extends StatefulWidget {
  const PlayRecordingButton({Key? key}) : super(key: key);

  @override
  _PlayRecordingButtonState createState() => _PlayRecordingButtonState();
}

class _PlayRecordingButtonState extends State<PlayRecordingButton> {
  late bool _recordingNotEmpty = false;

  // check if there is any saved recording
  updateRecordingState() async {
    String contents = await FileOperations.readSequence();

    setState(() {
      _recordingNotEmpty = contents != '';
    });
  }

  // play the sequence according to the saved sequence from the file
  playSequence() async {
    String sequence = await FileOperations.readSequence();

    for(int i = 0; i < sequence.length; i++) {
      int index = int.parse(sequence[i]);
      int speed = (500 / pace_slider.speed).round();

      home.tilesColorController.add(index); // invoke listeners event (change tile color)
      home.pianoTiles.elementAt(index - 1).playNote();
      await Future.delayed(Duration(milliseconds: speed));
    }

    home.tilesColorController.add(-1); // clear all tiles color
    home.isPlaying = false;
  }

  @override
  void initState() {
    super.initState();

    // execute updateRecordingState every 0.25 second
    Timer.periodic(const Duration(milliseconds: 250), (timer) => updateRecordingState());
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _recordingNotEmpty && !home.isPlaying ? () {
          home.isPlaying = true;
          playSequence();
        } : null,
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onSurface: Colors.redAccent
        ),
        child: Container(
            width: 120,
            height: 50,
            child: const Center(child: Text('Play Recording', style: buttonTextStyle))
        )
    );
  }
}
