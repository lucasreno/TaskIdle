class Wallet {
  late double _currency;

  double get currency => _currency;

  set currency(double currency) {
    _currency = currency;
  }

  void append(double amount) {
    currency += amount;
  }
}
