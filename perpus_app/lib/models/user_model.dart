class UserModel {
  final String id;
  final String name;
  final String email;
  final DateTime? createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> j) {
    DateTime? parsedCreatedAt;
    final rawDate = j['created_at'];
    if (rawDate != null) {
      if (rawDate is String) {
        parsedCreatedAt = DateTime.tryParse(rawDate)?.toLocal();
      } else if (rawDate is DateTime) {
        parsedCreatedAt = rawDate;
      }
    }

    return UserModel(
      id: j['id']?.toString() ?? '',
      name: j['name'] ?? '',
      email: j['email'] ?? '',
      createdAt: parsedCreatedAt,
    );
  }
}
