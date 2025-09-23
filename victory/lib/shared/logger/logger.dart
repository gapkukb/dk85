import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;
import 'dart:convert';

/// 日志工具类
/// 用于替换生产代码中的print语句，支持彩色输出
class Logger {
  // ANSI 颜色代码
  static const String _colorReset = '\x1B[0m';
  static const String _colorRed = '\x1B[31m';
  static const String _colorGreen = '\x1B[32m';
  static const String _colorYellow = '\x1B[33m';
  static const String _colorBlue = '\x1B[34m';
  // static const String _colorMagenta = '\x1B[35m';
  static const String _colorCyan = '\x1B[36m';
  static const String _colorWhite = '\x1B[37m';
  // static const String _colorGray = '\x1B[90m';
  static const String _colorBgRed = '\x1B[41m';

  /// 生成时间戳
  static String _getTimestamp() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:'
        '${now.minute.toString().padLeft(2, '0')}:'
        '${now.second.toString().padLeft(2, '0')}.'
        '${now.millisecond.toString().padLeft(3, '0')}';
  }

  /// 格式化日志消息
  static String _formatMessage(String message, String color, String emoji) {
    final timestamp = _getTimestamp();
    if (kDebugMode) {
      return '$color[$timestamp] $emoji $message$_colorReset';
    } else {
      return '[$timestamp] $emoji $message';
    }
  }

  /// 错误日志
  static void error(String message, {String? color, Object? error, StackTrace? stackTrace, String? tag}) {
    final formattedMessage = _formatMessage(message, color ?? _colorRed, '❌');
    developer.log(formattedMessage, name: tag ?? 'ERROR', level: 1000, error: error, stackTrace: stackTrace);
  }

  /// 警告日志
  static void warning(String message, {String? color, String? tag}) {
    final formattedMessage = _formatMessage(message, color ?? _colorYellow, '⚠️');
    developer.log(formattedMessage, name: tag ?? 'WARNING', level: 900);
  }

  /// 信息日志
  static void info(String message, {String? color, String? tag}) {
    final formattedMessage = _formatMessage(message, color ?? _colorBlue, 'ℹ️');
    developer.log(formattedMessage, name: tag ?? 'INFO', level: 800);
  }

  /// 调试日志
  static void debug(String message, {String? color, String? tag}) {
    final formattedMessage = _formatMessage(message, color ?? _colorGreen, '🐞');
    developer.log(formattedMessage, name: tag ?? 'DEBUG', level: 700);
  }

  /// 成功日志
  static void success(String message, {String? color}) {
    final formattedMessage = _formatMessage('SUCCESS: $message', color ?? _colorGreen, '❤️');
    developer.log(formattedMessage, name: 'SUCCESS', level: 800);
  }

  /// 致命错误日志
  static void fatal(String message, {Object? error, StackTrace? stackTrace}) {
    final formattedMessage = _formatMessage(message, _colorBgRed + _colorWhite, '💀');
    developer.log(formattedMessage, name: 'FATAL', level: 1200, error: error, stackTrace: stackTrace);
  }

  /// 网络日志
  static void network(
    String message, {
    String? method,
    String? url,
    int? statusCode,
    Map<String, dynamic>? headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    String? errorCode,
    String? errorMessage,
    Object? error,
    StackTrace? stackTrace,
  }) {
    String color = _colorCyan;
    String emoji = '🌐';
    int level = 800;

    // 根据消息内容区分Request和Response颜色
    final bool isResponse = message.contains('Response Success');

    if (error != null || stackTrace != null) {
      color = _colorRed;
      emoji = '🔥';
      level = 1000;
    } else if (statusCode != null && statusCode >= 400) {
      color = _colorYellow;
      emoji = '⚠️';
      level = 900;
    } else if (isResponse) {
      // Response使用绿色
      color = _colorGreen;
      emoji = '✅';
    } else {
      // Request保持现有的青色
      color = _colorCyan;
      emoji = '🌐';
    }

    // 构建完整的日志消息，每行都单独格式化颜色
    final StringBuffer logBuffer = StringBuffer();

    // 添加主要消息
    logBuffer.writeln(_formatMessage('[NETWORK] $message', color, emoji));

    // 添加详细信息
    if (method != null) {
      logBuffer.writeln(_formatMessage('[NETWORK] Method: $method', color, emoji));
    }

    if (url != null) {
      logBuffer.writeln(_formatMessage('[NETWORK] URL: $url', color, emoji));
    }

    if (statusCode != null) {
      logBuffer.writeln(_formatMessage('[NETWORK] Status: $statusCode', color, emoji));
    }

    if (errorCode != null) {
      logBuffer.writeln(_formatMessage('[NETWORK] Error Code: $errorCode', color, emoji));
    }

    if (errorMessage != null) {
      logBuffer.writeln(_formatMessage('[NETWORK] Error Message: $errorMessage', color, emoji));
    }

    if (headers != null && headers.isNotEmpty) {
      logBuffer.writeln(_formatMessage('[NETWORK] Headers:', color, emoji));
      final headersStr = const JsonEncoder.withIndent('  ').convert(headers);
      final headersLines = headersStr.split('\n');
      for (final line in headersLines) {
        if (line.trim().isNotEmpty) {
          logBuffer.writeln(_formatMessage('[NETWORK] $line', color, emoji));
        }
      }
    }

    if (queryParameters != null && queryParameters.isNotEmpty) {
      logBuffer.writeln(_formatMessage('[NETWORK] Query Parameters:', color, emoji));
      final queryStr = const JsonEncoder.withIndent('  ').convert(queryParameters);
      final queryLines = queryStr.split('\n');
      for (final line in queryLines) {
        if (line.trim().isNotEmpty) {
          logBuffer.writeln(_formatMessage('[NETWORK] $line', color, emoji));
        }
      }
    }

    if (body != null) {
      final bodyStr = _formatBody(body);
      if (bodyStr.isNotEmpty) {
        logBuffer.writeln(_formatMessage('[NETWORK] Body:', color, emoji));
        final bodyLines = bodyStr.split('\n');
        for (final line in bodyLines) {
          if (line.trim().isNotEmpty) {
            logBuffer.writeln(_formatMessage('[NETWORK] $line', color, emoji));
          }
        }
      }
    }

    // 添加分割线
    logBuffer.writeln(_formatMessage('[NETWORK] ${'─' * 50}', color, emoji));

    // 直接输出完整消息，不再重复格式化
    developer.log(logBuffer.toString().trim(), name: 'NETWORK', level: level, error: error, stackTrace: stackTrace);
  }

  /// 格式化Body内容
  static String _formatBody(dynamic body) {
    if (body == null) return '';

    try {
      if (body is String) {
        // 尝试解析JSON字符串
        final parsed = json.decode(body);
        return const JsonEncoder.withIndent('  ').convert(parsed);
      } else if (body is Map || body is List) {
        return const JsonEncoder.withIndent('  ').convert(body);
      } else {
        return body.toString();
      }
    } catch (e) {
      // 如果解析失败，返回原始字符串
      return body.toString();
    }
  }

  /// WebSocket日志
  static void websocket(String message, {String? event}) {
    final logMessage = 'WEBSOCKET: $message';
    String finalMessage = logMessage;
    if (event != null) {
      finalMessage = '$logMessage | Event: $event';
    }

    final formattedMessage = _formatMessage(finalMessage, _colorCyan, '🔌');
    developer.log(formattedMessage, name: 'WEBSOCKET', level: 800);
  }
}
