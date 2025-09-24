import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

import '../../components/button/button.dart';
import '../../helper/charles_monitor.dart';
import '../../helper/toast.dart';
import '../../hooks/useForm.dart';
import '../../shared/dialog/dialog.dart';
import '../../shared/logger/logger.dart';
import '../../storage/storage.dart';

class DebugSettings extends StatefulWidget {
  const DebugSettings({Key? key}) : super(key: key);

  @override
  _DebugSettingsState createState() => _DebugSettingsState();
}

class _DebugSettingsState extends State<DebugSettings> {
  final border = const OutlineInputBorder(borderSide: BorderSide(color: Colors.black));
  final controller = TextEditingController();
  final show = false.obs;
  final form = Useform((values) async {
    Logger.debug(values.toString());
    final host = values['ip'];
    final port = int.tryParse(values['port']) ?? 0;
    try {
      await CharlesProxyHttpOverride.detect(host, port);
      VicDialog.confirm(
        title: '即将重启?',
        onConfirm: () async {
          await storage.proxyHost.update(host);
          await storage.proxyPort.update(port);
          Restart.restartApp();
        },
      );
    } catch (e) {
      toast('代理地址不可用,请检查IP和端口是否填写正确，charles是否开启');
    }
  });

  @override
  void initState() {
    ask();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Obx(
        () => !show.value
            ? const SizedBox.shrink()
            : Form(
                key: form.key,
                child: ListView(
                  padding: const EdgeInsets.all(12.0),
                  children: [
                    const Text('IP'),

                    TextFormField(
                      initialValue: '192.168.0.1',
                      onSaved: form.saveAs('ip'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) => value == null || value.isEmpty ? '必须填写' : null,
                      decoration: InputDecoration(
                        enabledBorder: border,
                        errorBorder: border,
                        focusedBorder: border,
                        border: border,
                      ),
                    ),

                    const Text('port'),

                    TextFormField(
                      initialValue: '8888',
                      onSaved: form.saveAs('port'),
                      validator: (value) => value == null || value.isEmpty ? '必须填写' : null,
                      keyboardType: const TextInputType.numberWithOptions(),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 5,
                      decoration: InputDecoration(
                        enabledBorder: border,
                        errorBorder: border,
                        focusedBorder: border,
                        border: border,
                      ),
                    ),

                    VicButton(
                      text: '提交',
                      onPressed: form.submit,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void ask() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.defaultDialog(
        barrierDismissible: false,
        content: TextFormField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: border,
            errorBorder: border,
            focusedBorder: border,
            border: border,
          ),
        ),
        textCancel: '取消',
        textConfirm: '确定',
        cancelTextColor: Colors.black,
        confirmTextColor: Colors.black,
        onConfirm: () {
          if (controller.text != 'vip666888') {
            toast('密码错误');
          } else {
            show.value = true;
            Get.back();
          }
        },
      );
    });
  }
}
