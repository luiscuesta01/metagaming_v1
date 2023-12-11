import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(25),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.primary, width: 1)),
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://viclisreus.files.wordpress.com/2017/10/aaa.jpg'),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'luiscr_01',
                  style: TextStyle(color: Color(0xFF7B8395), fontSize: 12),
                ),
                Row(
                  children: [
                    Text(
                      'Hey, Luis !',
                      style: TextStyle(fontSize: 14),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.mouse_outlined,
                        size: 13,
                        color: Color(0xFF7B8395),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Color.fromRGBO(57, 63, 75, 1), width: 1)),
              child: Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).push('/drawer');
                  },
                  icon:const  Icon(
                    Icons.gamepad_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
