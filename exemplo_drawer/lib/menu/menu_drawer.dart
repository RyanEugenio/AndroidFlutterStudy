import 'dart:io';

import 'package:exemplo_drawer/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuDrawer extends StatelessWidget {

  _createHeader(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrange,
            Theme.of(context).primaryColor
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight
        )
      ),
      child: Stack(
        children: [
          Positioned(
            top: 45.0,
            left: 16.0,
            child: CircleAvatar(backgroundColor: Colors.green,)//Icon(Icons.person, size: 100)
          ),
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Thiago Cury - thiagocury@gmail.com",
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }

  _createDrawerItem({IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.deepOrange,
                  Theme.of(context).primaryColor
                ],
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight
            )
        ),
        // color: Colors.green,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _createHeader(context),
            _createDrawerItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () {
                  print('Clicou');
                  Navigator.of(context).pop();
                }
            ),
            Divider(),
            _createDrawerItem(
                icon: Icons.add_business,
                text: 'Tela 1',
                onTap: () {
                  print('Clicou para abrir a tela 1');
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Screen1()
                      )
                  );
                }
            ),
            _createDrawerItem(
                icon: Icons.android,
                text: 'Tela 2',
                onTap: () {
                  print('Clicou para abrir a tela 2');
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Screen2()
                      )
                  );
                }
            ),
            _createDrawerItem(
                icon: Icons.android,
                text: 'Sobre',
                onTap: () {
                  print('Clicou para abrir a tela sobre');
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => About()
                      )
                  );
                }
            ),
            Divider(),
            _createDrawerItem(
                icon: Icons.directions_run_outlined,
                text: 'Sair',
                onTap: () {
                  print('Clicou no sair');
                  if(Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if(Platform.isIOS) {
                    exit(0);
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
