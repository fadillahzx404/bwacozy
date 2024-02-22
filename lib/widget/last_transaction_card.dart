import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class LastTransacionCard extends StatelessWidget {
  const LastTransacionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.wallet),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Deposit',
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Text(
              'Rp.1.000.000',
              style: blackTextStyle.copyWith(
                  fontSize: 16,
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }
}
