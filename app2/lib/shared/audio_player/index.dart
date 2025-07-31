import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

import '/storage/index.dart';

class AudioManager {
  static const _bgUrl = "https://dk85.com/music/game_bg.mp3";
  static const _fundsUrl = "https://dk85.com/music/deposit_bg.mp3";
  AudioPlayer? _player;
  StreamSubscription<void>? _subscription;
  get enable => Storage.music.value;
  toggle(bool value) {
    Storage.music.value = value;
    if (value) {
      playBgAudio();
    } else {
      _dispose();
    }
  }

  AudioPlayer _play(String url, ReleaseMode mode) {
    _player ??= AudioPlayer();
    _player!.play(UrlSource(url));
    _player!.setReleaseMode(mode);
    return _player!;
  }

  pause() {
    return _player?.pause();
  }

  playBgAudio() {
    _subscription?.cancel();
    _play(_bgUrl, ReleaseMode.loop);
  }

  playFundsAudio() async {
    _subscription = _play(_fundsUrl, ReleaseMode.stop).onPlayerComplete.listen((_) {
      _subscription?.cancel();
      playBgAudio();
    });
  }

  _dispose() {
    _subscription?.cancel();
    _player?.dispose();
    _player = null;
  }

  startup() {
    if (enable) {
      playBgAudio();
    }
  }
}
