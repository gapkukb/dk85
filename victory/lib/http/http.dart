import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:uuid/v4.dart';
import 'package:victory/env.dart';
import 'package:victory/shared/app_info/app_info.dart';
import 'package:victory/shared/logger/logger.dart';
import 'package:victory/shared/talker/talker.dart';
import 'package:victory/services/services.dart';

part 'headers.http.dart';
part 'auth.http.dart';
part 'dispatch.http.dart';
part 'show_errors.http.dart';
part 'loading.http.dart';
part 'options.http.dart';
part 'transformer.http.dart';
