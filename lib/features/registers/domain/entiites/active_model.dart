import 'dart:convert';

ActiveModel activeModelFromJson(String str) =>
    ActiveModel.fromJson(json.decode(str));

String activeModelToJson(ActiveModel data) => json.encode(data.toJson());

class ActiveModel {
  String? id;
  String? nombre;
  String? descripcion;
  String? imagen;
  String? ubicacion;
  String? categoria;
  DateTime? fechaAdquisicion;
  int? costoAdquisicion;
  String? estado;
  String? responsable;
  DateTime? fechaUltimaActualizacion;
  String? vidaUtilEstimada;
  String? proveedor;
  String? numeroSerie;
  String? notasAdicionales;
  String? ubicacionPrecisa;
  String? garantia;
  String? condiciones;

  ActiveModel({
    this.id,
    this.nombre,
    this.descripcion,
    this.imagen,
    this.ubicacion,
    this.categoria,
    this.fechaAdquisicion,
    this.costoAdquisicion,
    this.estado,
    this.responsable,
    this.fechaUltimaActualizacion,
    this.vidaUtilEstimada,
    this.proveedor,
    this.numeroSerie,
    this.notasAdicionales,
    this.ubicacionPrecisa,
    this.garantia,
    this.condiciones,
  });

  factory ActiveModel.fromJson(Map<dynamic, dynamic> json) => ActiveModel(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        ubicacion: json["ubicacion"],
        categoria: json["categoria"],
        fechaAdquisicion: json["fecha_adquisicion"] == null
            ? null
            : DateTime.parse(json["fecha_adquisicion"]),
        costoAdquisicion: json["costo_adquisicion"],
        estado: json["estado"],
        responsable: json["responsable"],
        fechaUltimaActualizacion: json["fecha_ultima_actualizacion"] == null
            ? null
            : DateTime.parse(json["fecha_ultima_actualizacion"]),
        vidaUtilEstimada: json["vida_util_estimada"],
        proveedor: json["proveedor"],
        numeroSerie: json["numero_serie"],
        notasAdicionales: json["notas_adicionales"],
        ubicacionPrecisa: json["ubicacion_precisa"],
        garantia: json["garantia"],
        condiciones: json["condiciones"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "imagen": imagen,
        "ubicacion": ubicacion,
        "categoria": categoria,
        "fecha_adquisicion":
            "${fechaAdquisicion!.year.toString().padLeft(4, '0')}-${fechaAdquisicion!.month.toString().padLeft(2, '0')}-${fechaAdquisicion!.day.toString().padLeft(2, '0')}",
        "costo_adquisicion": costoAdquisicion,
        "estado": estado,
        "responsable": responsable,
        "fecha_ultima_actualizacion":
            "${fechaUltimaActualizacion!.year.toString().padLeft(4, '0')}-${fechaUltimaActualizacion!.month.toString().padLeft(2, '0')}-${fechaUltimaActualizacion!.day.toString().padLeft(2, '0')}",
        "vida_util_estimada": vidaUtilEstimada,
        "proveedor": proveedor,
        "numero_serie": numeroSerie,
        "notas_adicionales": notasAdicionales,
        "ubicacion_precisa": ubicacionPrecisa,
        "garantia": garantia,
        "condiciones": condiciones,
      };
}
