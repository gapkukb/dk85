import 'dart:io';

Future<void> main() async {
  try {
    final result = await Process.run('flutter build apk --target-platform android-arm64 --analyze-size --enable-experiment=native-assets', []); // Example: list files in current directory

    print('Exit code: ${result.exitCode}');
    print('Stdout: ${result.stdout}');
    print('Stderr: ${result.stderr}');
  } catch (e) {
    print('Error executing command: $e');
  }
}
