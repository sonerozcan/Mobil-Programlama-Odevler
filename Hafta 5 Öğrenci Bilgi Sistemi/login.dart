import 'package:flutter/material.dart';
import 'hoca.dart';
import 'ogrenci.dart';
import 'sekreter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    final double ekranyuksekligi = ekranbilgisi.size.height;
    final double ekrangenisligi = ekranbilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yap', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: ekranyuksekligi / 20),
              child: SizedBox(
                width: ekrangenisligi / 4,
                height: ekranyuksekligi / 6,
                child: Image.network(
                  'https://medeniyet.edu.tr/logo-tr.png',
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranyuksekligi / 30),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Kullanıcı Adi',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ekrangenisligi / 70),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranyuksekligi / 30),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Şifre',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ekrangenisligi / 70),
                  ),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    if (_usernameController.text == 'hoca' &&
        _passwordController.text == '123') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HocaBilgiPage(username: _usernameController.text)));
    } else if (_usernameController.text == 'sekreter' &&
        _passwordController.text == '123') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SekreterBilgiPage(username: _usernameController.text)));
    } else if (_usernameController.text == 'ogrenci' &&
        _passwordController.text == '123') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OgrenciBilgiPage(username: _usernameController.text)));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Hatal Giriş'),
          content: const Text('Kullanıcı adı veya şifre hatal].'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Tamam'),
            ),
          ],
        ),
      );
    }
  }
}
