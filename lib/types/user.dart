class User {
  final String? name;
  final String? document;
  final String? latitude;
  final String? longitude;
  final String? password;
  final int? rolePermission;

  const User(
      {this.name = 'Não informado',
      this.document = 'Não informado',
      this.latitude = 'Não informado',
      this.longitude = 'Não informado',
      this.password = 'Não informado',
      this.rolePermission = 0});
}
