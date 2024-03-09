import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Пример виджетов Flutter'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _displayText = '';
  TextEditingController _textController = TextEditingController();

  void _updateText() {
    setState(() {
      _displayText = _textController.text.isNotEmpty
          ? _textController.text
          : 'Обновить';
    });
  }

  void _clearText() {
    setState(() {
      _textController.clear();
      _displayText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Введите текст тут...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          _displayText,
          style: TextStyle(fontSize: 24.0),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _updateText,
              child: Text('Обновить текст'),
            ),
            SizedBox(width: 10.0),
            ElevatedButton(
              onPressed: _clearText,
              child: Text('Очистить текст'),
            ),
          ],
        ),
      ],
    );
  }
}
