import 'package:competenci/views/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class ChooseAccountCard extends StatelessWidget {
  final String avatar;
  final String profileName;
  final String userId;

  const ChooseAccountCard({
    Key? key,
    required this.avatar,
    required this.userId,
    required this.profileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            avatar: avatar,
            profileName: profileName,
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 100.0,
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                avatar,
                width: 80.0,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  profileName,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  "ID: $userId",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
