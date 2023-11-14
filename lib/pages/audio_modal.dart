// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioModal extends StatefulWidget {
  final List<File> pickedAudios;
  final Future<List<File>> Function() onAudiosSelected;

  const AudioModal({super.key, required this.pickedAudios, required this.onAudiosSelected});

  @override
  _AudioModalState createState() => _AudioModalState();
}

class _AudioModalState extends State<AudioModal> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double sliderValue = 0.0;
  Duration duration = const Duration();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String audioFileName = widget.pickedAudios.isNotEmpty
        ? widget.pickedAudios.first.path.split('/').last
        : '';

    return AlertDialog(
      content: SingleChildScrollView(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'Seleccionar Audio',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (widget.pickedAudios.isNotEmpty) ...[
                Column(
                  children: [
                    Text(
                      'Nombre del Audio: $audioFileName',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon:
                              Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                          onPressed: () {
                            if (isPlaying) {
                              audioPlayer.pause();
                            } else {
                              audioPlayer.resume();
                            }
                            setState(() {
                              isPlaying = !isPlaying;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.stop),
                          onPressed: () {
                            audioPlayer.stop();
                            setState(() {
                              isPlaying = false;
                              sliderValue =
                                  0.0; // Reiniciar el valor del Slider al detener el audio
                            });
                          },
                        ),
                      ],
                    ),
                    Slider(
                      value: sliderValue,
                      min: 0.0,
                      max: duration.inSeconds.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                          audioPlayer.seek(Duration(seconds: value.toInt()));
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(248, 181, 149, 1)),
                  ),
                  onPressed: () {
                    widget.onAudiosSelected().then((List<File> newAudios) {
                      setState(() {
                        widget.pickedAudios.clear();
                        widget.pickedAudios.addAll(newAudios);
                        isPlaying = false;
                        audioPlayer.stop();
                      });
                    });
                  },
                  child: const Text('Cambiar audio'),
                ),
              ],
              if (widget.pickedAudios.isEmpty) ... [
                  SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      widget.onAudiosSelected().then((List<File> newAudios) {
                        setState(() {
                          widget.pickedAudios.addAll(newAudios);
                          isPlaying = false;
                          audioPlayer.stop();
                        });
                      });
                    },
                    icon: const Icon(
                      Icons.music_note,
                      size: 50,
                    ),
                    label: const SizedBox.shrink(),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      backgroundColor: const Color.fromRGBO(248, 181, 149, 1),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

