import 'package:flutter/material.dart';
import 'package:swoc/layout/profile.dart';
import 'package:swoc/shared/global.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;
  final bool profile;

  const KAppBar(
      {Key? key,
      this.title = 'title',
      this.color = secondColor,
      this.profile = false})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(child: Text(title)),
      actions: [
        if (profile)
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Profile.id);
            },
            child: const Icon(
              Icons.account_circle_outlined,
              size: 30,
            ),
          )
      ],
      backgroundColor: color,
    );
  }
}
