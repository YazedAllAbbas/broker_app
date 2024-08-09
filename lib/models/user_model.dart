class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final int phone;
  final String password;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.password});
}
