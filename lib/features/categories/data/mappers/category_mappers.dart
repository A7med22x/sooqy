import 'package:sooqy/features/categories/data/models/category_model.dart';
import 'package:sooqy/features/categories/domain/entities/category.dart';

extension CategoryMapper on CategoryModel {
  Category get toEntity =>
      Category(id: id, name: name, coverPictureUrl: coverPictureUrl);
}
