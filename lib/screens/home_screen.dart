import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditaion_app/cards/custom_card.dart';
import 'package:meditaion_app/screens/app_drawer.dart';

import '../model/custom_list.dart';
import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CustomList> listData = [
    CustomList(
        bgColor: CustomColor.firstIconBgColor,
        imageData: 'assets/smile_icon.svg',
        text: 'Happy'),
    CustomList(
        bgColor: CustomColor.secondIconBgColor,
        imageData: 'assets/calm_icon.svg',
        text: 'Calm'),
    CustomList(
        bgColor: CustomColor.thirdIconBgColor,
        imageData: 'assets/relax_icon.svg',
        text: 'Relax'),
    CustomList(
        bgColor: CustomColor.fourthIconBgColor,
        imageData: 'assets/focus_icon.svg',
        text: 'Focus'),
    CustomList(
        bgColor: CustomColor.firstIconBgColor,
        imageData: 'assets/fav_icon.svg',
        text: 'Fav'),
    CustomList(
        bgColor: CustomColor.secondIconBgColor,
        imageData: 'assets/kid_icon.svg',
        text: 'Kid'),
    CustomList(
        bgColor: CustomColor.thirdIconBgColor,
        imageData: 'assets/sad_icon.svg',
        text: 'Sad'),
    CustomList(
      bgColor: CustomColor.fourthIconBgColor,
      imageData: 'assets/yoga_icon.svg',
      text: 'Yoga',
      iconColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double ht = MediaQuery.sizeOf(context).height;
    final double wd = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset(
              width: wd * 0.02,
              height: ht * 0.02,
              'assets/hamburger_icon.svg',
              fit: BoxFit.cover,
              color: CustomColor.iconColor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Welcome back ',
                style: TextStyle(
                  fontSize: wd * 0.07,
                  color: CustomColor.textColor,
                ),
                children: [
                  TextSpan(
                    text: 'Tony',
                    style: TextStyle(
                      fontSize: wd * 0.07,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ht * 0.02,
            ),
            Text(
              'How are you feeling today ?',
              style: TextStyle(
                fontSize: wd * 0.06,
                color: CustomColor.textColor,
              ),
            ),
            SizedBox(
              height: ht * 0.02,
            ),
            SizedBox(height: ht * 0.16, child: buildListview()),
            SizedBox(
              height: ht * 0.01,
            ),
            Text(
              'Today’s Task',
              style: TextStyle(
                fontSize: wd * 0.06,
                color: CustomColor.textColor,
              ),
            ),
            SizedBox(
              height: ht * 0.02,
            ),
            CustomCard(
                image: 'assets/card_meetup_icon.svg',
                icon: Icons.play_circle_filled_rounded,
                iconColor: Colors.pink,
                bgColor: CustomColor.firstCardBgColor,
                title: 'Peer Group Meetup',
                onTap: () {},
                subtitle:
                    'Let’s open up to the  thing that\nmatters among the people ',
                linkText: 'Join Now'),
            SizedBox(
              height: ht * 0.02,
            ),
            CustomCard(
                image: 'assets/card_meditation_icon.svg',
                icon: Icons.watch_later,
                iconColor: Colors.orange,
                bgColor: CustomColor.secondCardBgColor,
                title: 'Meditation',
                onTap: () {},
                subtitle:
                    'Aura is the most important thing\nthat matters to you.join us on ',
                linkText: '06:00 PM'),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListview() {
    final double ht = MediaQuery.sizeOf(context).height;
    final double wd = MediaQuery.sizeOf(context).width;

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: listData.length * 2,
      itemBuilder: (context, index) {
        final item = listData[index % listData.length];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Container(
                height: ht * 0.10,
                width: wd * 0.20,
                decoration: BoxDecoration(
                  color: item.bgColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    item.imageData,
                    height: ht * 0.04,
                    width: wd * 0.04,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: ht * 0.01),
              Text(
                item.text,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: wd * 0.05,
                    color: CustomColor.textColor),
              ),
            ],
          ),
        );
      },
    );
  }
}
