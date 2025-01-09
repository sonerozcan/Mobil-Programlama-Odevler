import 'package:flutter/material.dart';

class SekreterBilgiPage extends StatefulWidget {
  final String username;

  const SekreterBilgiPage({required this.username});

  _SekreterBilgiPageState createState() => _SekreterBilgiPageState();
}

class _SekreterBilgiPageState extends State<SekreterBilgiPage> {
  final TextEditingController _hocaIsimController = TextEditingController();
  final TextEditingController _ogrenciIsimController = TextEditingController();
  final TextEditingController _duyuruController = TextEditingController();
  final List<String> _duyurular = [];
  final List<String> _hocalar = [];
  final List<String> _ogrenciler = [];

  void hocaEkle() {
    setState(() {
      _hocalar.add(_hocaIsimController.text);
      _hocaIsimController.clear();
    });
  }

  void ogrenciEkle() {
    setState(() {
      _ogrenciler.add(_ogrenciIsimController.text);
      _ogrenciIsimController.clear();
    });
  }

  void duyuruEkle() {
    setState(() {
      _duyurular.add(_duyuruController.text);
      _duyuruController.clear();
    });
  }

  void duyuruCikar(int index) {
    setState(() {
      _duyurular.removeAt(index);
    });
  }

  void hocaCikar(int index) {
    setState(() {
      _hocalar.removeAt(index);
    });
  }

  void ogrenciCikar(int index) {
    setState(() {
      _ogrenciler.removeAt(index);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hoşgeldiniz')),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _hocaIsimController,
                  decoration: InputDecoration(labelText: 'Hoca ekle'),
                ),
                ElevatedButton(onPressed: hocaEkle, child: Text('Hoca ekle')),
                Expanded(
                  child: ListView.builder(
                    itemCount: _hocalar.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_hocalar[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => hocaCikar(index),
                        ),
                      );
                    },
                  ),
                ),
                TextField(
                  controller: _ogrenciIsimController,
                  decoration: InputDecoration(labelText: 'Ogrenci ekle'),
                ),
                ElevatedButton(
                    onPressed: ogrenciEkle, child: Text('Ogrenci ekle')),
                Expanded(
                  child: ListView.builder(
                    itemCount: _ogrenciler.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_ogrenciler[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => ogrenciCikar(index),
                        ),
                      );
                    },
                  ),
                ),
                TextField(
                  controller: _duyuruController,
                  decoration: InputDecoration(labelText: 'Duyuru ekle'),
                ),
                ElevatedButton(
                    onPressed: duyuruEkle, child: Text('Duyuru ekle')),
                Expanded(
                  child: ListView.builder(
                    itemCount: _duyurular.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_duyurular[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => duyuruCikar(index),
                        ),
                      );
                    },
                  ),
                )
              ],
            )));
  }
}
