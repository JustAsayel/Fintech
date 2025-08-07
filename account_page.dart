import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<String> accounts = [];

  void _addAccount() {
    if (accounts.length < 5) {
      setState(() {
        accounts.add('Account ${accounts.length + 1}');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Maximum 5 accounts allowed')),
      );
    }
  }

  void _showAccountDetails(String accountName) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2E),
        title: Text(accountName,
            style: GoogleFonts.poppins(color: Colors.white)),
        content: Text('Details for $accountName',
            style: GoogleFonts.poppins(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close', style: GoogleFonts.poppins(color: Colors.orange)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        title: Text('My Accounts', style: GoogleFonts.poppins(color: Colors.white)),
        backgroundColor: const Color(0xFF1C1C1E),
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: _addAccount,
        child: const Icon(Icons.add),
      ),
      body: accounts.isEmpty
          ? Center(
              child: Text('No accounts yet. Tap + to add.',
                  style: GoogleFonts.poppins(color: Colors.white70)))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF2C2C2E),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(accounts[index],
                        style: GoogleFonts.poppins(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.orange),
                    onTap: () => _showAccountDetails(accounts[index]),
                  ),
                );
              },
            ),
    );
  }
}
