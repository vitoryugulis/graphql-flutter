import 'package:flutter/material.dart';
import 'package:graphql_app/style.dart';

class CircularLoading extends StatelessWidget {
  final EdgeInsets marginSize;
  CircularLoading({
    this.marginSize = const EdgeInsets.fromLTRB(120, 140, 120, 140)
  }) : assert(marginSize != null, "must provide marginSize");

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: marginSize,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Styles.highLightTextColor),
        )
    );
  }
}
