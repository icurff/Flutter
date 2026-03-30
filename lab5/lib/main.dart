
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Lab5"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.lightGreen,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            KeyboardWidget(
                colorKey: const Color.fromARGB(255, 255, 173, 173), number: 1),
            KeyboardWidget(
                colorKey: const Color.fromARGB(255,253, 255, 182), number: 2),
            KeyboardWidget(
                colorKey: const Color.fromARGB(255, 202, 255, 191), number: 3),
            KeyboardWidget(
                colorKey: const Color.fromARGB(255,155, 246, 255), number: 4),
            KeyboardWidget(
                colorKey: const Color.fromARGB(255, 160, 196, 255), number: 5),
            KeyboardWidget(
                colorKey: const Color.fromARGB(255,189, 178, 255), number: 6),
            KeyboardWidget(
                colorKey: const Color.fromARGB(255, 255, 198, 255), number: 7)
          ],
        ),
      ),
    );
  }
}

class KeyboardWidget extends StatelessWidget {
  final Color colorKey;
  final int number;
  final AudioPlayer audioPlayer = AudioPlayer();

  void playSound(int number){
    audioPlayer.play(AssetSource("assets/sounds/note$number.wav"));
  }
  KeyboardWidget({super.key, required this.colorKey, required this.number, });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
          onPressed: (){
            playSound(number);
          },
          color: colorKey
      ),
    );
  }}