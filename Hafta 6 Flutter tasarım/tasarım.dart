import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _result = '';

  void _calculateSum() {
    final firstNumber = double.tryParse(_firstNumberController.text) ?? 0;
    final secondNumber = double.tryParse(_secondNumberController.text) ?? 0;
    setState(() {
      _result = (firstNumber + secondNumber).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hesaplama"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Birinci Sayı"),
            ),
            TextField(
              controller: _secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "İkinci Sayı"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSum,
              child: Text("Toplamı Sonucu"),
            ),
            SizedBox(height: 10),
            Text(
              "Sonuç: $_result",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text("İkinci Sayfaya Git"),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Uyarı"),
          content: Text("Bu bir uyarıdır"),
          actions: [
            TextButton(
              child: Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showPopup(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Bu bir pop uptır")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("İkinci Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showAlert(context),
              child: Text("Show Alert"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showPopup(context),
              child: Text("Show Popup"),
            ),
          ],
        ),
      ),
    );
  }
}
