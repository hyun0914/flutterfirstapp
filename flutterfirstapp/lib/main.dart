import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutterfirstapp/select_home.dart';

// 디버그 모드 kDebugMode
// 릴리즈 모드 kReleaseMode
// import 'package:flutter/foundation.dart'; 필수
// 참고사이트
// https://dalgonakit.tistory.com/185

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  // 이렇게 하면 화면 이동이 천천히 움직 인다.
  //timeDilation = 15.0;
  runApp(
     DevicePreview(
      enabled: !kDebugMode,
      builder: (BuildContext context) => const SelectHome(),
    ),
  );
}
