import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanCard extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final double progress;
  final IconData icon;
  final VoidCallback onPressed;

  const LoanCard({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.progress,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Icon(icon, color: Colors.green),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    Text('12 Months period',
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.white54)),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 3,
                      valueColor: const AlwaysStoppedAnimation(Colors.green),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Text('${(progress * 100).round()}%',
                      style: GoogleFonts.poppins(
                          fontSize: 10, color: Colors.white)),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(amount,
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text(date,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.white54)),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: onPressed,
                child: Text("Pay off",
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.white)),
              )
            ],
          )
        ],
      ),
    );
  }
}
