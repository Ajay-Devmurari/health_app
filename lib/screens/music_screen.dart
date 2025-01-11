import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditaion_app/screens/app_drawer.dart';
import 'package:meditaion_app/utils/colors.dart';
import 'package:just_audio/just_audio.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setAsset('assets/jalwa.mp3');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _skipForward() async {
    _audioPlayer
        .seek(_audioPlayer.position + const Duration(seconds: 10));
  }

  void _skipBackward() async {
    final currentPosition = _audioPlayer.position;
    _audioPlayer.seek(
      currentPosition - const Duration(seconds: 10) < Duration.zero
          ? Duration.zero
          : currentPosition - const Duration(seconds: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.sizeOf(context).height;
    final double wd = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: SizedBox(
              // width: wd * 0.03,
              height: ht * 0.03,
              child: SvgPicture.asset(
                'assets/hamburger_icon.svg',
                fit: BoxFit.cover,
                color: CustomColor.iconColor,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Calming  Playlist',
                style: TextStyle(
                    fontSize: ht * 0.042,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.textColor),
              ),
            ),
            SizedBox(
              height: ht * 0.010,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    height: ht * 0.5,
                    'assets/check.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: ht * 0.02,
                ),
                Text(
                  'Rain On Glass',
                  style: TextStyle(
                      fontSize: ht * 0.040,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.textColor),
                ),
                Text(
                  'By: Painting with Passion',
                  style: TextStyle(
                      fontSize: wd * 0.04, color: CustomColor.textColor),
                ),
                StreamBuilder<Duration>(
                  stream: _audioPlayer.positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    final duration = _audioPlayer.duration ?? Duration.zero;
                    return Column(
                      children: [
                        Slider(
                          value: position.inSeconds.toDouble(),
                          max: duration.inSeconds.toDouble(),
                          onChanged: (value) {
                            _audioPlayer.seek(Duration(seconds: value.toInt()));
                          },
                        ),
                        Text(
                          "${position.toString().split('.').first} / ${duration.toString().split('.').first}",
                          style: TextStyle(fontSize: wd * 0.04),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.replay_10),
                              iconSize: wd * 0.06,
                              onPressed: _skipBackward,
                            ),
                            IconButton(
                              icon: StreamBuilder<PlayerState>(
                                stream: _audioPlayer.playerStateStream,
                                builder: (context, snapshot) {
                                  final isPlaying =
                                      snapshot.data?.playing ?? false;
                                  return Icon(isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow);
                                },
                              ),
                              iconSize: wd * 0.10,
                              onPressed: () {
                                if (_audioPlayer.playing) {
                                  _audioPlayer.pause();
                                } else {
                                  _audioPlayer.play();
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.forward_10),
                              iconSize: wd * 0.06,
                              onPressed: _skipForward,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
