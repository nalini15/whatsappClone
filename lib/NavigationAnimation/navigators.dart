import 'package:flutter/material.dart';

class FadeNavigation extends PageRouteBuilder {
  final Widget widget;

  FadeNavigation({this.widget})
      : super(
            transitionDuration: Duration(milliseconds: 650),
            transitionsBuilder: (BuildContext con, Animation<double> animation,
                Animation<double> secAnimation, Widget child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut);

              return FadeTransition(
                opacity: animation,
                alwaysIncludeSemantics: true,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secanimation) {
              return widget;
            });
}
