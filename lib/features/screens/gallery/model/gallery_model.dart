class GalleryModel {
  GalleryModel({
    this.urls,
  });

  GalleryModel.fromJson(dynamic json) {
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
  }

  Urls? urls;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (urls != null) {
      map['urls'] = urls?.toJson();
    }
    return map;
  }
}

class Urls {
  Urls({
    this.raw,
    this.small,
    this.full,
  });

  Urls.fromJson(dynamic json) {
    raw = json['raw'];

    small = json['small'];
    full = json['full'];
  }

  String? raw;

  String? small;
  String? full;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['raw'] = raw;

    map['small'] = small;
    map['full'] = full;

    return map;
  }
}
