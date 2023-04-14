import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/providers/space_providers.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widget/bottom_navbaritem.dart';
import 'package:bwa_cozy/widget/city_card.dart';
import 'package:bwa_cozy/widget/space_card.dart';
import 'package:bwa_cozy/widget/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
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
              SizedBox(
                height: 2,
              ),
              Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE: POPULAR CITIES
              Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(City(
                        id: 1,
                        name: 'Jakarta',
                        ImageUrl: 'assets/images/city1.png')),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 2,
                      name: 'Bandung',
                      ImageUrl: 'assets/images/city2.png',
                      isPopular: true,
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 3,
                        name: 'Surabaya',
                        ImageUrl: 'assets/images/city3.png')),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 4,
                        name: 'Palembang',
                        ImageUrl: 'assets/images/city4.png')),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 5,
                      name: 'Aceh',
                      ImageUrl: 'assets/images/city5.png',
                      isPopular: true,
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 6,
                        name: 'Bogor',
                        ImageUrl: 'assets/images/city6.png')),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE: RECOMENDED SPACE
              Text(
                'Recomended Space',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
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

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),

              SizedBox(
                height: 30,
              ),
              // NOTE: TIPS & GUIDANCE
              Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
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
                  SizedBox(
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
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              ImageUrl: 'assets/images/icon_home.png',
              IsActive: true,
            ),
            BottomNavbarItem(
              ImageUrl: 'assets/images/icon_email.png',
              IsActive: false,
            ),
            BottomNavbarItem(
              ImageUrl: 'assets/images/icon_card.png',
              IsActive: false,
            ),
            BottomNavbarItem(
              ImageUrl: 'assets/images/icon_love.png',
              IsActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
