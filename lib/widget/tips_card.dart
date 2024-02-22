import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  const TipsCard(this.tips, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Updated ${tips.UpdatedAt}',
              style: greyTextStyle,
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(
            right: 24,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              color: greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
