import 'package:flutter/material.dart';
import 'package:tickets/tickets/widget/w_TicketTextFormField.dart';


class EditTicketForm extends StatelessWidget{

  final ticketData;
  final GlobalKey<FormState> formTicketKey;
  final TextEditingController usuario;
  final TextEditingController estatus;
  final TextEditingController descripcion;

  const EditTicketForm({
    Key? key,
    required this.ticketData,
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
        TicketTextFormField(
            ticketData: ticketData,
            usuario:usuario,
            estatus:estatus,
            descripcion:descripcion
        )
      ],
    ),);
  }
}