import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_flutter/views/admin_choice.dart';
import 'package:market_flutter/views/views.dart';

class AdminScreen extends StatefulWidget {

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _nameLogin = new TextEditingController();
  TextEditingController _passwordLogin = new TextEditingController();

  var _isObscure = false;

  _rowNameLogin() {
    return new TextFormField(
      controller: _nameLogin,
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(hintText: "Usuario",prefixIcon: Icon(Icons.person),),
      maxLength: 50,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Digite um usuario válido!';
        }
        return null;
      },
    );
  }

  _rowPasswordLogin() {
    return new TextFormField(
      controller: _passwordLogin,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: [AutofillHints.password],
      decoration: InputDecoration(
          hintText: "Password",
          prefixIcon: Icon(Icons.lock),
          suffixIcon: GestureDetector(
            child: Icon(_isObscure == false ? Icons.visibility_off : Icons.visibility),
            onTap: (){
              setState(() {
                _isObscure ? _isObscure = false : _isObscure = true;
              });
            },
          )
      ),
      obscureText: _isObscure == false ? true : false,
      maxLength: 50,
      onEditingComplete: () => TextInput.finishAutofillContext(),
      validator: (value) {
        if(value!.isEmpty) {
          return 'Digite uma senha válida';
        }
        return null;
      },
    );
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        validation();
      },
      style: TextButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.all(20.0),
          backgroundColor: Theme.of(context).primaryColor
      ),
      label: Text("Login"),
      icon: Icon(Icons.add),
    );
  }

  _formUI(BuildContext context) {
    return Column(
      children: [
        _rowNameLogin(),
        _rowPasswordLogin(),
        _rowButton(context),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen Admin')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person,size: 150,),
            Padding(
                padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: _formUI(context),
              ),
            )
          ],
        ),
        ),
    );
  }

  validation() {
    if(_nameLogin.text == "Lucas" && _passwordLogin.text == "28042000" || _nameLogin.text == "Ryan" && _passwordLogin.text == "26092002") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => AdminChoice(),
          ));
      _showSnackBar("Login feito com sucesso!", Colors.green, 2);

    } else {
      _showSnackBar("Login incorreto!", Colors.red, 1);
    }
  }

  _showSnackBar(String message, Color color, int duration) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message,),duration: Duration(seconds: duration),backgroundColor: color,)
    );
  }
}