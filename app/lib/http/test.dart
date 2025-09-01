import 'index.dart';

class R {
  final num code;

  R({required this.code});

  factory R.fromJson(Map<String, dynamic> json) {
    return R(code: json['code']);
  }
}

void main(List<String> args) async {
  final qa = http.get('/a3', loading: true, decoder: R.fromJson);

  qa();
  final r = await qa();
  print(r);
}
