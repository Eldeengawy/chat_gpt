import 'package:chat_gpt/core/theme/colors.dart';
import 'package:clipboard/clipboard.dart'; // Import the clipboard package
import 'package:flutter/material.dart';

void copyToClipboard(BuildContext context, String message) {
  FlutterClipboard.copy(message).then((_) {
    final snackBar = SnackBar(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.copy_rounded, color: Colors.white),
            ),
            SizedBox(width: 12),
            Text(
              'Message copied successfully',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.grey,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });
}
