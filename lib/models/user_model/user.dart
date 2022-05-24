class User {
  final String accountName;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String image;
  final String accessLevel;
  final String accessToken;
  final String schemaName;

  User(
      {this.firstName = '',
      this.lastName = '',
      this.email = '',
      this.phoneNumber = '',
      this.image = '',
      this.accessLevel = '',
      this.accountName = '',
      this.accessToken = '',
      this.schemaName = ''});

  factory User.fromJson(dynamic json) {
    return User(
      accountName: json['accountName'] ?? '',
      firstName: json['FirstName'] ?? '',
      lastName: json['LastName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      image: json['image'] ?? '',
      accessLevel: json['accessLevel'] ?? '',
      accessToken: json['accessToken'] ?? '',
      schemaName: json['schemaName'] ?? ''
    );
  }
}
