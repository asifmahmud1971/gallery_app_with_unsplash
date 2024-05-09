class UserModel {
  int id;
  String name;
  bool isActive;

  UserModel({
    required this.id,
    required this.name,
    required this.isActive,
  });

  UserModel copyWith({
    int? id,
    String? name,
    bool? isActive,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        isActive: isActive ?? this.isActive,
      );
}
