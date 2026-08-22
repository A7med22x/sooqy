import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/core/widgets/custom_text_field.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController _stateCon = TextEditingController();
  final TextEditingController _cityCon = TextEditingController();
  final TextEditingController _streetCon = TextEditingController();
  final TextEditingController _apartmentCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();
  final TextEditingController _notesCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _stateCon.dispose();
    _cityCon.dispose();
    _apartmentCon.dispose();
    _phoneCon.dispose();
    _streetCon.dispose();
    _notesCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Address'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 12),

                CustomTextField(
                  backgroundColor: ColorManager.greyColor.withAlpha(30),
                  borderBackgroundColor: ColorManager.greyColor,
                  hint: 'Governorate',
                  controller: _stateCon,
                ),

                const SizedBox(height: 12),

                CustomTextField(
                  backgroundColor: ColorManager.greyColor.withAlpha(30),
                  borderBackgroundColor: ColorManager.greyColor,
                  hint: 'City',
                  controller: _cityCon,
                ),

                const SizedBox(height: 12),

                CustomTextField(
                  backgroundColor: ColorManager.greyColor.withAlpha(30),
                  borderBackgroundColor: ColorManager.greyColor,
                  hint: 'Street',
                  controller: _streetCon,
                ),

                const SizedBox(height: 12),
                CustomTextField(
                  backgroundColor: ColorManager.greyColor.withAlpha(30),
                  borderBackgroundColor: ColorManager.greyColor,
                  hint: 'Phone Number',
                  controller: _phoneCon,
                ),

                const SizedBox(height: 12),

                CustomTextField(
                  backgroundColor: ColorManager.greyColor.withAlpha(30),
                  borderBackgroundColor: ColorManager.greyColor,
                  hint: 'Apartment / Landmark',
                  controller: _apartmentCon,
                ),

                const SizedBox(height: 12),

                CustomTextField(
                  backgroundColor: ColorManager.greyColor.withAlpha(30),
                  borderBackgroundColor: ColorManager.greyColor,
                  hint: 'Notes',
                  controller: _notesCon,
                ),
                const SizedBox(height: 100,),
                CustomElevatedButton(
                  isStadiumBorder: false,
                  innerPadding: const EdgeInsets.all(16),
                  backgroundColor: ColorManager.primaryColor,
                  label: 'Save Address',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
