import 'package:flutter/material.dart';
import 'package:tickets/tickets/widget/w_TicketTextFormField.dart';
import 'package:tickets/tickets/widget/w_createTicketTextFormField.dart';


class CreateTicketForm extends StatelessWidget{

  final GlobalKey<FormState> formTicketKey;
  final TextEditingController usuario;
  final TextEditingController estatus;
  final TextEditingController descripcion;

  const CreateTicketForm({
    Key? key,
    required this.formTicketKey,
    required this.usuario,
    required this.estatus,
    required this.descripcion,
  }) :super(key: key);


  @override
  Widget build(BuildContext context) {

  return Form(
    key: formTicketKey,
    child: Column(
      children: [
        CreateTicketTextFormField(
            usuario:usuario,
            estatus:estatus,
            descripcion:descripcion
        )
      ],
    ),);
  }
}