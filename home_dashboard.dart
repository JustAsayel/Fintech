import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'account_page.dart';
import 'package:fintech_app/screens/transfer_page.dart';
import 'package:fintech_app/screens/transaction_history_page.dart';

import 'withdraw_page.dart';
import 'loan_page.dart';
import 'credit_card_page.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        elevation: 0,
        centerTitle: true,
        title: Text('Dashboard',
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, Asayel!',
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 10),
            _balanceCard(),
            const SizedBox(height: 20),
            Text('Quick Actions',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 12),
            Center(child: _quickActions(context)),
            const SizedBox(height: 24),
            Text('My Loans',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 12),
            _loanCard(context,
                title: 'Student Loan',
                amount: '\$170',
                date: 'May 5, 2024',
                progress: 0.25,
                icon: Icons.school),
            const SizedBox(height: 12),
            _loanCard(context,
                title: 'Credit Car',
                amount: '\$633',
                date: 'May 5, 2024',
                progress: 0.75,
                icon: Icons.directions_car),
          ],
        ),
      ),
    );
  }

  Widget _balanceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Balance',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 4),
          Text('\$29,865.00',
              style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 2),
          Text('+4.08% This Month',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.green)),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: 0.68,
            backgroundColor: Colors.grey.shade800,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
          const SizedBox(height: 8),
          Text('Overall Loans - 68% paid',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _quickActions(BuildContext context) {
    final actions = [
      {'icon': Icons.account_balance_wallet, 'label': 'Account', 'widget': const AccountPage()},
{'icon': Icons.sync_alt, 'label': 'Transfer', 'widget': const TransferPage()},
      {'icon': Icons.money_off, 'label': 'Withdraw', 'widget': const WithdrawPage()},
      {'icon': Icons.attach_money, 'label': 'Loan', 'widget': const LoanHomePage()},
      {'icon': Icons.receipt_long, 'label': 'Transaction', 'widget': const TransactionHistoryPage()},
      {'icon': Icons.credit_card, 'label': 'Credit Card', 'widget': const CreditCardPage()},
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: actions.map((item) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => item['widget'] as Widget),
            );
          },
          child: Container(
            width: 100,
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item['icon'] as IconData, color: Colors.white),
                const SizedBox(height: 6),
                Text(item['label'] as String,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _loanCard(BuildContext context,
      {required String title,
      required String amount,
      required String date,
      required double progress,
      required IconData icon}) {
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  showVerificationDialog(context);
                },
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

void showVerificationDialog(BuildContext context) {
  final TextEditingController codeController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color(0xFF2C2C2E),
      title: Text('Verify Code',
          style: GoogleFonts.poppins(color: Colors.white)),
      content: TextField(
        controller: codeController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: 'Enter 4-digit code',
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.black12),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel',
              style: GoogleFonts.poppins(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            if (codeController.text == '1234') {
              _showResult(context, success: true);
            } else {
              _showResult(context, success: false);
            }
          },
          child:
              Text('Verify', style: GoogleFonts.poppins(color: Colors.white)),
        )
      ],
    ),
  );
}

void _showResult(BuildContext context, {required bool success}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color(0xFF2C2C2E),
      title: Text(success ? 'Payment Successful!' : 'Failed!',
          style: GoogleFonts.poppins(
              color: success ? Colors.green : Colors.red)),
      content: Text(
        success
            ? 'Your loan payment was completed successfully.'
            : 'Incorrect code. Please try again.',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK', style: GoogleFonts.poppins(color: Colors.white)),
        )
      ],
    ),
  );
}
