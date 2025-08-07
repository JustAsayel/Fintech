
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Verify Code"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter Verification Code",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: codeController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter code sent to your phone",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF2C2C2E),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                if (codeController.text == '1234') {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Phone Verified. Payment processing...")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid Code! Try again.")));
                }
              },
              child: const Text("Verify & Pay"),
            )
          ],
        ),
      ),
    );
  }
}
