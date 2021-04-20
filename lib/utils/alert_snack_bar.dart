import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class AlertSnackBar {
  static show(BuildContext context, String alertText, {String label = '', Function onPressed, bool showSnackBarAction = false}){

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(alertText),
      backgroundColor: Colors.black,
      action: !showSnackBarAction? null : SnackBarAction(
        textColor: Colors.white,
        label: label,
        onPressed: () {
          if(onPressed == null)
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          else
            onPressed.call();
        },
      ),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showError(BuildContext context, Exception error){
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(_errorToText(error, context)),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  static String _errorToText(Exception error, BuildContext context){
    if(error is HandshakeException || error is SocketException){
      return "Sem conexão com a internet";
    }
    if(error is TimeoutException){
      return "Houve um erro ao se comunicar com o servidor";
    }
    else{
      print(error.toString().replaceAll("Exception: ", "").trim());
      return "Houve um erro inesperado";
    }
  }
}