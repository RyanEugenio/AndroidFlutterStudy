import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Teste rapidão'),
            TextField(
              controller: myController,
            ),
            TextButton(
                onPressed: () {
                  _sendToast(myController.text, color: Colors.lime);
                  _sendToast('Toast 2');
                },
                child: Text('Send Toast')
            ),
            TextButton(
                onPressed: () {
                  _sendSnackBar(myController.text, color: Colors.brown);
                },
                child:  Text('Enviar snack')
            ),
            TextButton(
                onPressed: () {
                  _sendAlertDialog(context, 'Alert', 'msg');
                },
                child: Text('Bora dale alert'),
            ),
          ],
        ),
      ),
    );
  }
  _sendToast(String message, {Color color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: color
    );
  }

  _sendSnackBar(String message, {Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: color,)
    );
  }

  _sendAlertDialog(BuildContext context, String title, String message, {yesButton = 'yes', noButton = 'no'}) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
            onPressed: () {
            },
            child: Text(yesButton),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(noButton),
        ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) {return alert;});
  }
  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }
}
