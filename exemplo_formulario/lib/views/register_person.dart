import 'package:exemplo_formulario/model/model.dart';
import 'package:flutter/material.dart';

class RegisterPerson extends StatefulWidget {
  @override
  _RegisterPersonState createState() => _RegisterPersonState();
}

class _RegisterPersonState extends State<RegisterPerson> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  String _resultIMC = "";

  _rowCalculateButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        print("clicou");
        print("nome digitado: ${_nameController.text}");
        print("peso digitado: ${_weightController.text}");
        print("altura digitada: ${_heightController.text}");

        if(_formKey.currentState!.validate()) {
          print("form validado");
          _calculateIMC(_nameController.text, _weightController.text, _heightController.text);
          _resetFields();
        } else {
          print("form não validado!");
          _showSnackBar(context, "Digite os dados corretamente!");
        }

      },
      icon: Icon(Icons.add),
      label: Text('Calcular'),
    );
  }

  _rowName() {
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(hintText: "Digite o seu nome"),
      maxLength: 100,
      validator: (value) {
        if(value!.isEmpty) {
          return "Digite um valor válido!";
        }
        return null;
      },
    );
  }

  _rowWeight() {
    return TextFormField(
      controller: _weightController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: "Digite o seu peso"),
      maxLength: 10,
      validator: (value) {
        if(value!.isEmpty) {
          return "Digite um valor válido!";
        }
        return null;
      },
    );
  }

  _rowHeight() {
    return TextFormField(
      controller: _heightController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: "Digite a sua altura"),
      maxLength: 10,
      validator: (value) {
        if(value!.isEmpty) {
          return "Digite uma altura válida!";
        }
        return null;
      },
    );
  }

  _rowFormUI(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(30.0),
          child: _rowName(),
        ),
        SizedBox(height: 30.0,),
        _rowWeight(),
        SizedBox(height: 30.0,),
        _rowHeight(),
        SizedBox(height: 30.0,),
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

  _rowResult() {
    return Text('IMC: ${_resultIMC}', style: TextStyle(fontSize: 30.0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro pessoa'),),
      body: Column(
        children: [
          _rowForm(context),
          _rowResult()
        ],
      ),
    );
  }

  void _calculateIMC(String name, String weight, String height) {
    final person = Person(name, double.tryParse(weight)!, double.tryParse(height)!);

    //teste...
    _showSnackBar(context, person.toString());
    _showSnackBar(context, person.calculateIMC().toString());
    _showSnackBar(context, person.calculateIMC().toStringAsFixed(2));
    print(person.toString());
    print(person.calculateIMC().toString());
    print(person.calculateIMC().toStringAsFixed(2));

    setState(() {
      _resultIMC = person.calculateIMC().toStringAsFixed(2);
    });
  }

  _resetFields() {
    // _nameController.text = "";
    // _weightController.text = "";
    // _heightController.text = "";

    _formKey.currentState!.reset();
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
