import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.isSelected,
    required this.index,
    this.onEdit,
    this.onDelete,
  });

  final bool isSelected;
  final int index;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key('address.id'),
        background: slideRightBackground(context),
        secondaryBackground: slideLeftBackground(context),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            onEdit?.call();
            return false; 
          } else if (direction == DismissDirection.endToStart) {
            final confirm = await showDialog<bool>(
              context: context,
              builder:
                  (_) => AlertDialog(
                    title: const Text("تأكيد الحذف"),
                    content: const Text("هل أنت متأكد من حذف هذا العنوان؟"),
                    actions: [
                      TextButton(
                        child: const Text("إلغاء"),
                        onPressed: () => Navigator.pop(context, false),
                      ),
                      TextButton(
                        child: const Text("حذف"),
                        onPressed: () {
                          Navigator.pop(context, true);
                                                  },
                      ),
                    ],
                  ),
            );
            if (confirm == true) {
              onDelete?.call();
              return true;
            }
            return false;
          }
          return false;
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                (isSelected)
                    ? ColorManager.lightPrimaryColor.withAlpha(30)
                    : ColorManager.greyColor.withAlpha(30),
            border: Border.all(
              color:
                  isSelected
                      ? ColorManager.lightPrimaryColor
                      : ColorManager.gradiant2,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.black.withAlpha(15),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Address ${index + 1}',
                    style: getSemiBoldStyle(color: ColorManager.black),
                  ),
                ],
              ),

              const Divider(color: ColorManager.grey),
              const SizedBox(height: 6),

              Text('address.fullAddress'),
              Text('address.notes'),

              const SizedBox(height: 6),
              Row(
                children: [
                  Text('address.phoneNumber'),
                  const SizedBox(width: 8),
                  Text(
                      'تم التحقق',
                      style: getBoldStyle(color: ColorManager.green, fontSize: 16)
                    ),
                ],
              ),
            ],
          ),
        ),
    );
  }

  Widget slideRightBackground(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: ColorManager.blueAccent,
      child: Row(
        children: [
          Icon(Icons.edit, color: ColorManager.white),
          SizedBox(width: 8),
          Text(
            "تعديل",
            style: getBoldStyle(color: ColorManager.white),
          ),
        ],
      ),
    );
  }

  Widget slideLeftBackground(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: ColorManager.redAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.delete, color: ColorManager.white),
          SizedBox(width: 8),
          Text(
            "حذف",
            style:  getBoldStyle(color: ColorManager.white),
          ),
        ],
      ),
    );
  }
}
