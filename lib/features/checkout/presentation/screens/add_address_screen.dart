import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/utils/ui_utils.dart';
import 'package:sooqy/core/utils/validators.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/core/widgets/custom_text_field.dart';
import 'package:sooqy/features/checkout/data/models/address_response/address_request.dart';
import 'package:sooqy/features/checkout/domain/entities/address.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_states.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key, this.address});

  final Address? address;

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
  void initState() {
    if (widget.address != null) {
      _stateCon.text = widget.address!.state;
      _streetCon.text = widget.address!.street;
      _cityCon.text = widget.address!.city;
      _apartmentCon.text = widget.address!.apartment;
      _phoneCon.text = widget.address!.phoneNumber;
      _notesCon.text = widget.address!.state;
    }
    super.initState();
  }

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
        title: Text(
          widget.address != null ? 'Update Address' : 'Add New Address',
        ),
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
                  validation: Validator.validateFullName,
                ),

                const SizedBox(height: 12),

                CustomTextField(
                  backgroundColor: ColorManager.greyColor.withAlpha(30),
                  borderBackgroundColor: ColorManager.greyColor,
                  hint: 'City',
                  controller: _cityCon,
                  validation: Validator.validateFullName,
                ),

                const SizedBox(height: 12),

                CustomTextField(
                  backgroundColor: ColorManager.greyColor.withAlpha(30),
                  borderBackgroundColor: ColorManager.greyColor,
                  hint: 'Street',
                  controller: _streetCon,
                  validation: Validator.validateFullName,
                ),

                const SizedBox(height: 12),
                CustomTextField(
                  backgroundColor: ColorManager.greyColor.withAlpha(30),
                  borderBackgroundColor: ColorManager.greyColor,
                  hint: 'Phone Number',
                  controller: _phoneCon,
                  validation: Validator.validatePhoneNumber,
                ),

                const SizedBox(height: 12),

                CustomTextField(
                  backgroundColor: ColorManager.greyColor.withAlpha(30),
                  borderBackgroundColor: ColorManager.greyColor,
                  hint: 'Apartment / Landmark',
                  controller: _apartmentCon,
                  validation: Validator.validateFullName,
                ),

                const SizedBox(height: 12),

                CustomTextField(
                  backgroundColor: ColorManager.greyColor.withAlpha(30),
                  borderBackgroundColor: ColorManager.greyColor,
                  hint: 'Notes',
                  controller: _notesCon,
                ),
                const SizedBox(height: 100),
                BlocListener<CheckoutCubit, CheckoutState>(
                  listener: (context, state) {
                    if (state is AddAddressLoading ||
                        state is UpdateAddressLoading) {
                      UIUtils.showLoading(context);
                    } else if (state is AddAddressSuccess ||
                        state is UpdateAddressSuccess) {
                      UIUtils.hideLoading(context);
                      Navigator.of(context).pop();
                    } else if (state is AddAddressError) {
                      UIUtils.hideLoading(context);
                      UIUtils.showMessage(state.message);
                    } else if (state is UpdateAddressError) {
                      UIUtils.hideLoading(context);
                      UIUtils.showMessage(state.message);
                    }
                  },
                  child: CustomElevatedButton(
                    isStadiumBorder: false,
                    innerPadding: const EdgeInsets.all(16),
                    backgroundColor: ColorManager.primaryColor,
                    label: widget.address != null
                        ? 'Update Address'
                        : 'Save Address',
                    onTap: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      final cubit = context.read<CheckoutCubit>();

                      if (widget.address != null) {
                        final oldAddress = widget.address!;

                        final bool hasChanges =
                            _stateCon.text.trim() != oldAddress.state ||
                            _cityCon.text.trim() != oldAddress.city ||
                            _streetCon.text.trim() != oldAddress.street ||
                            _apartmentCon.text.trim() != oldAddress.apartment ||
                            _phoneCon.text.trim() != oldAddress.phoneNumber ||
                            _notesCon.text.trim() != oldAddress.notes;

                        if (!hasChanges) {
                          UIUtils.showMessage('No Changes');
                          return;
                        }

                        cubit.updateAddress(
                          oldAddress.id,
                          AddressRequest(
                            id: oldAddress.id,
                            state: _stateCon.text.trim(),
                            city: _cityCon.text.trim(),
                            street: _streetCon.text.trim(),
                            apartment: _apartmentCon.text.trim(),
                            phoneNumber: _phoneCon.text.trim(),
                            notes: _notesCon.text.trim(),
                          ),
                        );
                      } else {
                        cubit.addNewAddress(
                          AddressRequest(
                            state: _stateCon.text.trim(),
                            city: _cityCon.text.trim(),
                            street: _streetCon.text.trim(),
                            apartment: _apartmentCon.text.trim(),
                            phoneNumber: _phoneCon.text.trim(),
                            notes: _notesCon.text.trim(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
