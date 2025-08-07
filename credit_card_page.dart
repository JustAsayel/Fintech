import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  final List<Map<String, String>> creditCards = [];

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple
  ];

  final _formKey = GlobalKey<FormState>();
  String? name;
  String? cardNumber;
  String? expiry;

  void _addCard() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1C1C1E),
        title: Text("Add New Card", style: GoogleFonts.poppins(color: Colors.white)),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _inputField("Cardholder Name", (value) => name = value),
              _inputField("Card Number", (value) => cardNumber = value),
              _inputField("Expiry Date (MM/YY)", (value) => expiry = value),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _requestOTP();
              }
            },
            child: Text("Verify & Add", style: GoogleFonts.poppins(color: Colors.orange)),
          )
        ],
      ),
    );
  }

  Widget _inputField(String hint, Function(String) onSaved) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      onChanged: onSaved,
    );
  }

  void _requestOTP() {
    Navigator.pop(context); // Close form dialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1C1C1E),
        title: Text("Enter OTP", style: GoogleFonts.poppins(color: Colors.white)),
        content: TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(hintText: "OTP", hintStyle: TextStyle(color: Colors.grey)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final masked = cardNumber!.substring(cardNumber!.length - 4);
              setState(() {
                creditCards.add({
                  'name': name!,
                  'number': '**** **** **** $masked',
                  'expiry': expiry!,
                });
              });
              Navigator.pop(context);
            },
            child: Text("Confirm", style: GoogleFonts.poppins(color: Colors.orange)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        title: Text('My Credit Cards', style: GoogleFonts.poppins(color: Colors.white)),
        backgroundColor: const Color(0xFF1C1C1E),
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: _addCard,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: creditCards.length,
        itemBuilder: (context, index) {
          final card = creditCards[index];
          final color = colors[Random().nextInt(colors.length)];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.payment, color: Colors.white),
                    Icon(Icons.credit_card, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 20),
                Text(card['name']!, style: GoogleFonts.poppins(color: Colors.white, fontSize: 16)),
                Text(card['number']!,
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
                Text('Exp ${card['expiry']}',
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 14)),
              ],
            ),
          );
        },
      ),
    );
  }
}
