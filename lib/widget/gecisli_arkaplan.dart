import 'package:flutter/material.dart';

class GradientArkaplan extends StatelessWidget {
  final Widget child;
  final MaterialColor renk;

  GradientArkaplan({@required this.child, @required this.renk});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: child,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [renk[700], renk[500], renk[200]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [06, 08, 1])),
    );
  }
}
