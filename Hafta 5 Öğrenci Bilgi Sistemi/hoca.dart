import 'package:flutter/material.dart';

class HocaBilgiPage extends StatefulWidget {
  final String username;

  const HocaBilgiPage({super.key, required this.username});

  _HocaBilgiPageState createState() => _HocaBilgiPageState();
}

class _HocaBilgiPageState extends State<HocaBilgiPage> {
  final TextEditingController _vizeNotController = TextEditingController();
  final TextEditingController _finalNotController = TextEditingController();
  double? ortalama;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hoşgeldiniz.')),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _vizeNotController,
                  decoration: const InputDecoration(labelText: 'Vize Notu'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _finalNotController,
                  decoration: const InputDecoration(labelText: 'Final Notu'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: ortalamaHesapla, child: const Text('Hesapla')),
                if (ortalama != null)
                  Text('Ortalama: ${ortalama!.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20)),
              ],
            )));
  }

  void ortalamaHesapla() {
    double vize = double.tryParse(_vizeNotController.text) ?? 0;
    double finalNot = double.tryParse(_finalNotController.text) ?? 0;
    setState(() {
      ortalama = (vize * 0.4) + (finalNot * 0.6);
    });
  }
}
