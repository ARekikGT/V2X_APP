class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? profileImageUrl;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.profileImageUrl,
  });

  // Convertir un UserModel en Map (pour Firestore)
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
    };
  }

  // Convertir un document Firestore en UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      profileImageUrl: map['profileImageUrl'],
    );
  }
}
