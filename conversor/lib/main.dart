import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=7f1febe3";
main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dolar;
  double euro;
  final realControlleer = TextEditingController();
  final dolarControlleer = TextEditingController();
  final euroControlleer = TextEditingController();

  void _realChange(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarControlleer.text = (real / dolar).toStringAsFixed(2);
    euroControlleer.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarlChange(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realControlleer.text = (dolar * this.dolar).toStringAsFixed(2);
    euroControlleer.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChange(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realControlleer.text = (euro * this.euro).toStringAsFixed(2);
    dolarControlleer.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  void _clearAll() {
    realControlleer.text = "";
    dolarControlleer.text = "";
    euroControlleer.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("\$Conversor"),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: FutureBuilder<Map>(
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                  "Carregando Dados...",
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ));
              default:
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    "Error :(",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ));
                } else {
                  dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(Icons.monetization_on,
                            size: 150.0, color: Colors.amber),
                        buildTextField(
                            "Reais", "R\$", realControlleer, _realChange),
                        Divider(
                          height: 5,
                        ),
                        buildTextField(
                            "Dolares", "US\$", dolarControlleer, _dolarlChange),
                        Divider(
                          height: 5,
                        ),
                        buildTextField(
                            "Euros", "€\$", euroControlleer, _euroChange),
                      ],
                    ),
                  );
                }
            }
          },
          future: getData(),
        ));
  }
}

Widget buildTextField(String label, String prefix,
    TextEditingController controller, Function function) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    onChanged: function,
    style: TextStyle(color: Colors.amber, fontSize: 25),
  );
}
