import 'package:flutter/material.dart';

class AccountProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _accounts = [
    {'name': 'Main Account', 'balance': 1200.50},
    {'name': 'Savings Account', 'balance': 3450.75},
    {'name': 'Business Account', 'balance': 789.30},
  ];

  bool isLoading = false;

  List<Map<String, dynamic>> get accounts => _accounts;

  double getBalance(String accountName) {
    return _accounts
            .firstWhere((acc) => acc['name'] == accountName, orElse: () => {'balance': 0.0})['balance']
        as double;
  }

  void withdraw(String accountName, double amount) {
    final accountIndex = _accounts.indexWhere((acc) => acc['name'] == accountName);
    if (accountIndex != -1) {
      _accounts[accountIndex]['balance'] -= amount;
      notifyListeners();
    }
  }
}
