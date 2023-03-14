import 'package:flutter/material.dart';

import 'drawer_tile.dart';

/*
  * PAGING DO DRAWER CUSTOMIZATIONS
  * RECEDE OS MENUS
*/

class CostomDrawer extends StatelessWidget {
  const CostomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
       children: const [
         DrawerTile(iconData: Icons.home, title: 'Início', page: 0,),
         DrawerTile(iconData: Icons.add_circle_outline, title: 'Cadastro', page: 1,),
         DrawerTile(iconData: Icons.list, title: 'Lista', page: 2,),

       ],
      ),
    );
  }
}
