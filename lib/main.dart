import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/core/base_widget.dart';
import 'package:task_list_app/service/lang_service/lang_notifier.dart';
import 'package:task_list_app/service/local/shared_preferens.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefHelper.init();

  final container = ProviderContainer();
  container.read(languageProvider.notifier).init();
  setPathUrlStrategy();

  registerErrorHandlers();

  runApp(UncontrolledProviderScope(
      container: container, child: const BaseWidget()));
}

void registerErrorHandlers() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
