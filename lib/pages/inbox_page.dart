import 'package:bwa_cozy/pages/favorite_page.dart';
import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/pages/wallet_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widget/bottom_navbaritem.dart';
import 'package:bwa_cozy/widget/inbox_card.dart';
import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: edge,
              ),
              Text(
                'Inbox',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              Text(
                'Pesan yang masuk ada disini.',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Expanded(
                child: Wrap(
                  runSpacing: 14,
                  children: [
                    InboxCard('Informasi 1', 'Wallet'),
                    InboxCard('Informasi 2', 'Wallet'),
                    InboxCard('Informasi 3', 'Wallet'),
                    InboxCard('Informasi 4', 'Wallet'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        decoration: BoxDecoration(
          color: const Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
              ),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: ((context, animation, secondaryAnimation) =>
                          const HomePage()))),
              child: BottomNavbarItem(
                icon: Icon(
                  Icons.home_rounded,
                  color: greyColor,
                ),
                isActive: false,
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
              ),
              child: const BottomNavbarItem(
                icon: Icon(
                  Icons.email_rounded,
                ),
                isActive: true,
              ),
            ),
            OutlinedButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: ((context, animation, secondaryAnimation) =>
                          const WalletPage()))),
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
              ),
              child: BottomNavbarItem(
                icon: Icon(
                  Icons.wallet_rounded,
                  color: greyColor,
                ),
                isActive: false,
              ),
            ),
            OutlinedButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: ((context, animation, secondaryAnimation) =>
                          const FavoritePage()))),
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
              ),
              child: BottomNavbarItem(
                icon: Icon(
                  Icons.favorite,
                  color: greyColor,
                ),
                isActive: false,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
