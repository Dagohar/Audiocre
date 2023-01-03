import 'package:audiocre/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audiocre/screens/home.dart' as home;

class PianoTile extends StatefulWidget {
  final String note;
  final int index;

  late Stream<int> stream;
  late Function playNote;

  PianoTile({Key? key, required this.note, required this.index, required this.stream}) : super(key: key);

  @override
  _PianoTileState createState() => _PianoTileState();
}

class _PianoTileState extends State<PianoTile> {
  late AudioPlayer _player;
  Color _tileColor = Colors.white;

  changeColorOnPlay(int index) async {
    setState(() {
      _tileColor = index == widget.index ? Colors.lightGreen : Colors.white;
    });
  }

  playNote() async {
    await _player.setAsset(
        'assets/${widget.note}.wav'
    ).catchError((error) {
      print('An error occurred! $error');
    });

    if(home.isRecording) {
      home.sequence += widget.index.toString();
    }

    _player.play();
  }

  @override
  void initState() {
    super.initState();

    // add listener to tilesColorController
    widget.stream.listen((index) {
      changeColorOnPlay(index);
    });
    widget.playNote = playNote;
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          color: _tileColor,
          boxShadow: const <BoxShadow> [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2.0, 4.0),
            ),
          ]
      ),
      width: 40,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          playNote();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.greenAccent,
          elevation: 0,
          shape: const ContinuousRectangleBorder()
        ),
        child: Text(widget.index.toString(), style: tileTextStyle, textAlign: TextAlign.center),
      ),
    );
  }
}
