import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 0;
    bool isMenuOpen = false; 
  @override
  Widget build(BuildContext context) {
    
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final currentSize = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    
    return Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 0),
                  ),
    
                  //Nombre de usuario, codigo y foto de usuario.
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: colors
                          .primary
                          .withOpacity(0.1),
                      
                    ),
                    
                    accountName: const Text('Luis'),
                    accountEmail: const Text('luiscr_01'),
                    currentAccountPicture:
                        const CircleAvatar(backgroundImage:NetworkImage('https://viclisreus.files.wordpress.com/2017/10/aaa.jpg') ),
                  ),
    
                  SizedBox(
                    height: currentSize.height / 27,
                  ),
                  //Boton de configuracion
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          color: colors
                              .primary
                              .withOpacity(0.25),
                          borderRadius: BorderRadius.circular(9)),
                      child: ListTile(
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                        leading: const Icon(Icons.settings),
                        title: const Text('Configuración'),
                        onTap: () => print('Configuración'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            //Boton Cerrar Sesión
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/login');
                    //ref.read(authProvider.notifier).logout();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: colors.primary,
                      ),
                      const SizedBox(width: 20),
                      const Text('Cerrar sesión',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
