import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/pages/favorite_page.dart';
import 'package:bwa_cozy/pages/inbox_page.dart';
import 'package:bwa_cozy/pages/wallet_page.dart';
import 'package:bwa_cozy/providers/space_providers.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widget/bottom_navbaritem.dart';
import 'package:bwa_cozy/widget/city_card.dart';
import 'package:bwa_cozy/widget/space_card.dart';
import 'package:bwa_cozy/widget/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: edge,
              ),
              // NOTE: TITLE/HEADER
              Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // NOTE: POPULAR CITIES
              Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(City(
                        id: 1,
                        name: 'Jakarta',
                        ImageUrl: 'assets/images/city1.png')),
                    const SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 2,
                      name: 'Bandung',
                      ImageUrl: 'assets/images/city2.png',
                      isPopular: true,
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 3,
                        name: 'Surabaya',
                        ImageUrl: 'assets/images/city3.png')),
                    const SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 4,
                        name: 'Palembang',
                        ImageUrl: 'assets/images/city4.png')),
                    const SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 5,
                      name: 'Aceh',
                      ImageUrl: 'assets/images/city5.png',
                      isPopular: true,
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 6,
                        name: 'Bogor',
                        ImageUrl: 'assets/images/city6.png')),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // NOTE: RECOMENDED SPACE
              Text(
                'Recomended Space',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder(
                future: spaceProvider.getRecomendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = (snapshot.data as List<Space>);

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),

              const SizedBox(
                height: 30,
              ),
              // NOTE: TIPS & GUIDANCE
              Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  TipsCard(
                    Tips(
                        id: 1,
                        imageUrl: 'assets/images/tips1.png',
                        title: 'City Guidelines',
                        UpdatedAt: '20 Apr'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      imageUrl: 'assets/images/tips2.png',
                      title: 'Jakarta Fairship',
                      UpdatedAt: '11 Dec',
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 70 + edge,
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
              onPressed: () {},
              child: const BottomNavbarItem(
                icon: Icon(
                  Icons.home_rounded,
                ),
                isActive: true,
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
