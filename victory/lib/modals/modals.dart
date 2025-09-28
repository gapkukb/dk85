import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/animations/fade_scale.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/modals/views/announcement/announcement.dart';
import 'package:victory/modals/views/completion/completion.dart';
import 'package:victory/modals/views/daily_check_in/view.dart';
import 'package:victory/modals/views/first_deposit_bonus/first_deposit_bonus.dart';
import 'package:victory/modals/views/lucky_spin/view.dart';
import 'package:victory/modals/views/lucky_spin/view_next.dart';
import 'package:victory/shared/logger/logger.dart';
import 'package:victory/shared/talker/talker.dart';
import 'package:victory/storage/storage.dart';
import 'package:victory/services/services.dart';

part 'model_interface.dart';
part 'modal_const.dart';
part 'modal_builder.dart';
part 'modal_register.dart';
part 'modal_logic.dart';
