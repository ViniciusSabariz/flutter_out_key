class User {
  final String? id;
  final String? name;
  final String? document;
  final String? latitude;
  final String? longitude;
  final String? password;
  final int? rolePermission;
  final int? age;

  const User(
      {this.name = 'Não informado',
      this.document = 'Não informado',
      this.id = 'Não informado',
      this.latitude = 'Não informado',
      this.longitude = 'Não informado',
      this.password = 'Não informado',
      this.age = 0,
      this.rolePermission = 0});
}
