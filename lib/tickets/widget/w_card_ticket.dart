import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../util/dependency_injection/dependency_injection.dart';
import '../../util/size_config.dart';
import '../cubit/ticket_cubit.dart';
import '../ui/edit_ticket.dart';

class CardTicket extends StatelessWidget {
  final ticket;
  const CardTicket({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return  BlocBuilder<TicketCubit, TicketState>(
        builder: (_context, state) {
          return  Container(
            padding: const EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(
              vertical: SizeConfig.screenHeight! * 2,
            ),
            decoration: BoxDecoration(
              color: ticket.estatus == true ? Colors.blue : Colors.green,
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: ListTile(
              title: Text(ticket.descripcion,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Creación:  ${ ticket.fechaCreacion}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    "Actualización:  ${ ticket.fechaActualizacion}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'Asignado a: ${ ticket.usuario}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              minVerticalPadding: 10,
              trailing: IconButton(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(bottom: SizeConfig.screenHeight! * 100),
                icon: const Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (BlocProvider<TicketCubit>(
                          create: (context) => getIt.get<TicketCubit>(),
                          child: EditTicket(ticketData: ticket ),
                        ))),
                  ).then((value) => {
                    BlocProvider.of<TicketCubit>(_context).getTickets()
                  });
                },
              ),
            ),

          );
        });


  }
}
