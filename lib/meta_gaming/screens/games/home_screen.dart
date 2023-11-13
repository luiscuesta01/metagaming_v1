import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:metagaming/config/constants/environment.dart';
import 'package:metagaming/meta_gaming/screens/utils/rive_utils.dart';
import 'package:rive/rive.dart';


class HomeScreen extends StatefulWidget {
  
  static const name ='home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  RiveAsset selectedBottomNav = bottomNavs.first;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: colors.background.withOpacity(0.8),
            borderRadius: BorderRadius.all(Radius.circular(24))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(bottomNavs.length, 
                (index) => GestureDetector(
                onTap: (){
                  bottomNavs[index].input!.change(true);
                  if (bottomNavs[index] != selectedBottomNav) {
                    setState(() {
                      selectedBottomNav = bottomNavs [index];
                    });
                  }
                  Future.delayed(const Duration(seconds:1),(){
                  bottomNavs[index].input!.change(false);

                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:[ 
                    Container(
                      height: 12,
                      width:12,
                      decoration: BoxDecoration(
                        color: colors.primary
                      ),
                    ),
                    SizedBox(

                      height: 36,
                      width: 36,
                      child: Opacity(
                        opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          bottomNavs.first.src,
                        artboard: bottomNavs[index].artboard,
                        onInit: (artboard){
                          StateMachineController controller = 
                            RiveUtils.getRiveController(artboard,
                              stateMachineName:bottomNavs[index].stateMachineName);
                          bottomNavs[index].input = controller.findSMI("active") as SMIBool;
                        },
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ))

      );
  }
}

class RiveAsset{
  final String artboard, stateMachineName, title,src;
  late SMIBool? input;

  RiveAsset(this.src,{
   
    required this.artboard, 
    required this.stateMachineName, 
    required this.title, 
     this.input});

  set setInput(SMIBool status){
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/RiveAssets/icons.riv", artboard: "HOME", 
    stateMachineName: "HOME_interactivity", title: "Home"),
  RiveAsset("assets/RiveAssets/icons.riv", artboard: "SEARCH", 
    stateMachineName: "SEARCH_Interactivity", title: "Like"),
  RiveAsset("assets/RiveAssets/icons.riv", artboard: "CHAT", 
    stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/RiveAssets/icons.riv", artboard: "BELL", 
    stateMachineName: "BELL_Interactivity", title: "Bell"),
];