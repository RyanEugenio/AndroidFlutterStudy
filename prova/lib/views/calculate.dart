import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova/model/model.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key key}) : super(key: key);

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _value1Controller = TextEditingController();
  TextEditingController _value2Controller = TextEditingController();

  String _resultAverage = "";

  _rowCalculateButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if(_formKey.currentState.validate()) {
            _calculateAverage(_nameController.text, _value1Controller.text, _value2Controller.text);
            _showSnackBar(context, _resultAverage);
            _resetFields();
          } else {
            _showSnackBar(context, "Digite os dados");
          }
        },
        child: Text("Resultado"),
    );
  }

  _rowName() {
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(hintText: "Digite seu nome"),
      maxLength: 100,
      validator: (value) {
        if(value.isEmpty) {
          return "Digite seu nome";
        }
        return null;
      },
    );
  }

  _rowValue1() {
    return TextFormField(
      controller: _value1Controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: "Nota 1"),
      maxLength: 10,
      validator: (value) {
        if(value.isEmpty) {
          return "Digite nota 1";
        }
        return null;
      },
    );
  }

  _rowValue2() {
    return TextFormField(
      controller: _value2Controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: "Nota 2"),
      maxLength: 10,
      validator: (value) {
        if(value.isEmpty) {
          return "Digite nota 2";
        }
        return null;
      },
    );
  }

  _rowFormUI(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _rowName(),
    ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _rowValue1(),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _rowValue2(),
        ),
        _rowCalculateButton(context)
      ],
    );
  }

  _rowForm(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: _rowFormUI(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: [
            _rowForm(context),
          ],
        ),
      ),
    );
  }
  void _calculateAverage(String name, String value1, String value2) {
    final studant = Studant(name, double.tryParse(value1), double.tryParse(value2));

    setState(() {
       _resultAverage = "${studant.name}\n${studant.calculateAverage().toStringAsFixed(2)}";
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  _resetFields() {
    _formKey.currentState.reset();
  }
}
