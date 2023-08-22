import 'package:easy_localization/easy_localization.dart';
import 'package:terminator/core/constants/app_strings.dart';

class Appointment {
  String? label;
  String? value;
  String? type;

  Appointment({this.label, this.value, this.type});
}

class ResultModel {
  String? label;
  String? value;

  ResultModel({this.label, this.value});
}

List<Appointment> noAppointment = [
  Appointment(
      label: AppStrings.notAtHome.tr(), value: "Not at home", type: "no"),
  Appointment(
      label: AppStrings.untraceable.tr(), value: "Untraceable", type: "no"),
  Appointment(
      label: AppStrings.notReachable.tr(), value: "Not reachable", type: "no"),
  Appointment(label: AppStrings.cancelled.tr(), value: "Cancelled", type: "no"),
  Appointment(
      label: AppStrings.cancellationOnThePartOfIntermediary.tr(),
      value: "Cancellation on the part of intermediary",
      type: "no"),
];
List<Appointment> hasAppointment = [
  Appointment(
      label: AppStrings.treatment.tr(), value: "Treatment", type: "yes"),
  Appointment(
      label: AppStrings.didNotWantAnAppointment.tr(),
      value: "Did not want an appointment",
      type: "yes"),
  Appointment(
      label: AppStrings.multiYearContract.tr(),
      value: "Multi-year contract",
      type: "yes"),
  Appointment(label: AppStrings.other.tr(), value: "Other", type: "yes")
];
