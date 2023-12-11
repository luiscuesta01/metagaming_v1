import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    final List<Map<String, dynamic>> listItems = [
      {'nombre': 'Home', 'icono': Icons.home, 'ruta': '/'},
      {'nombre': 'Mis juegos', 'icono': Icons.search, 'ruta': '/my-games'},
      {
        'nombre': 'Favoritos',
        'icono': Icons.favorite_border_rounded,
        'ruta': '/favorites'
      },
      {
        'nombre': 'Invitanos a un café',
        'icono': Icons.coffee_rounded,
        'ruta': '/about-us'
      },
    ];
    return Scaffold(
        bottomNavigationBar: null, // Ocultar la barra de navegación inferior
        body: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alineación a la izquierda
            children: [
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFF393F4B), width: 1)),
                    child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).go('/');
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0, top: 2),
                child: Text(
                  'Estás en',
                  style: TextStyle(fontSize: 14, color: Color(0xFF7B8395)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: Text(
                  'Tu configuración',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w700),
                ),
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.primary, width: 1)),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://viclisreus.files.wordpress.com/2017/10/aaa.jpg'),
                    ),
                  ),
                ),
                const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'luiscr_01',
                        style:
                            TextStyle(color: Color(0xFF7B8395), fontSize: 15),
                      ),
                      Row(
                        children: [
                          Text(
                            'Luis Cuesta',
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                    ])
              ]),
              Flexible(
                child: Column(
                  children: [
                    Flexible(
                      child: ListView.separated(
                        itemCount: listItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              GoRouter.of(context).go(listItems[index]['ruta']);
                            },
                            child: ListTile(
                              leading: Icon(
                                listItems[index]['icono'],
                                color: colors.primary,
                              ),
                              title: Text(listItems[index]['nombre']),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 0.1,
                          );
                        },
                      ),
                    ),
                    //  Padding(
                    //    padding: const EdgeInsets.only(top:10.0),
                    //    child: Container(
                    //     width: double.infinity,
                    //     height: 57,
                    //     child: ElevatedButton(
                    //      onPressed: () {
                    //       GoRouter.of(context).go('/login');
                    //      },
                    //      style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.red,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(18),
                    //       ),
                    //      ),
                    //      child: Row(
                    //       mainAxisSize: MainAxisSize.min,
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Text('Invítanos a un café', style: textStyle.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                    //         SizedBox(width: 8.0),
                    //         Icon(Icons.favorite_rounded, color: colors.onBackground,),
                    //       ],
                    //      ),
                    //     ),
                    //    ),
                    //  ),
                  ],
                ),
              ),
            ]));
  }
}
