import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getView(1, Colors.red),
              getView(2, Colors.yellow),
              getView(3, Colors.green),
              getView(4, Colors.lime),
              getView(5, Colors.brown),
              getView(6, Colors.blueAccent),
              getView(7, Colors.purple),
              // Expanded(
              //   child: TextButton(
              //     child: Text("Play"),
              //     onPressed:(){
              //       final audioPlayer = AudioPlayer();
              //       audioPlayer.play(AssetSource('assets_note1.wav'));
              //     }),
              // ),
              // Expanded(
              //   child: TextButton(
              //     child: Text("Play"),
              //     onPressed:(){
              //       final audioPlayer = AudioPlayer();
              //       audioPlayer.play(AssetSource('assets_note2.wav'));
              //     }),
              // ),
              // Expanded(
              //   child: TextButton(
              //     child: Text("Play"),
              //     onPressed:(){
              //       final audioPlayer = AudioPlayer();
              //       audioPlayer.play(AssetSource('assets_note3.wav'));
              //     }),
              // ),
              // Expanded(
              //   child: TextButton(
              //     child: Text("Play"),
              //     onPressed:(){
              //       final audioPlayer = AudioPlayer();
              //       audioPlayer.play(AssetSource('assets_note4.wav'));
              //     }),
              // ),
              // Expanded(
              //   child: TextButton(
              //     child: Text("Play"),
              //     onPressed:(){
              //       final audioPlayer = AudioPlayer();
              //       audioPlayer.play(AssetSource('assets_note5.wav'));
              //     }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getView(int pos, Color color) {
  return Expanded(
    child:TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: (){
        playSound(pos);
      },
      child: Text("PLAY "),)
      );
}

void playSound(int pos) {
  final audioPlayer = AudioPlayer();
  audioPlayer.play(AssetSource('note$pos.wav'));
}