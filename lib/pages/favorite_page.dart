import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/pages/inbox_page.dart';
import 'package:bwa_cozy/pages/wallet_page.dart';
import 'package:bwa_cozy/providers/space_providers.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widget/bottom_navbaritem.dart';
import 'package:bwa_cozy/widget/space_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

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
                'Favorited Space',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              Text(
                'Tempat yang anda favoritkan.',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: spaceProvider.getRecomendedSpaces(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = (snapshot.data as List<Space>);

                        int index = 0;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 100),
                          child: Column(
                            children: data.map((item) {
                              index++;
                              return Container(
                                margin: EdgeInsets.only(
                                  top: index == 1 ? 0 : 30,
                                ),
                                child: SpaceCard(item),
                              );
                            }).toList(),
                          ),
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
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
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
              ),
              child: const BottomNavbarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                isActive: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
