class BankAccount {
  final int accountId;
  final String accountOwner;
  double currentBalance = 0;

  BankAccount(this.accountId, this.accountOwner);

  String balance() => 'Balance: \$$currentBalance';

  void withdraw(double amount) {
    if (amount > currentBalance) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    currentBalance -= amount;
  }

  void credit(double amount) {
    currentBalance += amount;
  }
}

class Bank {
  String name;
  Map<int, BankAccount> accounts = {};

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    if (accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId already exists!');
    }

    BankAccount newAccount = BankAccount(accountId, accountOwner);
    accounts[accountId] = newAccount;
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance()); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance()); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance()); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
