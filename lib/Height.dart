import 'dart:ffi';

import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function (int) onChange;
  const HeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {

  int height = 185;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: const RoundedRectangleBorder(),
        elevation: 15,
        child: Column(
          children: [
            const Text(
              'Height',
              style: TextStyle(
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
                    fontSize: 40
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
            Slider(
                value: height.toDouble(),
                onChanged: (value) {
                  setState(() {
                    height = value.toInt();
                  });
                  widget.onChange(height);
                },
            ),
          ],
        ),
      ),
    );
  }
}
