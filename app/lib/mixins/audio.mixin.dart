import 'package:app/storage/storage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

mixin class AudioMixin {
  static const backgroundAudioUrl = 'https://file.jjj2.com/files/bgm.mp3';
  static const topUpAudioUrl = 'https://file.jjj2.com/files/deposit.mp3';

  final Map<String, Future<FileInfo>> waitings = {};
  AudioPlayer? _audioPlayer;
  final _cacheManager = DefaultCacheManager();

  // 播放音频
  Future<void> playAudio(String url) async {
    final assetAudio = await _downloadAudioIfNeed(url);
    if (storage.audio.value) {
      await _audioPlayer?.play(assetAudio);
    }
  }

  // 暂停音频
  Future<void> pauseAudio() async {
    await _audioPlayer?.pause();
  }

  // 恢复音频
  Future<void> resumeAudio() async {
    await _audioPlayer?.resume();
  }

  // 激活播放器
  Future<void> activeAudio() async {
    _audioPlayer ??= AudioPlayer();
    playBackgroundAudio();
  }

  // 销毁播放器
  Future<void> deactiveAudio() async {
    _audioPlayer?.dispose();
    _audioPlayer = null;
  }

  playBackgroundAudio([dynamic]) {
    playAudio(backgroundAudioUrl);
    _audioPlayer?.setReleaseMode(ReleaseMode.loop);
  }

  playTopUpAudio() {
    playAudio(topUpAudioUrl);
    _audioPlayer?.setReleaseMode(ReleaseMode.release);
    _audioPlayer?.onPlayerComplete.first.then(playBackgroundAudio);
  }

  initializeAudio() async {
    if (storage.audio.value) {
      activeAudio();
    }
    _downloadAudioIfNeed(backgroundAudioUrl);
    _downloadAudioIfNeed(topUpAudioUrl);
  }

  Future<DeviceFileSource> _downloadAudioIfNeed(String url) async {
    FileInfo? cached = await _cacheManager.getFileFromCache(url);

    if (cached == null) {
      if (!waitings.containsKey(url)) {
        debugPrint('缓存音频开始');
        waitings[url] = _cacheManager.downloadFile(url).whenComplete(() {
          waitings.remove(url);
        });
      }
      cached = await waitings[url]!;
      debugPrint('缓存{$url}成功');
    }
    return DeviceFileSource(cached.file.path);
  }
}
