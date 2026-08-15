import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/utils/ui_utils.dart';
import 'package:sooqy/core/utils/validators.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/core/widgets/custom_text_field.dart';
import 'package:sooqy/features/auth/data/models/forget_password_request.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_states.dart';
import 'package:sooqy/features/auth/presentation/widgets/header_section.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
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
            child: Column(
              children: [
                SizedBox(height: 16),
                const HeaderSection(),
                const SizedBox(height: 32),
                Text(
                  "Don't worry, just enter your email address and we will send you a verification code.",
                  style: getSemiBoldStyle(color: ColorManager.gradiant1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  borderBackgroundColor: ColorManager.border,
                  controller: _emailController,
                  hint: 'Enter your email',
                  backgroundColor: ColorManager.backgroundColor,
                  validation: Validator.validateEmail,
                ),
                const SizedBox(height: 32),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is ForgotPasswordLoading) {
                      UIUtils.showLoading(context);
                    } else if (state is ForgotPasswordSuccess) {
                      UIUtils.hideLoading(context);
                      Navigator.of(context).pushReplacementNamed(
                        Routes.verifyCode,
                        arguments: _emailController.text,
                      );
                    } else if (state is ForgotPasswordError) {
                      UIUtils.hideLoading(context);
                      UIUtils.showMessage(state.message);
                    }
                  },
                  child: CustomElevatedButton(
                    innerPadding: const EdgeInsets.all(16),
                    label: 'Reset Password',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().forgotPassword(
                          ForgetPasswordRequest(email: _emailController.text),
                        );
                      }
                    },
                    isStadiumBorder: false,
                    radius: 16,
                    backgroundColor: ColorManager.green,
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
