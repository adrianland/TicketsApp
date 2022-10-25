import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    showSnackBarNotification(
  svgIconPath,
  context,
  message,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.blue,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(svgIconPath, color: Colors.red),
          const SizedBox(width: 8),
          Flexible(
            child: Text(message,style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
