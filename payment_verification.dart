import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showVerificationDialog(BuildContext context) {
  final TextEditingController codeController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color(0xFF2C2C2E),
      title: Text("Enter Verification Code", style: GoogleFonts.poppins(color: Colors.white)),
      content: TextField(
        controller: codeController,
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.number,
        maxLength: 6,
        decoration: InputDecoration(
          hintText: "e.g., 123456",
          hintStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel", style: TextStyle(color: Colors.red)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            Navigator.pop(context); // Close dialog
            _validateCode(context, codeController.text);
          },
          child: const Text("Verify"),
        ),
      ],
    ),
  );
}

void _validateCode(BuildContext context, String code) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );

  await Future.delayed(const Duration(seconds: 2));

  Navigator.pop(context); // Close loading

  if (code == "123456") {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text("Success!", style: TextStyle(color: Colors.green)),
        content: const Text("Your payment has been completed.", style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK", style: TextStyle(color: Colors.green)))
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text("Failed!", style: TextStyle(color: Colors.red)),
        content: const Text("Invalid verification code.", style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Retry", style: TextStyle(color: Colors.red)))
        ],
      ),
    );
  }
}
