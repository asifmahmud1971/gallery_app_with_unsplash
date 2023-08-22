// To parse this JSON data, do
//
//     final terminModel = terminModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/painting.dart';
import 'package:terminator/features/components/custom_extensions.dart';

TerminModel terminModelFromJson(String str) =>
    TerminModel.fromJson(json.decode(str));

String terminModelToJson(TerminModel data) => json.encode(data.toJson());

class TerminModel {
  List<Termin>? data;
  Meta? meta;
  bool? hasTerminToday;

  TerminModel({
    this.data,
    this.meta,
    this.hasTerminToday,
  });

  factory TerminModel.fromJson(Map<String, dynamic> json) => TerminModel(
        data: json["data"] == null
            ? []
            : List<Termin>.from(json["data"]!.map((x) => Termin.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        hasTerminToday: json["has_termin_today"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
        "has_termin_today": hasTerminToday,
      };
}

class Termin {
  int? id;
  String? correspondenceLanguage;
  String? firstName;
  String? city;
  String? lastName;
  ContactRecordStatus? contactRecordStatus;
  int? lastAppointmentId;
  LastAppointment? lastAppointment;

  Termin({
    this.id,
    this.correspondenceLanguage,
    this.firstName,
    this.city,
    this.lastName,
    this.contactRecordStatus,
    this.lastAppointmentId,
    this.lastAppointment,
  });

  factory Termin.fromJson(Map<String, dynamic> json) => Termin(
        id: json["id"],
        correspondenceLanguage: json["correspondence_language"],
        firstName: json["first_name"],
        city: json["city"],
        lastName: json["last_name"],
        contactRecordStatus: json["contact_record_status"] == null
            ? null
            : ContactRecordStatus.fromJson(json["contact_record_status"]),
        lastAppointmentId: json["last_appointment_id"],
        lastAppointment: json["last_appointment"] == null
            ? null
            : LastAppointment.fromJson(json["last_appointment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "correspondence_language": correspondenceLanguage,
        "first_name": firstName,
        "city": city,
        "last_name": lastName,
        "contact_record_status": contactRecordStatus?.toJson(),
        "last_appointment_id": lastAppointmentId,
        "last_appointment": lastAppointment?.toJson(),
      };
}

class ContactRecordStatus {
  Status? status;
  Color? color;

  ContactRecordStatus({
    this.status,
    this.color,
  });

  factory ContactRecordStatus.fromJson(Map<String, dynamic> json) =>
      ContactRecordStatus(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        color: HexColor.fromHexConvert(json["color"] ?? "#FFFFFF"),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "color": color,
      };
}

class Status {
  String? label;
  String? value;
  bool? isEditable;

  Status({
    this.label,
    this.value,
    this.isEditable,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        label: json["label"],
        value: json["value"],
        isEditable:
            json["value"] == "New" || json["value"] == "Open" ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}

class LastAppointment {
  int? id;
  String? prefixId;
  int? customerCompanyId;
  int? contactDataRecordId;
  int? userId;
  DateTime? appointmentDate;
  String? appointmentTime;
  String? notes;
  String? controlStatusAppointment;
  dynamic appointmentControlTask;
  dynamic appointmentControlTaskRemarks;
  int? appointmentControlTaskStatus;
  dynamic appointmentReminderStatus;
  dynamic appointmentReminderRemarks;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? appointmentDateTime;

  LastAppointment({
    this.id,
    this.prefixId,
    this.customerCompanyId,
    this.contactDataRecordId,
    this.userId,
    this.appointmentDate,
    this.appointmentTime,
    this.notes,
    this.controlStatusAppointment,
    this.appointmentControlTask,
    this.appointmentControlTaskRemarks,
    this.appointmentControlTaskStatus,
    this.appointmentReminderStatus,
    this.appointmentReminderRemarks,
    this.createdAt,
    this.updatedAt,
    this.appointmentDateTime,
  });

  factory LastAppointment.fromJson(Map<String, dynamic> json) =>
      LastAppointment(
        id: json["id"],
        prefixId: json["prefix_id"],
        customerCompanyId: json["customer_company_id"],
        contactDataRecordId: json["contact_data_record_id"],
        userId: json["user_id"],
        appointmentDate: json["appointment_date"] == null
            ? null
            : DateTime.parse(json["appointment_date"]),
        appointmentTime: json["appointment_time"],
        notes: json["notes"],
        controlStatusAppointment: json["control_status_appointment"],
        appointmentControlTask: json["appointment_control_task"],
        appointmentControlTaskRemarks: json["appointment_control_task_remarks"],
        appointmentControlTaskStatus: json["appointment_control_task_status"],
        appointmentReminderStatus: json["appointment_reminder_status"],
        appointmentReminderRemarks: json["appointment_reminder_remarks"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        appointmentDateTime: json["appointment_date_time"] == null
            ? null
            : DateTime.parse(json["appointment_date_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "prefix_id": prefixId,
        "customer_company_id": customerCompanyId,
        "contact_data_record_id": contactDataRecordId,
        "user_id": userId,
        "appointment_date":
            "${appointmentDate!.year.toString().padLeft(4, '0')}-${appointmentDate!.month.toString().padLeft(2, '0')}-${appointmentDate!.day.toString().padLeft(2, '0')}",
        "appointment_time": appointmentTime,
        "notes": notes,
        "control_status_appointment": controlStatusAppointment,
        "appointment_control_task": appointmentControlTask,
        "appointment_control_task_remarks": appointmentControlTaskRemarks,
        "appointment_control_task_status": appointmentControlTaskStatus,
        "appointment_reminder_status": appointmentReminderStatus,
        "appointment_reminder_remarks": appointmentReminderRemarks,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "appointment_date_time": appointmentDateTime?.toIso8601String(),
      };
}

class Meta {
  int? currentPage;
  int? from;
  String? path;
  int? perPage;
  int? to;

  Meta({
    this.currentPage,
    this.from,
    this.path,
    this.perPage,
    this.to,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "path": path,
        "per_page": perPage,
        "to": to,
      };
}
