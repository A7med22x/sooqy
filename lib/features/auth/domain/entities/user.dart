class User {
  final String userId;
  final String email;
  final String fullName;
  final String? profilePicture;

  const User({
    required this.userId,
    required this.email,
    required this.fullName,
    this.profilePicture,
  });
}
