import 'package:competenci/configs/app_constants.dart';
import 'package:competenci/views/screens/choose_account/choose_account.dart';
import 'package:competenci/views/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String mobileNumber;
  final String countryCode;

  const OTPVerificationScreen({
    Key? key,
    required this.mobileNumber,
    required this.countryCode,
  }) : super(key: key);

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  String enteredOTP = '';
  FocusNode otpFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kCulturedWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "OTP\nVerification",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Enter the OTP Code sent to",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Text(
                    "${widget.countryCode} ${widget.mobileNumber}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              PinCodeTextField(
                appContext: context,
                length: 4,
                focusNode: otpFocusNode,
                onChanged: (val) {
                  setState(() {
                    enteredOTP = val;
                  });
                },
                pinTheme: PinTheme(
                  fieldWidth: 48.0,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    if (enteredOTP.length != 4) {
                      otpFocusNode.unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            "Please enter 4-Digit OTP",
                            style: Theme.of(context).textTheme.button?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      );
                    }
                    if (enteredOTP == '1234') {
                      otpFocusNode.unfocus();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const ChooseAccountScreen(),
                        ),
                      );
                    } else {
                      otpFocusNode.unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            "Wrong OTP, try again!",
                            style: Theme.of(context).textTheme.button?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      );
                    }
                  },
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  height: 60.0,
                  color: AppColors.kJasperRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "Continue",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
