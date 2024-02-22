import 'package:bwa_cozy/pages/favorite_page.dart';
import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/pages/inbox_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widget/bottom_navbaritem.dart';
import 'package:bwa_cozy/widget/last_transaction_card.dart';
import 'package:bwa_cozy/widget/wallet_card.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

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
                'Wallet',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              Text(
                'Brangkas anda berada di sini.',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const WalletCard(3000000),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Menu',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                            border: Border.all(
                                width: 0.5, color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.account_balance_wallet_outlined,
                              color: purpleColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Deposit'),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                            border: Border.all(
                                width: 0.5, color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.account_balance_wallet_outlined,
                              color: purpleColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Deposit')
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                            border: Border.all(
                                width: 0.5, color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.account_balance_wallet_outlined,
                              color: purpleColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Deposit'),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                            border: Border.all(
                                width: 0.5, color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.account_balance_wallet_outlined,
                              color: purpleColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Deposit')
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Last Transaction',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 120),
                    child: Wrap(
                      runSpacing: 12,
                      children: [
                        LastTransacionCard(),
                        LastTransacionCard(),
                        LastTransacionCard(),
                        LastTransacionCard(),
                        LastTransacionCard(),
                        LastTransacionCard(),
                      ],
                    ),
                  ),
                ),
              )
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
              onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: ((context, animation, secondaryAnimation) =>
                          const InboxPage()))),
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
              ),
              child: BottomNavbarItem(
                icon: Icon(
                  Icons.email_rounded,
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
                  Icons.wallet_rounded,
                ),
                isActive: true,
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
