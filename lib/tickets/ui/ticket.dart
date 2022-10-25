import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickets/tickets/ui/create_ticket.dart';

import '../../util/dependency_injection/dependency_injection.dart';
import '../../util/size_config.dart';
import '../../util/snack_bar_notification.dart';
import '../cubit/ticket_cubit.dart';
import '../widget/w_card_ticket.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TicketScreen();
}

class TicketScreen extends State<Ticket> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  getAllTickets(BuildContext _context){
    BlocProvider.of<TicketCubit>(_context).getTickets();
  }

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<TicketCubit>(
            create: (context) => getIt.get<TicketCubit>()..getTickets()),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Ticket App'),
          ),
          body: Column(
            children: [
            BlocBuilder<TicketCubit, TicketState>(
              builder:  (_context, state) {
                return TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "Nuevo Ticket",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (BlocProvider<TicketCubit>(
                            create: (context) => getIt.get<TicketCubit>(),
                            child: CreateTicket(),
                          ))),
                    ).then((value) => {
                      BlocProvider.of<TicketCubit>(_context).getTickets()
                    });
                  },
                );
              },

            ),

              BlocBuilder<TicketCubit, TicketState>(
                builder: (_context, state) {
                  return SizedBox(
                    width: SizeConfig.screenWidth! * 90,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: searchController,
                      onChanged: (value) {
                        filterSearchResults(value, _context);
                      },
                      decoration: const InputDecoration(
                        labelText: "Buscar",
                        hintText: "Buscador por id",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                      ),
                    ),
                  );
                },
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 13, right: 13),
                child: Container(
                    height: SizeConfig.screenHeight! * 65,
                    child: BlocBuilder<TicketCubit, TicketState>(
                      builder: (context, state) {

                        if (state is TicketEmpty) {
                          return  Center(
                              child: Container(
                                child: Text('No hay tickets'),
                              )
                          );
                        }

                        if (state is! TicketLoadingSuccess) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return ListView(
                          padding: EdgeInsets.all(SizeConfig.screenWidth! * 3),
                          children: state.tickets.map((e) {
                            return Column(
                              children: [
                                CardTicket(ticket: e),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    )),
              )),
              response(),
            ],
          )),
    );
  }

  void filterSearchResults(String query, BuildContext _context) {
    if (query.isNotEmpty) {
      _context.read<TicketCubit>().getTicket(query);
      return;
    } else {
      _context.read<TicketCubit>().getTickets();
    }
  }

  Widget response() {
    return Container(
      child: BlocListener<TicketCubit, TicketState>(
        listener: (context, state) {
          if (state is TicketSetTimeOut) {
            showSnackBarNotification(
              Icons.report_gmailerrorred_outlined,
              context,
              state.errorMessage,
            );
          }
          if (state is TicketServerError) {
            showSnackBarNotification(
              Icons.report_gmailerrorred_outlined,
              context,
              state.errorMessage,
            );
          }
          if (state is TicketUnknownError) {
            showSnackBarNotification(
              Icons.report_gmailerrorred_outlined,
              context,
              state.errorMessage,
            );
          }
          if (state is TicketConnectionError) {
            showSnackBarNotification(
              Icons.report_gmailerrorred_outlined,
              context,
              state.errorMessage,
            );
          }

        },
        child: Text(""),
      ),
    );
  }
}
