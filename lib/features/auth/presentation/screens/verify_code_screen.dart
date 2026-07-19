import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/utils/ui_utils.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/features/auth/data/models/resend_otp_request.dart';
import 'package:sooqy/features/auth/data/models/validate_otp_request.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_states.dart';
import 'package:sooqy/features/auth/presentation/widgets/header_section.dart';
import 'package:sooqy/features/auth/presentation/widgets/opt_filed.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  String get code => otpControllers.map((c) => c.text.trim()).join();

  @override
  void dispose() {
    for (final controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Code'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is ValidateOtpLoading || state is ResendOtpLoading) {
                UIUtils.showLoading(context);
              } else if (state is ValidateOtpSuccess) {
                UIUtils.hideLoading(context);
                Navigator.of(context).pushReplacementNamed(
                  Routes.newPassword,
                  arguments: {'code': code, 'email': widget.email},
                );
              } else if (state is ResendOtpSuccess) {
                UIUtils.hideLoading(context);
                UIUtils.showMessage('code resent successfully');
              } else if (state is ValidateOtpError) {
                UIUtils.hideLoading(context);
                UIUtils.showMessage(state.message);
              } else if (state is ResendOtpError) {
                UIUtils.hideLoading(context);
                UIUtils.showMessage(state.message);
              }
            },
            child: Column(
              children: [
                SizedBox(height: 16),
                const HeaderSection(),
                const SizedBox(height: 32),
                Text(
                  "Enter the code we sent to your email address to reset your password.",
                  style: getSemiBoldStyle(color: ColorManager.gradiant1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.email,
                  style: getSemiBoldStyle(color: ColorManager.green),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OptFiled(controller: otpControllers[0]),
                    OptFiled(controller: otpControllers[1]),
                    OptFiled(controller: otpControllers[2]),
                    OptFiled(controller: otpControllers[3]),
                    OptFiled(controller: otpControllers[4]),
                    OptFiled(controller: otpControllers[5]),
                  ],
                ),
                const SizedBox(height: 32),
                CustomElevatedButton(
                  innerPadding: const EdgeInsets.all(16),
                  label: 'Verify Code',
                  onTap: () {
                    context.read<AuthCubit>().validateOtp(
                      ValidateOtpRequest(email: widget.email, code: code),
                    );
                  },
                  isStadiumBorder: false,
                  radius: 16,
                  backgroundColor: ColorManager.green,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      "Didn't receive the code?",
                      style: getSemiBoldStyle(color: ColorManager.gradiant1),
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: () {
                        context.read<AuthCubit>().resendOtp(
                          ResendOtpRequest(email: widget.email),
                        );
                      },
                      child: Text(
                        'Resend Code',
                        style: getSemiBoldStyle(color: ColorManager.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
