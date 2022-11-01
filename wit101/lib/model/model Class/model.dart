class Movie {
  Movie(
      {required this.uid,
      required this.name,
      required this.email,
      required this.password,
      required this.role,
      required this.alamat});

  Movie.fromJson(Map<String, Object?> json)
      : this(
          uid: json['uid']! as String,
          name: json['name']! as String,
          email: json['email']! as String,
          password: json['password']! as String,
          role: json['role']! as String,
          alamat: json['alamat']! as String,
        );

  final String name;
  final String uid;
  final String email;
  final String password;
  final String role;
  final String alamat;

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'uid': name,
      'email': email,
      'password': password,
      'role': role,
      'alamat': alamat,
    };
  }
}
