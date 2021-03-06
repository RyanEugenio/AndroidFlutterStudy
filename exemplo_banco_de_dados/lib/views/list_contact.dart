import 'package:exemplo_banco_de_dados/model/model.dart';
import 'package:exemplo_banco_de_dados/repository/repository.dart';
import 'package:exemplo_banco_de_dados/views/views.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListContact extends StatefulWidget {
  @override
  _ListContactState createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {

  late ContactRepository _repository;
  Future<void>? _launched;

  _title(Contact contact) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Cód ${contact.id} - ${contact.name.toString()}'),
            )
          ],
        )
      ],
    );
  }

  _subtitle(Contact contact) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.phone),
              Text('${contact.phone}')
            ],
          ),
          Row(
            children: [
              Icon(Icons.email),
              Text('${contact.email}')
            ],
          )
        ],
      )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._repository = ContactRepository(); //NÃO ESQUECER!
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Listar contatos'),),
        body: FutureBuilder(
          future: this._repository.fetchAll(),
          builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {

            final List<Contact> contacts = snapshot.data!;

            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: contacts.length, //snapshot.data?.length
                itemBuilder: (BuildContext context, int index) {
                  final Contact contact = contacts[index];
                  return Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(Icons.delete_forever)
                      ),
                      key: ValueKey<int>(contact.id!),
                      onDismissed: (DismissDirection direction) async {
                        await this._repository.delete(contact);
                        setState(() {
                          snapshot.data!.remove(snapshot.data![index]);
                        });
                      },
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            print('Você escolheu ${contact.toString()}');
                            //chamando o alert.
                            _showAlert(
                                'Você deseja ver detalhes e/ou alterar?',
                                button1: 'Ver detalhes',
                                button2: 'Alterar',
                                button1Function: () {
                                  //programo aqui..... GAMBIARRA LIKE A BOSS.
                                  print('detalhes');
                                  //......

                                  setState(() {
                                    _launched = _makePhoneCall('tel:${contact.phone.toString()}');
                                  });

                                },
                                button2Function: () async {
                                  //programo aqui..... GAMBIARRA LIKE A BOSS.
                                  print('alterar');
                                  Navigator.of(context).pop(); //fechando o alertDialog

                                  final reloadPage = await Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (BuildContext context)
                                    => RegisterContact(contact: contact,))
                                  );
                                  _reloadPage(reloadPage);
                                }
                            );
                          },
                          title: _title(contact),
                          subtitle: _subtitle(contact),
                          leading: CircleAvatar(backgroundColor: Colors.blue,),
                        ),
                      )
                  );
                },
              );
            } else {
             return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //android.....
  //arquitetura
  //MVC - model, view, controller - FALHO....
  //MVP - model, view, presenter - FALHO.....

  //utilizado...
  //MVVM - model, view, view, model - atualização direta na tela...
  //react,vue,angular -> TWO WAY DATABINDING

  //LIVEDATA....

  //VIPER... muita loka...


  //flutter..

  //MVVM..... estado! setState()

  //especifico flutter
  //INDIAN GUYS OFF YOUTUBE... - abstrato e muito dificil.
  //BloC - INDIAN.... bussiness logic of component - lib....
  //CULTURA.... padrão....
  //BLOC FLUTTER_BLOC
  //view -> lógica de negócio.... bloc, event, estado

  //setState()
  //Navigator.push();



  _reloadPage(bool reloadPage) {
    if(reloadPage) {
      setState(() {
        print('vai atualizar a tela no retorno do alterar');
      });
    }
  }

  _showAlert(String message, {String? title, String? button1, String? button2, Function? button1Function, Function? button2Function/*, String? button3*/}) {
    AlertDialog alert = AlertDialog(
      title: Text(title ?? 'Atenção'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            button1Function!();
          },
          child: Text(button1 ?? 'Sim'),
        ),
        TextButton(
          onPressed: () {
            button2Function!();
          },
          child: Text(button2 ?? 'Não'),
        ),
        // button3 != null ?
        // TextButton(
        //   onPressed: () {
        //     print('clicou em cancelar');
        //   },
        //   child: Text(button3 ?? 'Cancelar'),
        // ) : Container(),
      ]
    );

    showDialog(context: context, builder: (BuildContext context) {
      return alert;
    });
  }
}