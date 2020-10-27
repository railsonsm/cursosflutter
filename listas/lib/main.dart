import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:listas/funcoes.dart' as fc;

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = ["Railson", "Silva"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Color(0xFF00CE92),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(17, 1, 7, 1),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      labelText: "Nova tarefa",
                      labelStyle: TextStyle(color: Color(0xFF00CE92))),
                )),
                RaisedButton(
                  color: Color(0xFF00CE92),
                  child: Text("Add"),
                  textColor: Colors.white,
                  onPressed: () => {},
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: _toDoList.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(_toDoList[index]["title"]),
                value: _toDoList[index]["ok"],
                secondary: CircleAvatar(
                    child: Icon(
                  _toDoList[index]["ok"] ? Icons.check : Icons.error,
                )),
              );
            },
          ))
        ],
      ),
    );
  }

  Future<File> _saveFile() async {
    String data = json.encode(_toDoList);
    final file = await fc.getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await fc.getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
