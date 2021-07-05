import 'package:flutter/material.dart';
import 'package:study2/menu/menu.dart';
import 'package:study2/model/model.dart';
import 'package:study2/repository/repository.dart';
import 'package:study2/views/views.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late ContactRepository _repository;

  _title(Contact contact) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('ID ${contact.id} - ${contact.name.toString()}'),
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
              Icon(Icons.email),
              Text('${contact.email}')
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone),
              Text('${contact.phone}')
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._repository = ContactRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listar contatos'),),
      drawer: MenuDrawer(),
      body: RefreshIndicator(
        onRefresh: _reloadList,
        child: FutureBuilder(
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
      ),
    );
  }

  Future<void> _reloadList() async {
    var newList = await Future.delayed(Duration(seconds: 2), () => _repository);
    setState(() {
      _repository = newList;
    });
  }

  _reloadPage(bool reloadPage) {
    if (reloadPage) {
      setState(() {
        print('Atualiza a tela');
      });
    }  
  }

  _reloadPageTest() {
      setState(() {
        print('Atualiza a tela');
      });
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
        ]
    );

    showDialog(context: context, builder: (BuildContext context) {
      return alert;
    });
  }
}
