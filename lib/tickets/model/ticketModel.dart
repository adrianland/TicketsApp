// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'dart:convert';

List<TicketModel> ticketModelFromJson(String str) => List<TicketModel>.from(json.decode(str).map((x) => TicketModel.fromJson(x)));

List<TicketModel> electricitySupplyServicesListFromJson(
    List<dynamic> str) =>
    List<TicketModel>.from(
        str.map((x) => TicketModel.fromJson(x)));

String ticketModelToJson(List<TicketModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TicketModel {
  TicketModel({
    required this.id,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.estatus,
    required this.descripcion,
    required this.usuario,
  });

  int id;
  String fechaCreacion;
  String fechaActualizacion;
  bool estatus;
  String descripcion;
  String usuario;

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
    id: json["id"],
    fechaCreacion: json["fechaCreacion"],
    fechaActualizacion: json["fechaActualizacion"],
    estatus: json["estatus"],
    descripcion: json["descripcion"],
    usuario: json["usuario"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fechaCreacion": fechaCreacion,
    "fechaActualizacion": fechaActualizacion,
    "estatus": estatus,
    "descripcion": descripcion,
    "usuario": usuario,
  };
}
