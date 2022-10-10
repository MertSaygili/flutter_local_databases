import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/constants.dart';

class CustomAppbar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.prefferedSize,
    required this.title,
    this.fun,
    this.toolTip,
    this.icon,
    this.leading,
  });

  final double prefferedSize;
  final Widget title;
  final Function? fun;
  final String? toolTip;
  final Icon? icon;
  final IconButton? leading;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(prefferedSize);
}

class _CustomAppbarState extends State<CustomAppbar> {
  final double _elevation = 15;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.leading,
      title: widget.title,
      centerTitle: false,
      elevation: _elevation,
      backgroundColor: ColorItems().colorGreen500 ?? ColorItems().colorGreen,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      automaticallyImplyLeading: false,
      iconTheme: Theme.of(context).iconTheme,
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      actionsIconTheme: Theme.of(context).iconTheme,
      actions: [
        IconButton(
          onPressed: () => widget.fun!(),
          icon: widget.icon ?? const SizedBox(),
          tooltip: widget.toolTip,
        )
      ],
    );
  }
}
