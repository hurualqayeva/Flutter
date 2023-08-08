import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextAreaScreen(),
    );
  }
}

class TextAreaScreen extends StatefulWidget {
  @override
  _TextAreaScreenState createState() => _TextAreaScreenState();
}

class _TextAreaScreenState extends State<TextAreaScreen> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> mainContent = [];
  bool _isComposing=true;
  void addTextToMainContent() {
    String enteredText = _textEditingController.text;
    if (enteredText.isNotEmpty) {
      setState(() {
        mainContent.add(enteredText);
        _textEditingController.clear();
      });
    }
  }

  void deleteItem(int index) {
    setState(() {
      mainContent.removeAt(index);
    });
  }

  void deleteAllItems() {
    setState(() {
      mainContent.clear();
      _textEditingController.clear();

    });
  }

void toggle(){
  setState(() {
     _isComposing=!_isComposing;

  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-do list'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: deleteAllItems,
          ),
          IconButton(onPressed: toggle, icon: Icon(Icons.visibility))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: TextField(
              controller: _textEditingController,
              key: Key('text_field'), // Add a key to the TextField
              decoration: InputDecoration(
                hintText: 'Enter a message',
                suffixIcon: IconButton(
                  onPressed: _textEditingController.clear,
                  icon: Icon(Icons.clear),
                ),
              ),
              onSubmitted: (text) {
                FocusScope.of(context).unfocus();
                addTextToMainContent();
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mainContent.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: _isComposing ? IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteItem(index),
                  ) : null,
                  title: Text(mainContent[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
