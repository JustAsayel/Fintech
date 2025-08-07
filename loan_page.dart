import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanHomePage extends StatefulWidget {
  const LoanHomePage({super.key});

  @override
  State<LoanHomePage> createState() => _LoanHomePageState();
}

class _LoanHomePageState extends State<LoanHomePage> {
  void handleOption(String type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Selected: $type")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Loans',
            style: GoogleFonts.poppins(color: Colors.white)),
        actions: [
          PopupMenuButton<String>(
            color: Colors.grey[900],
            onSelected: handleOption,
            icon: const Icon(Icons.add, color: Colors.white),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Dynamic Loan',
                child: Text('Dynamic Loan'),
              ),
              const PopupMenuItem(
                value: 'Cancel',
                child: Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          LoanCard(
            bankName: "Social Development Bank",
            currentPayoff: "100,000 SAR",
            principal: "90,000 SAR",
            rate: "2%",
            nextPayment: "August 21, 2025",
            monthsLeft: "25/50",
            paid: "50,000 SAR",
            left: "40,000 SAR",
          ),
        ],
      ),
    );
  }
}

class LoanCard extends StatelessWidget {
  final String bankName;
  final String currentPayoff;
  final String principal;
  final String rate;
  final String nextPayment;
  final String monthsLeft;
  final String paid;
  final String left;

  const LoanCard({
    super.key,
    required this.bankName,
    required this.currentPayoff,
    required this.principal,
    required this.rate,
    required this.nextPayment,
    required this.monthsLeft,
    required this.paid,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bankName,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          const SizedBox(height: 10),
          _infoRow("Current Payoff", currentPayoff),
          _infoRow("Principal", principal),
          _infoRow("Rate", rate),
          _infoRow("Next Payment", nextPayment),
          _infoRow("Duration", monthsLeft),
          _infoRow("Paid", paid),
          _infoRow("Remaining", left),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _actionButton(context, "Delay", Colors.grey),
              _actionButton(context, "Pay", Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14)),
          Text(value,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _actionButton(BuildContext context, String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$text clicked')),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(text,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 14)),
    );
  }
}
