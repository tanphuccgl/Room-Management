import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class XIndicator extends StatelessWidget {
  const XIndicator({this.radius = 15, Key? key}) : super(key: key);
  final double radius;

  @override
  Widget build(BuildContext context) {
    const color = Colors.blue;
    if (kIsWeb || Platform.isAndroid) {
      return Center(
        child: SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: CircularProgressIndicator(
              color: color,
              backgroundColor: Theme.of(context).colorScheme.onBackground,
              strokeWidth: 1.5),
        ),
      );
    }
    return Center(
      child: CupertinoActivityIndicator(
        color: color,
        radius: radius,
      ),
    );
  }
}
