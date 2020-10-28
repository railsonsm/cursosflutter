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
  final _todoController = TextEditingController();
  List _toDoList = [];
  Map<String, dynamic> _lasRemoved;
  int _lasRemovedPos;

  @override
  void initState() {
    super.initState();

    _readData().then((data) => {
          setState(() {
            _toDoList = json.decode(data);
          })
        });
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _toDoList.sort((a, b) {
        if (a['ok'] && !b['ok'])
          return 1;
        else if (!a['ok'] && b['ok'])
          return -1;
        else
          return 0;
      });

      _saveFile();
    });

    return null;
  }

  void _addTodo() {
    setState(() {
      Map<String, dynamic> newTodo = Map();
      newTodo["title"] = _todoController.text;
      _todoController.text = "";
      newTodo["ok"] = false;
      _toDoList.add(newTodo);
      _saveFile();
    });
  }

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
                  controller: _todoController,
                  decoration: InputDecoration(
                      labelText: "Nova tarefa",
                      labelStyle: TextStyle(color: Color(0xFF00CE92))),
                )),
                RaisedButton(
                  // padding: EdgeInsets.all(5),
                  color: Color(0xFF00CE92),
                  child: Text("Add"),
                  textColor: Colors.white,
                  onPressed: () => _addTodo(),
                )
              ],
            ),
          ),
          Expanded(
              child: RefreshIndicator(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemCount: _toDoList.length,
                    itemBuilder: buildItem,
                  ),
                  onRefresh: _refresh))
        ],
      ),
    );
  }

  Widget buildItem(context, index) {
    return Dismissible(
        key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
        background: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        direction: DismissDirection.startToEnd,
        child: CheckboxListTile(
          onChanged: (check) => {
            setState(() {
              _toDoList[index]["ok"] = check;
              _saveFile();
            })
          },
          checkColor: Colors.white,
          activeColor: Color(0xFF00CE92),
          title: Text(_toDoList[index]["title"]),
          value: _toDoList[index]["ok"],
          secondary: CircleAvatar(
            child: Icon(
              _toDoList[index]["ok"] ? Icons.check : Icons.error,
              color: Colors.white,
            ),
            backgroundColor: Color(0xFF00CE92),
          ),
        ),
        onDismissed: (direction) {
          setState(() {
            _lasRemoved = Map.from(_toDoList[index]);
            _lasRemovedPos = index;
            _toDoList.removeAt(index);
            _saveFile();

            final snack = SnackBar(
                content: Text("Tarefa ${_lasRemoved["title"]} removida"),
                action: SnackBarAction(
                  label: "Desfazer",
                  onPressed: () {
                    setState(() {
                      _toDoList.insert(_lasRemovedPos, _lasRemoved);
                      _saveFile();
                    });
                  },
                ),
                duration: Duration(seconds: 2));
            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context).showSnackBar(snack);
          });
        });
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
