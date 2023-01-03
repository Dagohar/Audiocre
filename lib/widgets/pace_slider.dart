import 'package:audiocre/constants/app_constants.dart';
import 'package:flutter/material.dart';

late double speed;

class PaceSlider extends StatefulWidget {
  const PaceSlider({Key? key}) : super(key: key);

  @override
  _PaceSliderState createState() => _PaceSliderState();
}

class _PaceSliderState extends State<PaceSlider> {
  double _value = 1;

  @override
  void initState() {
    super.initState();
    speed = _value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Speed', style: buttonTextStyle),
        Slider(
          max: 5,
          divisions: 10,
          value: _value,
          onChanged: (val) {
              setState(() {
                _value = val.clamp(1, 10);
                speed = _value;
              });
            },
          activeColor: Colors.red.withOpacity(0.75),
          inactiveColor: Colors.redAccent.withOpacity(0.4),
          thumbColor: Colors.red,
        ),
      ],
    );
  }
}
