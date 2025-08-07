import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        title: Text('Analysis', style: GoogleFonts.poppins()),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Financial Analysis',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),

            Text(
              'Loan Repayment Progress',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You have repaid 70% of your loans this month.',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(height: 24),

            Text(
              'Monthly Cash Flow',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Here you can track your daily expenses and income.',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(height: 24),

            Text(
              'Group Loan',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Invite friends or family to help repay loans faster.',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
