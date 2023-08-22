// To parse this JSON data, do
//
//     final performanceModel = performanceModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ui';

import 'package:terminator/features/components/custom_extensions.dart';

PerformanceModel performanceModelFromJson(String str) =>
    PerformanceModel.fromJson(json.decode(str));

String performanceModelToJson(PerformanceModel data) =>
    json.encode(data.toJson());

class PerformanceModel {
  List<PieChart>? pieChart;
  num? totalContactDataRecord;

  PerformanceModel({
    this.pieChart,
    this.totalContactDataRecord,
  });

  factory PerformanceModel.fromJson(Map<String, dynamic> json) =>
      PerformanceModel(
        pieChart: json["pie_chart"] == null
            ? []
            : List<PieChart>.from(
                json["pie_chart"]!.map((x) => PieChart.fromJson(x))),
        totalContactDataRecord: json["total_contact_data_record"],
      );

  Map<String, dynamic> toJson() => {
        "pie_chart": pieChart == null
            ? []
            : List<dynamic>.from(pieChart!.map((x) => x.toJson())),
        "total_contact_data_record": totalContactDataRecord,
      };
}

class PieChart {
  num? count;
  String? label;
  Color? color;
  String? percentage;

  PieChart({
    this.count,
    this.label,
    this.color,
    this.percentage,
  });

  factory PieChart.fromJson(Map<String, dynamic> json) => PieChart(
        count: json["count"],
        label: json["label"],
        color: HexColor.fromHexConvert(json["color"] ?? "#FFFFFF"),
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "label": label,
        "color": color,
        "percentage": percentage,
      };
}
