import 'dart:convert';

/// 响应模型基类
abstract class VicBaseModel {
  const VicBaseModel();

  // 工厂构造函数，子类需要实现
  factory VicBaseModel.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('Subclasses must implement fromJson factory constructor');
  }

  // 序列化为 JSON
  Map<String, dynamic> toJson();

  // 从 JSON 字符串反序列化
  factory VicBaseModel.fromJsonString(String jsonString) {
    throw UnimplementedError('Subclasses must implement fromJsonString factory constructor');
  }

  // 序列化为 JSON 字符串
  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
