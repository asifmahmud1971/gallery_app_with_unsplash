class FilterModel {
  List<Filter>? canton;
  List<Filter>? correspondenceLanguage;
  List<Filter>? otherLanguages;
  List<Filter>? contactRecordStatus;

  FilterModel({
    this.canton,
    this.correspondenceLanguage,
    this.otherLanguages,
    this.contactRecordStatus,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
        canton: json["canton"] == null
            ? []
            : List<Filter>.from(json["canton"]!.map((x) => Filter.fromJson(x))),
        correspondenceLanguage: json["correspondence_language"] == null
            ? []
            : List<Filter>.from(json["correspondence_language"]!
                .map((x) => Filter.fromJson(x))),
        otherLanguages: json["other_languages"] == null
            ? []
            : List<Filter>.from(
                json["other_languages"]!.map((x) => Filter.fromJson(x))),
        contactRecordStatus: json["contact_record_status"] == null
            ? []
            : List<Filter>.from(
                json["contact_record_status"]!.map((x) => Filter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "canton": canton == null
            ? []
            : List<dynamic>.from(canton!.map((x) => x.toJson())),
        "correspondence_language": correspondenceLanguage == null
            ? []
            : List<dynamic>.from(
                correspondenceLanguage!.map((x) => x.toJson())),
        "other_languages": otherLanguages == null
            ? []
            : List<dynamic>.from(otherLanguages!.map((x) => x.toJson())),
        "contact_record_status": contactRecordStatus == null
            ? []
            : List<dynamic>.from(contactRecordStatus!.map((x) => x.toJson())),
      };
}

class Filter {
  String? label;
  String? value;
  bool isEnable;

  Filter({
    this.label,
    this.value,
    this.isEnable = false,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
