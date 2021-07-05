import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_flutter/views/admin_screen.dart';
import 'package:market_flutter/views/list_drink.dart';
import 'package:market_flutter/views/list_hygiene.dart';
import 'package:market_flutter/views/views.dart';

class MenuDrawer extends StatelessWidget {
  _createHeader(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Image.asset("assets/images/logo.png", )
    );
  }

  _createDrawerItem({ IconData? icon, String? text, GestureTapCallback? onTap}) {
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
         color: Colors.blue
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _createHeader(context),
            _createDrawerItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () {
                  print('Clicou');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomeMarket())
                  );
                }
            ),
            Divider(),
            _createDrawerItem(
                icon: Icons.add_business,
                text: 'Açougue e Peixaria',
                onTap: () {
                  print('Clicou para abrir a tela 1');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ListButcherAndFishmonger())
                  );
                }
            ),
            _createDrawerItem(
                icon: Icons.add_business,
                text: 'Bebidas',
                onTap: () {
                  print('Clicou para abrir a tela 1');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ListDrink())
                  );
                }
            ),
            _createDrawerItem(
                icon: Icons.add_business,
                text: 'Frutas',
                onTap: () {
                  print('Clicou para abrir a tela 1');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ListFruit())
                  );
                }
            ),
            _createDrawerItem(
                icon: Icons.add_business,
                text: 'Higiene',
                onTap: () {
                  print('Clicou para abrir a tela 1');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ListHygiene())
                  );
                }
            ),
            _createDrawerItem(
                icon: Icons.add_business,
                text: 'Laticínios e Ovos',
                onTap: () {
                  print('Clicou para abrir a tela 1');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ListDairyAndEggs())
                  );
                }
            ),
            _createDrawerItem(
                icon: Icons.add_business,
                text: 'Mercearia',
                onTap: () {
                  print('Clicou para abrir a tela 1');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ListGrocery())
                  );
                }
            ),
            _createDrawerItem(
                icon: Icons.add_business,
                text: 'Verduras e Legumes',
                onTap: () {

                  print('Clicou para abrir a tela 1');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ListVegetablesAndLegumes())
                  );
                }
            ),
            Divider(),
            _createDrawerItem(
                icon: Icons.account_box_rounded,
                text: 'Sobre',
                onTap: () {
                  print('Clicou para abrir a tela 1');
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => About()
                      )
                  );

                }
            ),
            _createDrawerItem(
                icon: Icons.admin_panel_settings_outlined,
                  text: 'Admin',
                onTap: () {
                  print('Clicou para abrir a tela 1');
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => AdminScreen()
                      )
                  );

                }
            ),
          ],
        ),
      ),
    );
  }
}
