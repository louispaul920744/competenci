import 'package:competenci/configs/app_constants.dart';
import 'package:competenci/views/screens/otp_verification/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kCulturedWhite,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hey,\nLogin Now",
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
                "Please enter your mobile number",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: "Enter Name",
                        hintStyle:
                            Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    IntlPhoneField(
                      initialCountryCode: "IN",
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: "Enter Phone Number",
                        hintStyle:
                            Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: termsAccepted,
                          onChanged: (val) {
                            setState(() {
                              termsAccepted = val!;
                            });
                          },
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "By creating an account, you agree to our\n",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              TextSpan(
                                text: "Terms of Service ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: "and ",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Center(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OTPVerificationScreen(
                                mobileNumber: phoneController.text,
                              ),
                            ),
                          );
                        },
                        minWidth: MediaQuery.of(context).size.width * 0.9,
                        height: 60.0,
                        color: AppColors.kJasperRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          "Continue",
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
              ),
              Center(
                child: Image.asset(
                  'assets/images/powered_by.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
