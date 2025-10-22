import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Free Fire Tools',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.orangeAccent,
        hintColor: Colors.orangeAccent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.orange,
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.orangeAccent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orangeAccent),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _playerIdController = TextEditingController();
  final TextEditingController _accountIdController = TextEditingController();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _generateItems() {
    if (_playerIdController.text.isEmpty) {
      _showSnackBar('Please enter your Player ID');
      return;
    }
    _showSnackBar('Generating items for Player ID: ${_playerIdController.text}...');
    // This is a simulation. No actual items are generated.
  }

  void _recoverAccount() {
    if (_accountIdController.text.isEmpty) {
      _showSnackBar('Please enter your Account ID');
      return;
    }
    _showSnackBar('Starting recovery for Account ID: ${_accountIdController.text}...');
    // This is a simulation. No actual account recovery happens.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Fire Tools'),
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                'Item & Coin Generator',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _playerIdController,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Player ID',
                  prefixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateItems,
                child: const Text('Generate Gold & All Items'),
              ),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 20),
              Text(
                'Account Recovery',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _accountIdController,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Account ID',
                  prefixIcon: Icon(Icons.account_circle),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _recoverAccount,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                child: const Text('Recover My Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _playerIdController.dispose();
    _accountIdController.dispose();
    super.dispose();
  }
}
