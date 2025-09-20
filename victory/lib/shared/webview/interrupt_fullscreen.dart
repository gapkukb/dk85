part of 'webview.dart';

final _interruptFullscreenScript = '''

Element.prototype.requestFullscreen = function() {
  console.log("已拦截 requestFullscreen 调用");
  return Promise.reject(new Error("全屏已被拦截"));
};

['fullscreenchange', 'webkitfullscreenchange', 'mozfullscreenchange', 'msfullscreenchange'].forEach(event => {
  document.addEventListener(event, () => {
    if (
      document.fullscreenElement ||
      document.webkitFullscreenElement ||
      document.mozFullScreenElement ||
      document.msFullscreenElement
    ) {
      console.log("退出全屏");
      if (document.exitFullscreen) document.exitFullscreen();
      else if (document.webkitExitFullscreen) document.webkitExitFullscreen();
      else if (document.mozCancelFullScreen) document.mozCancelFullScreen();
      else if (document.msExitFullscreen) document.msExitFullscreen();
    }
  });
});
''';
