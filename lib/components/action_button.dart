import 'package:flutter/material.dart';
import 'package:graphql_app/style.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final double titleSize;
  ActionButton({
    @required this.title,
    this.titleSize = 20
  }) : assert(title != null, "missing button title");
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 12, 15, 8),
      child: Text(
        title,
        style: TextStyle(
            color: Color(0xff3B5CB8),
            fontSize: titleSize,
            fontFamily: Styles.fonts.bold
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Color(0xff3B5CB8)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
