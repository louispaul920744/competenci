import 'package:competenci/configs/app_constants.dart';
import 'package:competenci/views/screens/otp_verification/otp_verification_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
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
  String countryCode = "IN";
  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    nameFocusNode.dispose();
    phoneFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kCulturedWhite,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        focusNode: nameFocusNode,
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
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      IntlPhoneField(
                        initialCountryCode: "IN",
                        controller: phoneController,
                        autoValidate: true,
                        focusNode: phoneFocusNode,
                        onCountryChanged: (changedCode) {
                          if (kDebugMode) {
                            print(changedCode.countryCode);
                          }
                          setState(() {
                            countryCode = changedCode.countryCode!;
                          });
                        },
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
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      showPopup(context);
                                    },
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
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showPrivacyPopup(context);
                                      }),
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
                            if (formKey.currentState!.validate()) {
                              if (termsAccepted) {
                                nameFocusNode.unfocus();
                                phoneFocusNode.unfocus();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => OTPVerificationScreen(
                                      mobileNumber: phoneController.text,
                                      countryCode: countryCode,
                                    ),
                                  ),
                                );
                              }
                              nameFocusNode.unfocus();
                              phoneFocusNode.unfocus();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  action: SnackBarAction(
                                    onPressed: () {
                                      setState(() {
                                        termsAccepted = true;
                                      });
                                    },
                                    label: "Accept",
                                    textColor: AppColors.kCulturedWhite,
                                  ),
                                  content: Text(
                                    "Please accept to the Terms & Conditions",
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.copyWith(
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
      ),
    );
  }

  Future<void> showPopup(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Terms & Conditions",
            style: Theme.of(context).textTheme.headline6,
          ),
          content: Text(
            "Terms and Conditions goes here",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        );
      },
    );
  }

  Future<void> showPrivacyPopup(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Privacy & Policy",
            style: Theme.of(context).textTheme.headline6,
          ),
          content: Text(
            "Privacy & Policy goes here",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        );
      },
    );
  }
}
