import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function (int) onChange;
  const HeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {

  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        elevation: 15,
        child: Column(
          children: [
            const Text(
              'Height',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  height.toString(),
                  style: const TextStyle(
                    fontSize: 35
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'cm',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: Colors.amber,
                inactiveTrackColor: Colors.amber.shade100,
                thumbColor: Colors.amber,
                overlayColor: Colors.amber.shade200,
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius:35
              ),
                valueIndicatorColor: Colors.amber,
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 15,
                ),
                trackHeight: 5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    buildSideLabel(min(0,0)),
                    Expanded(
                      child: Slider(
                        min: 0,
                        max: 250,
                        label: height.round().toString(),
                        divisions: 250,
                        value: height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                          widget.onChange(height);
                          },
                      ),
                    ),
                    buildSideLabel(max(250,250)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSideLabel(int height) => Text(
    height.round().toString(),
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}