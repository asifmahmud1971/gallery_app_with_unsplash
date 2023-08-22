class HistoryModel {
  HistoryModel({
    this.id,
    this.userId,
    this.allocatedTo,
    this.contactDataRecordId,
    this.action,
    this.statusChange,
    this.oldStatus,
    this.newStatus,
    this.categoryChange,
    this.oldCategory,
    this.newCategory,
    this.userType,
    this.notes,
    this.meta,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  HistoryModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    allocatedTo = json['allocated_to'];
    contactDataRecordId = json['contact_data_record_id'];
    action = json['action'];
    statusChange = json['status_change'];
    oldStatus = json['old_status'];
    newStatus = json['new_status'];
    categoryChange = json['category_change'];
    oldCategory = json['old_category'];
    newCategory = json['new_category'];
    userType = json['user_type'];
    notes = json['notes'];
    meta = json['meta'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? id;
  int? userId;
  int? allocatedTo;
  int? contactDataRecordId;
  String? action;
  bool? statusChange;
  String? oldStatus;
  String? newStatus;
  bool? categoryChange;
  String? oldCategory;
  String? newCategory;
  dynamic userType;
  dynamic notes;
  dynamic meta;
  String? createdAt;
  String? updatedAt;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['allocated_to'] = allocatedTo;
    map['contact_data_record_id'] = contactDataRecordId;
    map['action'] = action;
    map['status_change'] = statusChange;
    map['old_status'] = oldStatus;
    map['new_status'] = newStatus;
    map['category_change'] = categoryChange;
    map['old_category'] = oldCategory;
    map['new_category'] = newCategory;
    map['user_type'] = userType;
    map['notes'] = notes;
    map['meta'] = meta;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    this.id,
    this.fullName,
    this.type,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['full_name'];
    type = json['type'];
  }
  int? id;
  String? fullName;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    map['type'] = type;
    return map;
  }
}

class CustomerCompanyAdmin {
  CustomerCompanyAdmin({
    this.userId,
    this.id,
  });

  CustomerCompanyAdmin.fromJson(dynamic json) {
    userId = json['user_id'];
    id = json['id'];
  }
  int? userId;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['id'] = id;
    return map;
  }
}
