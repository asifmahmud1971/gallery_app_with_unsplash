class GalleryModel {
  GalleryModel({
      this.id, 
      this.slug, 
      this.createdAt, 
      this.updatedAt, 
      this.description, 
      this.altDescription,
      this.urls,});

  GalleryModel.fromJson(dynamic json) {
    id = json['id'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
    altDescription = json['alt_description'];
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
  }
  String? id;
  String? slug;
  String? createdAt;
  String? updatedAt;
  String? description;
  String? altDescription;
  Urls? urls;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slug'] = slug;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['description'] = description;
    map['alt_description'] = altDescription;
    if (urls != null) {
      map['urls'] = urls?.toJson();
    }
    return map;
  }

}

class Urls {
  Urls({
      this.raw, 
      this.full, 
      this.regular, 
      this.small, 
      this.thumb, 
      this.smallS3,});

  Urls.fromJson(dynamic json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
    smallS3 = json['small_s3'];
  }
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['raw'] = raw;
    map['full'] = full;
    map['regular'] = regular;
    map['small'] = small;
    map['thumb'] = thumb;
    map['small_s3'] = smallS3;
    return map;
  }

}