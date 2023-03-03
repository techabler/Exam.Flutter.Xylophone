import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: XylophonePlay(),
    );
  }
}

class XylophonePlay extends StatefulWidget {
  //const XylophonePlay({Key? key}) : super(key: key);

  @override
  State<XylophonePlay> createState() => _XylophonePlayState();
}

class _XylophonePlayState extends State<XylophonePlay> {
  AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    _assetsAudioPlayer = AssetsAudioPlayer();

    _assetsAudioPlayer.open(
      Audio('assets/note1.wav'),
    );

    _assetsAudioPlayer.playOrPause();

    super.initState();
  }

  @override
  void dispose() {
    _assetsAudioPlayer = null;
    super.dispose();
  }

  void playSound(int soundNumber) {
    _assetsAudioPlayer.open(Audio('assets/note$soundNumber.wav'));
    _assetsAudioPlayer.play();
  }

  Widget buildKey({Color mColor, int mSoundNum}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: mColor),
        onPressed: () {
          playSound(mSoundNum);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(mColor: Colors.red, mSoundNum: 1),
              buildKey(mColor: Colors.orange, mSoundNum: 2),
              buildKey(mColor: Colors.yellow, mSoundNum: 3),
              buildKey(mColor: Colors.green, mSoundNum: 4),
              buildKey(mColor: Colors.teal, mSoundNum: 5),
              buildKey(mColor: Colors.blue, mSoundNum: 6),
              buildKey(mColor: Colors.purple, mSoundNum: 7),
            ],
          ),
        ),
      ),
    );
  }
}
