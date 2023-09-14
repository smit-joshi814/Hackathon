// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  late String? id;
  final String name;
  final String email;
  final String password;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  toJson() {
    return {
      "Name": name,
      "email": email,
      "password": password,
    };
  }
}
