class UserEntity {
  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  String id;
  String name;
  String email;
  String token;

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        token: json["token"],
      );
}
