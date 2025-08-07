import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  final List<Map<String, dynamic>> transactions = const [
    {
      'type': 'Cash-in',
      'desc': 'From ABC Bank ATM',
      'amount': 100.00,
      'status': 'confirmed',
      'id': '564925374920',
      'date': '17 Sep 2023',
      'time': '10:34 AM',
      'icon': Icons.account_balance_wallet
    },
    {
      'type': 'Cashback from purchase',
      'desc': 'Purchase from Amazon.com',
      'amount': 1.75,
      'status': 'confirmed',
      'id': '685746354219',
      'date': '16 Sep 2023',
      'time': '16:08 PM',
      'icon': Icons.shopping_cart
    },
    {
      'type': 'Transfer to card',
      'desc': '',
      'amount': 9000.00,
      'status': 'confirmed',
      'id': '698094554317',
      'date': '16 Sep 2023',
      'time': '11:21 AM',
      'icon': Icons.credit_card
    },
    {
      'type': 'Transfer to card',
      'desc': 'Not enough funds',
      'amount': 9267.00,
      'status': 'canceled',
      'id': '097967542786',
      'date': '15 Sep 2023',
      'time': '10:11 AM',
      'icon': Icons.credit_card
    },
    {
      'type': 'Cashback from purchase',
      'desc': 'Purchase from Books.com',
      'amount': 3.21,
      'status': 'confirmed',
      'id': '765230974241',
      'date': '14 Sep 2023',
      'time': '09:45 AM',
      'icon': Icons.shopping_bag
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        centerTitle: true,
        title: Text('Transaction History',
            style: GoogleFonts.poppins(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: transactions.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final tx = transactions[index];
          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.deepPurple.shade200,
                  child: Icon(tx['icon'], color: Colors.deepPurple.shade900),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tx['type'],
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      if (tx['desc'].toString().isNotEmpty)
                        Text(tx['desc'],
                            style: GoogleFonts.poppins(
                                color: Colors.white60, fontSize: 12)),
                      Text('Transaction ID\n${tx['id']}',
                          style: GoogleFonts.poppins(
                              color: Colors.grey.shade500, fontSize: 11)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${tx['amount'].toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    _statusBadge(tx['status']),
                    const SizedBox(height: 4),
                    Text('${tx['date']}\n${tx['time']}',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.poppins(
                            color: Colors.white54, fontSize: 11)),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _statusBadge(String status) {
    Color color = status == 'confirmed' ? Colors.green : Colors.red;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: GoogleFonts.poppins(color: color, fontSize: 10),
      ),
    );
  }
}
