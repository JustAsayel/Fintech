import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  String? selectedCustomer;
  final List<String> customers = ['Ahmed', 'Nora', 'Sarah'];
  final TextEditingController newCustomerController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        centerTitle: true,
        title: Text('Transaction',
            style: GoogleFonts.poppins(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Select Customer'),
            _dropdownField(),
            const SizedBox(height: 20),
            _sectionTitle('Add New Customer'),
            _inputField(controller: newCustomerController, hint: 'New customer name'),
            const SizedBox(height: 20),
            _sectionTitle('Reason for Transfer'),
            _inputField(controller: reasonController, hint: 'e.g. Bill payment'),
            const SizedBox(height: 20),
            _sectionTitle('Amount'),
            _inputField(
              controller: amountController,
              hint: '\$ Amount',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text("Submit", style: GoogleFonts.poppins(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.orange),
                label: Text("Back to Home",
                    style: GoogleFonts.poppins(color: Colors.orange)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(title, style: GoogleFonts.poppins(color: Colors.white));
  }

  Widget _dropdownField() {
    return DropdownButtonFormField<String>(
      dropdownColor: const Color(0xFF2C2C2E),
      style: const TextStyle(color: Colors.white),
      value: selectedCustomer,
      items: customers.map((String name) {
        return DropdownMenuItem<String>(
          value: name,
          child: Text(name, style: GoogleFonts.poppins(color: Colors.white)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCustomer = value;
        });
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF2C2C2E),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF2C2C2E),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _handleSubmit() {
    String customer = selectedCustomer ?? newCustomerController.text.trim();
    String reason = reasonController.text.trim();
    String amount = amountController.text.trim();

    if (customer.isEmpty || reason.isEmpty || amount.isEmpty) {
      _showDialog("Error", "Please fill in all fields.", Colors.red);
    } else {
      _showDialog("Success", "Transaction submitted successfully!", Colors.orange);
    }
  }

  void _showDialog(String title, String message, Color color) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2E),
        title: Text(title, style: GoogleFonts.poppins(color: color)),
        content: Text(message, style: GoogleFonts.poppins(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK", style: GoogleFonts.poppins(color: Colors.white)),
          )
        ],
      ),
    );
  }
}

