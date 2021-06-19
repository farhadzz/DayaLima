import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget with PreferredSizeWidget {

  @override
  final Size preferredSize;

  CustomAppBarIcon({
    @required this.icon,
    this.iconSize,
    this.iconColor,
    this.flexibleSpace,
    this.title = "",
    this.centerTitle = false,
    this.actions,
    this.elevation,
    this.backgroundColor,
    this.route,
    Key key
  }) : preferredSize = Size.fromHeight(56), super(key: key);

  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Widget flexibleSpace;
  final String title;
  final bool centerTitle;
  final dynamic actions;
  final double elevation;
  final Color backgroundColor;
  final dynamic route;

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
      elevation: (elevation == null ? 0 : elevation),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: iconColor,
            letterSpacing: 0.26
        ),
      ),
      actions: (actions == null ? [] : actions),
      centerTitle: centerTitle,
      flexibleSpace: (flexibleSpace == null ? Container() : flexibleSpace),
    );
  }
}
