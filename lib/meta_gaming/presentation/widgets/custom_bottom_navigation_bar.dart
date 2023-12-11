import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metagaming/config/router/app_router.dart';
import 'package:metagaming/meta_gaming/domain/entities/rive_asset.dart';
import 'package:metagaming/meta_gaming/presentation/components/animated_bar.dart';
import 'package:metagaming/meta_gaming/presentation/screens/utils/rive_utils.dart';
import 'package:rive/rive.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
    RiveAsset selectedBottomNav = bottomNavs.first;
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          color: colors.primaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(24))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
              bottomNavs.length,
              (index) => GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(bottomNavs[index].route);
                      bottomNavs[index].input!.change(true);
                      if (bottomNavs[index].title != selectedBottomNav.title) {
                        setState(() {
                          selectedBottomNav = bottomNavs[index];
                        });
                      }
                      Future.delayed(const Duration(seconds: 1), () {
                        bottomNavs[index].input!.change(false);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                            isActive: bottomNavs[index] == selectedBottomNav,
                            colors: colors),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Opacity(
                            opacity: bottomNavs[index] == selectedBottomNav
                                ? 1
                                : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavs.first.src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveController(artboard,
                                        stateMachineName:
                                            bottomNavs[index].stateMachineName);
                                bottomNavs[index].input =
                                    controller.findSMI("active") as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
        ],
      ),
    ));
  }
}
