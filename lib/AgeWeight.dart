import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {

  final Function(int) onChange;
  final int initValue;
  final int min;
  final int max;
  final String title;

  const AgeWeightWidget({Key? key,
    required this.onChange,
    required this.initValue,
    required this.min,
    required this.max,
    required this.title,
  }) : super(key: key);

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {

  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 100,
        width: 130,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          elevation: 15,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (counter > widget.min) {
                            counter--;
                          }
                        });
                        widget.onChange(counter);
                      },
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.amber,
                        child: Icon(
                            Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      counter.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      child: const CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 12,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (counter < widget.max) {
                            counter++;
                          }
                        });
                        widget.onChange(counter);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}