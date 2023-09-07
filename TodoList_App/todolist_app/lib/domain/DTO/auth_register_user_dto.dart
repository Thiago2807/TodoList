class AuthRegisterUserDTO {

  AuthRegisterUserDTO({required this.email, required this.password, required this.surname});

  String email;
  String surname;
  String password;

  Map<String, dynamic> toJson() => {
    "email": email,
    "surname": surname,
    "password": password
  };

}