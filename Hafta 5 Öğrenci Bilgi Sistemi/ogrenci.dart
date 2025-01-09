
import 'package:flutter/material.dart';

class OgrenciBilgiPage extends StatefulWidget {
  final String username;

  const OgrenciBilgiPage({required this.username});

  _OgrenciBilgiPageState createState() => _OgrenciBilgiPageState();
}

class _OgrenciBilgiPageState extends State<OgrenciBilgiPage> {
  final TextEditingController _todoController = TextEditingController();
  final List<String> _todoList = [];

  void todoEkle() {
    setState(() {
      _todoList.add(_todoController.text);
      _todoController.clear();
    });
  }

  void todoCikar(int index) {
    setState(() {
      _todoList.removeAt(index);
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
              controller: _todoController,
              decoration: InputDecoration(labelText: 'Hoca ekle'),
            ),
            ElevatedButton(onPressed: todoEkle, child: Text('Hoca ekle')),
            Expanded(
              child: ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_todoList[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => todoCikar(index),
                    ),
                  );
                },
              ),
            ),
          ],
        )
      )
    );
  }
}
