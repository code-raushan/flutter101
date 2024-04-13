import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Notes application",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> notes = [];

  void _showAddNoteModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text("Add your note"),
            content: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: "Enter your note",
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    notes.add(_textEditingController.text);
                  });
                  _textEditingController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text("Add Note"),
              ),
              TextButton(
                onPressed: () {
                  _textEditingController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              )
            ]);
      },
    );
  }

  void _editNoteModal(BuildContext context, int index) {
    _textEditingController.text = notes[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text("Edit your note"),
            content: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: "Enter your note",
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    notes[index] = _textEditingController.text;
                  });
                  _textEditingController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text("Save"),
              ),
              TextButton(
                onPressed: () {
                  _textEditingController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text("Don't save"),
              )
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "Notes Taker",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white, // Container background color
              borderRadius: BorderRadius.circular(10), // Border radius
              border: Border.all(color: Colors.grey), // Border color
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: const Offset(0, 3), // Offset
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    notes[index],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          notes.removeAt(index);
                        });
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _editNoteModal(context, index);
                      },
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddNoteModal(context);
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }
}
