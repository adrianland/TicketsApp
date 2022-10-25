import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/size_config.dart';
import '../cubit/ticket_cubit.dart';
import '../widget/w_edit_profile_form.dart';

class EditTicket extends StatelessWidget {
  final ticketData;
  EditTicket({Key? key, this.ticketData}) : super(key: key);

  final _formTicketKey = GlobalKey<FormState>();
  final _usuario = TextEditingController();
  final _estatus = TextEditingController();
  final _descripcion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Editar ticket'),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(SizeConfig.screenWidth! * 6),
                    child:  const SizedBox(
                      height: 50,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width: SizeConfig.screenWidth! * 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BlocBuilder<TicketCubit, TicketState>(
                          builder: (context, state) {

                            return ElevatedButton(
                              onPressed: () {
                                if (state is TicketLoading) return;

                                BlocProvider.of<TicketCubit>(context).deleteTicket(ticketData.id).then((value) => {
                                  callback(context)
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (state is TicketLoading)
                                    Container(
                                      margin: const EdgeInsets.only(right: 17),
                                      width: 25,
                                      height: 18,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                  const Text(
                                    'Eliminar',
                                  ),
                                ],
                              ),

                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              EditTicketForm(
                ticketData: ticketData,
                formTicketKey: _formTicketKey,
                usuario: _usuario,
                descripcion: _descripcion,
                estatus: _estatus,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: SizeConfig.screenWidth! * 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BlocBuilder<TicketCubit, TicketState>(
                      builder: (context, state) {
                        FormState? formState = _formTicketKey.currentState;

                        return ElevatedButton(
                          onPressed: () {
                            if (state is TicketLoading || formState == null) return;
                            if (formState.validate()) {
                              BlocProvider.of<TicketCubit>(context).updateTicket(ticketData.id, _estatus.text,_descripcion.text,_usuario.text,ticketData.fechaCreacion).
                              then((value) => {
                                callback(context)
                              });
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (state is TicketLoading)
                                Container(
                                  margin: const EdgeInsets.only(right: 17),
                                  width: 18,
                                  height: 18,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              const Text(
                                'Cambiar',
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
  void callback(BuildContext context){
    Navigator.pop(context,true);
  }
}
