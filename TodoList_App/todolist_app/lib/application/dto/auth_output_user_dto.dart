class AuthOutputUserDTO {
  AuthOutputUserDTO(
      {required this.id,
      required this.name,
      required this.email,
      required this.token,
      required this.password});

  String id;
  String name;
  String email;
  String token;
  String password;

  factory AuthOutputUserDTO.fromJson(Map<String, dynamic> json) =>
      AuthOutputUserDTO(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        token: json["token"],
        password: json["password"]
      );
}
