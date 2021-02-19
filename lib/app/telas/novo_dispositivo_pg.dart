import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:incasa/app/modelos/tipo_dispositivo.dart';
import 'package:provider/provider.dart';
import 'package:incasa/app/components/const.dart';
import 'package:incasa/app/modelos/dispositivo_modelo.dart';
import 'package:incasa/app/components/show_exception_alert_dialog.dart';
//import 'package:incasa/app/modelos/addDispositivo/addComodo.dart';
//import 'package:incasa/app/modelos/addDispositivo/addTipoDispositivo.dart';
//import 'package:incasa/app/modelos/addDispositivo/addTag.dart';
import 'package:incasa/app/servicos/autenticacao.dart';
import 'package:incasa/app/servicos/database.dart';

class NovoDispositivo extends StatelessWidget {

  Future<void> _createDispositivo(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.createDispositivo(Dispositivo(tipo: 'Lâmpada', comodo: 'sala', tag: 'l1'));
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Operation failed',
        exception: e,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: kTextColor,
      elevation: 0,
      child: Icon(
        Icons.add,
        size: 20.0,
        color: kPrimaryColor,
      ),
      onPressed: () => AddDisp.show(context),
      shape: CircleBorder(),
    );
  }




}
