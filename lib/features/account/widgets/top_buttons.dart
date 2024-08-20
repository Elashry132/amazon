import 'package:amazon/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              buttonText: 'Your Orders',
              onPressed: () {},
            ),
            AccountButton(
              buttonText: 'Turn Seller',
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              buttonText: 'Log out',
              onPressed: () {},
            ),
            AccountButton(
              buttonText: 'Your wishlist',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
