import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final List<String?> data;
  final int latestIndex;
  const CustomDialog({
    super.key,
    required this.data,
    required this.latestIndex,
  });

  @override
  Widget build(BuildContext context) {
    ConfettiController controller =
        ConfettiController(duration: const Duration(seconds: 4));
    controller.play();

    return ConfettiWidget(
        confettiController: controller,
        blastDirectionality: BlastDirectionality.explosive,
        numberOfParticles: 35,
        shouldLoop: false,
        colors: const [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.orange,
          Colors.purple,
        ],
        child: Container(
            width: MediaQuery.of(context).size.width / 4,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: data.length * 45,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: index == latestIndex ? Colors.blue[50] : null,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Flex(direction: Axis.horizontal, children: [
                            Text(
                              "${index + 1}.",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Text(
                                style: TextStyle(color: Colors.grey[900]),
                                data[index]!,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            )));
  }
}
