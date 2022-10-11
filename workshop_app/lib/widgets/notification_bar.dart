import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Future<void> notificationBar(
        {required String message,
        required BuildContext context,
        required Icon icon,
        required FlushbarPosition flushbarPosition,
        required Color color}) async =>
    await Flushbar(
      flushbarPosition: flushbarPosition,
      message: message,
      backgroundColor: color,
      duration: const Duration(seconds: 3),
      icon: icon,
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(8),
    ).show(context);

Future<void> failedNotificationBar(BuildContext context, String message,
        {Color color = const Color(0xFF303030),
        FlushbarPosition flushbarPosition = FlushbarPosition.BOTTOM}) async =>
    await notificationBar(
      message: message,
      context: context,
      icon: const Icon(
        Icons.error_outline,
        size: 28,
        color: Colors.white,
      ),
      flushbarPosition: flushbarPosition,
      color: color,
    );

Future<void> successNotificationBar(BuildContext context, String message,
        {Color color = const Color(0xFF303030),
        FlushbarPosition flushbarPosition = FlushbarPosition.BOTTOM}) async =>
    await notificationBar(
      message: message,
      context: context,
      icon: const Icon(
        Icons.check_circle_outline,
        size: 28,
        color: Colors.white,
      ),
      flushbarPosition: flushbarPosition,
      color: color,
    );
