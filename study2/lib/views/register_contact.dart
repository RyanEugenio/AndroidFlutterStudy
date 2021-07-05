import 'package:flutter/material.dart';
import 'package:study2/model/model.dart';
import 'package:study2/repository/contact_repository.dart';

class RegisterContact extends StatefulWidget {

  final Contact? contact;

  RegisterContact({this.contact});

  @override
  _RegisterContactState createState() => _RegisterContactState();
}

class _RegisterContactState extends State<RegisterContact> {

  final ContactRepository _repository = ContactRepository();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  bool _isUpdate = false;

  _rowIcon() {
    return Icon(Icons.people, size: 150, color: Colors.blue,);
  }

  _rowName() {
    return new TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(hintText: "Nome completo do contato"),
      maxLength: 50,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Digite um nome válido!';
        }
        return null;
      },
    );
  }

  _rowEmail() {
    return new TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: new InputDecoration(
        hintText: "Email",
      ),
      maxLength: 30,
      validator: (value) {
        if(value!.length < 9) {
          return 'Digite um email válido!';
        }
        return null;
      },
    );
  }

  _rowPhone() {
    return new TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: new InputDecoration(
        hintText: "Telefone para contato",
      ),
      maxLength: 14,
      validator: (value) {
        if(value!.length < 8) {
          return 'Digite um telefone válido!';
        }
        return null;
      },
    );
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        _register(context);
        _resetFields();
        _reloadPageTest();
      },
      style: TextButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.all(20.0),
          backgroundColor: Theme.of(context).primaryColor
      ),
      label: Text(_isUpdate ? 'Alterar contato' : 'Cadastrar contato'),
      icon: Icon(Icons.add),
    );
  }

  _formUI(BuildContext context) {
    return Column(
      children: [
        _rowIcon(),
        _rowName(),
        _rowEmail(),
        _rowPhone(),
        _rowButton(context),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.contact != null) {
      _nameController.text = widget.contact!.name.toString();
      _emailController.text = widget.contact!.email.toString();
      _phoneController.text = widget.contact!.phone.toString();
      _isUpdate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_isUpdate ? 'Alterar contato' : 'Cadastro de contatos'),),
        body: Column(
            children: [
              Text(_isUpdate ? 'Alterar' : 'Tela de cadastro'),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: _formUI(context),
              )
            ]
        )
    );
  }

  _register(BuildContext context) {
    print('Validou o formulário: ${_formKey.currentState!.validate()}');

    if(_formKey.currentState!.validate()) {

      if(_isUpdate) {
        //alterar

        //buscar as alterações, caso haja.
        widget.contact?.name = _nameController.text;
        widget.contact?.email = _emailController.text;
        widget.contact?.phone = _phoneController.text;

        this._repository.update(widget.contact!);

        _showSnackBar('Contato alterado com sucesso :-)');


      } else {
        //falta codigo
        final contact = Contact(
            name: _nameController.text,
            email: _emailController.text,
            phone: _phoneController.text
        );

        this._repository.save(contact);

        _showSnackBar('Contato cadastrado com sucesso :-)');
      }

      //para atualizar na tela...
      setState(() {
        Navigator.pop(context, true);
      });

    } else {
      print('Digite os campos corretamente :-/');
      _showSnackBar('Digite os campos corretamente :-/');
    }
  }

  //Método com arrow function
  _resetFields() => _formKey.currentState!.reset();

  _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message, ),)
    );
  }

  _reloadPageTest() {
    setState(() {
      print('Atualiza a tela');
    });
  }
}
