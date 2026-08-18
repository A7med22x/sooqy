import 'package:sooqy/features/auth/data/models/user_model.dart';
import 'package:sooqy/features/auth/domain/entities/user.dart';

extension UserMapper on UserModel {
  User get toEntity =>
      User(userId: userId, email: email, fullName: fullName, profilePicture: profilePicture);
}
