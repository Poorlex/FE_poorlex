import 'package:audioplayers/audioplayers.dart';

enum AudioType {
  complete,
  congratulation,
  fail,
  ready,
}

/// [사용방법](https://github.com/bluefireteam/audioplayers/blob/main/getting_started.md)
class AudioController {
  AudioController._();
  // factory 생성자
  factory AudioController() {
    return _instance;
  }
  // 싱글톤 인스턴스를 저장할 정적 변수
  static final AudioController _instance = AudioController._();

  static String _complete = "audio/complete_1.wav";
  static String _congratulations = "audio/congratulations_1.wav";
  static String _fail = "audio/fail_1.wav";
  static String _ready = "audio/ready_1.wav";

  final AudioPlayer _audioPlayer = AudioPlayer();

  String _selectAudioAsset({
    required AudioType audioType,
  }) {
    switch (audioType) {
      case AudioType.complete:
        return _complete;
      case AudioType.congratulation:
        return _congratulations;
      case AudioType.fail:
        return _fail;
      case AudioType.ready:
        return _ready;
    }
  }

  Future<void> play({
    required AudioType audioType,
  }) async {
    await _audioPlayer.setSource(
      AssetSource(
        _selectAudioAsset(audioType: audioType),
      ),
    );
    await _resume();
  }

  Future<void> _resume() async {
    await _audioPlayer.resume();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }
}
