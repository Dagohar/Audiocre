import 'dart:async';

import 'package:audiocre/widgets/delete_recording_button.dart';
import 'package:audiocre/widgets/pace_slider.dart';
import 'package:audiocre/widgets/piano_tile.dart';
import 'package:audiocre/widgets/play_recording_button.dart';
import 'package:audiocre/widgets/start_recording_button.dart';
import 'package:flutter/material.dart';

StreamController<int> tilesColorController = StreamController<int>.broadcast();

List<PianoTile> pianoTiles = [
  PianoTile(note: 'do_minor', index: 1, stream: tilesColorController.stream),
  PianoTile(note: 're', index: 2, stream: tilesColorController.stream),
  PianoTile(note: 'mi', index: 3, stream: tilesColorController.stream),
  PianoTile(note: 'fa', index: 4, stream: tilesColorController.stream),
  PianoTile(note: 'sol', index: 5, stream: tilesColorController.stream),
  PianoTile(note: 'la', index: 6, stream: tilesColorController.stream),
  PianoTile(note: 'si', index: 7, stream: tilesColorController.stream),
  PianoTile(note: 'do_octave', index: 8, stream: tilesColorController.stream),
];

String sequence = '';
bool isRecording = false, isPlaying = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _tileIndex;

  @override
  Widget build(BuildContext context) {
    _tileIndex = 1;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 25,
                children: const [
                  PaceSlider()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: pianoTiles,
              ),
              const SizedBox(height: 40),
              Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 25,
                children: const [
                  StartRecordingButton(),
                  PlayRecordingButton(),
                ],
              ),
              const SizedBox(height: 30),
              const Center(
                  child: DeleteRecordingButton()
              )
            ],
          ),
        ),
      ),
    );
  }
}
