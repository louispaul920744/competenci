import 'package:competenci/views/screens/choose_account/widgets/choose_account_card.dart';
import 'package:flutter/material.dart';

class ChooseAccountScreen extends StatefulWidget {
  const ChooseAccountScreen({Key? key}) : super(key: key);

  @override
  _ChooseAccountScreenState createState() => _ChooseAccountScreenState();
}

class _ChooseAccountScreenState extends State<ChooseAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose\nYour Account",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "Lorem Ipsum....",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: const [
                    ChooseAccountCard(
                      avatar: 'assets/images/user.jpeg',
                      profileName: 'Sabarinath',
                      userId: '123456',
                    ),
                    ChooseAccountCard(
                      avatar: 'assets/images/user.jpeg',
                      profileName: 'Sabarinath',
                      userId: '123456',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
