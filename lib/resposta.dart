import 'package:flutter/material.dart';

class Resposta extends StatelessWidget{

  final String texto;
  final void Function() onSelect;

  Resposta(this.texto, this.onSelect);

  @override 
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        child: Text(texto),
        onPressed: onSelect,
      ),
    );
  }

}