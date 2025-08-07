import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _selectedPage = 0;

  final List<String> _pages = ['Home', 'Transactions', 'Filters'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        elevation: 0,
        centerTitle: true,
        title: Text(
          _pages[_selectedPage],
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
            child: _selectedPage == 0
                ? _homePage()
                : _selectedPage == 1
                    ? _transactionsPage()
                    : _filtersPage(),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  _pages.length,
                  (index) => ElevatedButton(
                    onPressed: () => setState(() => _selectedPage = index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedPage == index
                          ? Colors.orange
                          : Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      _pages[index],
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _homePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _walletCard(),
        const SizedBox(height: 24),
        Text('Recent Activity',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70)),
        const SizedBox(height: 12),
        _transactionItem('Transfer to Card', '\$250.00', 'Today'),
        _transactionItem('Withdraw', '\$100.00', 'Yesterday'),
      ],
    );
  }

  Widget _transactionsPage() {
    return Column(
      children: [
        _transactionTile('Transfer to Card', '-\$250.00', 'Jul 31, 2025'),
        const SizedBox(height: 12),
        _transactionTile('Withdraw', '-\$100.00', 'Jul 30, 2025'),
      ],
    );
  }

  Widget _filtersPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Filter by Date',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
        const SizedBox(height: 12),
        _filterOption('Last 7 Days'),
        _filterOption('This Month'),
        _filterOption('Custom Range'),
      ],
    );
  }

  Widget _walletCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Card Balance',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 6),
          Text('\$12,450.00',
              style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 4),
          Text('** 1234',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _transactionItem(String title, String amount, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: GoogleFonts.poppins(color: Colors.white)),
            Text(date,
                style:
                    GoogleFonts.poppins(color: Colors.white54, fontSize: 12)),
          ]),
          Text(amount, style: GoogleFonts.poppins(color: Colors.greenAccent)),
        ],
      ),
    );
  }

  Widget _transactionTile(String title, String amount, String date) {
    return ListTile(
      tileColor: const Color(0xFF2C2C2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(title, style: GoogleFonts.poppins(color: Colors.white)),
      subtitle: Text(date, style: GoogleFonts.poppins(color: Colors.white54)),
      trailing:
          Text(amount, style: GoogleFonts.poppins(color: Colors.redAccent)),
    );
  }

  Widget _filterOption(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: GoogleFonts.poppins(color: Colors.white)),
    );
  }
}