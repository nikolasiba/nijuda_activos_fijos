// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BranchModel welcomeFromJson(String str) =>
    BranchModel.fromJson(json.decode(str));

String welcomeToJson(BranchModel data) => json.encode(data.toJson());

class BranchModel {
  String? nombre;
  int? id;
  String? ciudad;
  String? telefono;
  String? direccion;

  BranchModel({
    this.nombre,
    this.id,
    this.ciudad,
    this.telefono,
    this.direccion,
  });

  factory BranchModel.fromJson(Map<dynamic, dynamic> json) => BranchModel(
        nombre: json["nombre"],
        id: json["id"].toInt(),
        ciudad: json["ciudad"],
        telefono: json["telefono"],
        direccion: json["direccion"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "id": id,
        "ciudad": ciudad,
        "telefono": telefono,
        "direccion": direccion,
      };
}
