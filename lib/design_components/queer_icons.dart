import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QueerIcons {
  const QueerIcons._();

  static const fontFam = 'QueerIcons';
  static const smallIconSize = 16.0;

  static const IconData arrowBack = Icons.arrow_back_ios_new;
  static const IconData arrowForward = Icons.arrow_forward_ios;
  static const IconData website = Icons.web;
  static const IconData instagram = FontAwesomeIcons.instagram;
  static const IconData tiktok = FontAwesomeIcons.tiktok;
  static const IconData facebook = FontAwesomeIcons.facebook;

  static const IconData menu = Icons.menu_rounded;
  static const IconData close = Icons.close_rounded;
  static const IconData _shareAndroid = Icons.share;
  static const IconData _shareIos = Icons.ios_share;
  static const IconData like = Icons.favorite_border;
  static const IconData likeFilled = Icons.favorite;
  static const IconData edit = Icons.edit_outlined;
  static const IconData tag = Icons.sell_outlined;
  static const IconData settings = Icons.settings_outlined;
  static const IconData more = Icons.more_horiz;
  static const IconData time = Icons.alarm;
  static const IconData info = Icons.info_outlined;
  static const IconData search = Icons.search;
  static const IconData add = Icons.add;
  static const IconData remove = Icons.remove;

  static IconData get shareIcon {
    if (!kIsWeb && Platform.isIOS) {
      return _shareIos;
    } else {
      return _shareAndroid;
    }
  }
}

class QueerIcon extends StatelessWidget {
  const QueerIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Icon(icon),
    );
  }
}

class QueerIconButton extends StatelessWidget {
  const QueerIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: IconButton(
        icon: QueerIcon(icon: icon),
        onPressed: onPressed,
      ),
    );
  }
}
