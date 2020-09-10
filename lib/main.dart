import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de temperatura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Conversor(title: 'Conversor de temperatura'),
    );
  }
}
class Conversor extends StatefulWidget {
  Conversor({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {

  var _output;
  final inputController = TextEditingController();

  void _calculate_temp(){
    setState(() {
      double temperatura_orignal = double.parse(inputController.text);
      double temperatura_salida = (temperatura_orignal - 32) * 5 / 9;
      _output = "$temperatura_salida";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: inputController,
              ),
              RaisedButton(onPressed: () {_calculate_temp();},
              ),
              Text('$_output'),
            ],
          ),
       )
      )
    );
  }
}
