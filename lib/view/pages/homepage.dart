import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hagglex/main.dart';
import 'package:hagglex/model/coin.dart';

import '../../stylesheet.dart';
import '../widgets/custom_switch.dart';

class Homepage extends StatelessWidget {
  const Homepage();

  static const String route = "/";

  @override
  Widget build(BuildContext context) {
    Get.put<_SlideController>(_SlideController());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
        statusBarIconBrightness: Brightness.light));
    final Size size = MediaQuery.of(context).size;

    return BlankPage.withoutSafeArea(
        child: Column(
      children: [
        Expanded(child: _MainContent()),
        _BottomNavBar(height: size.height * 0.12, width: size.width)
      ],
    ));
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final double height = constraints.maxHeight;
      final double width = constraints.maxWidth;
      return SingleChildScrollView(
        child: Column(
          children: [
            _AppBar(height: height * 0.25, width: width),
            SizedBox(
              height: height * 0.01,
            ),
            _Slides(height: height * 0.18, width: width),
            SizedBox(
              height: height * 0.01,
            ),
            GetBuilder<_SlideController>(
              builder: (state) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      6,
                      (index) => Padding(
                            child: Icon(Icons.circle,
                                size: 10,
                                color: state.currentIndex.value == index
                                    ? HaggleXColour.accentLight
                                    : HaggleXColour.primaryLight),
                            padding: EdgeInsets.symmetric(horizontal: 2),
                          ),
                      growable: false)),
            ),
            SizedBox(height: height * 0.03),
            _Markets(cardHeight: height * 0.13, pageWidth: width)
          ],
        ),
      );
    });
  }
}

class _Markets extends StatelessWidget {
  final double cardHeight;
  final double pageWidth;
  const _Markets({required this.cardHeight, required this.pageWidth});

  @override
  Widget build(BuildContext context) {
    final List<Coin> coins = List.unmodifiable([
      Coin(
          imageUrl: "assets/images/bitcoin_logo.png",
          name: "Bitcoin",
          abbreviatedName: "BTC",
          priceInDollar: "\$64,000"),
      Coin(
          imageUrl: "assets/images/bnb_logo.png",
          name: "Binance Coin",
          abbreviatedName: "BNB",
          priceInDollar: "\$500"),
      Coin(
          imageUrl: "assets/images/dogecoin_logo.png",
          name: "Doge Coin",
          abbreviatedName: "DOGE",
          priceInDollar: "\$1"),
      Coin(
          imageUrl: "assets/images/ethereum_logo.png",
          name: "Ethereum",
          abbreviatedName: "ETH",
          priceInDollar: "\$5000"),
      Coin(
          imageUrl: "assets/images/usdt_logo.png",
          name: "Tether",
          abbreviatedName: "USDT",
          priceInDollar: "\$1"),
    ]);

    return Container(
      width: pageWidth,
      padding: EdgeInsets.symmetric(horizontal: pageWidth * 0.05),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Markets",
                style: Fonts.black14w400.copyWith(fontWeight: FontWeight.w600)),
          ),
          SizedBox(height: cardHeight * 0.2),
          ...List.from([...coins, ...coins], growable: false).map<Widget>(
              (coin) =>
                  _MarketCard(coin: coin, height: cardHeight, width: pageWidth))
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final double height;
  final double width;
  const _AppBar({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(
          top: height * 0.32,
          left: width * 0.07,
          right: width * 0.07,
          bottom: height * 0.06),
      color: HaggleXColour.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.check_circle,
                  color: Colors.white70, size: height * 0.2),
              Text("HaggleX", style: Fonts.white16w500),
              Icon(Icons.notifications, color: Colors.white)
            ],
          ),
          _Balance(height: height * 0.16, width: width),
        ],
      ),
    );
  }
}

class _MarketCard extends StatelessWidget {
  final Coin coin;
  final double height;
  final double width;
  const _MarketCard(
      {required this.coin, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.8))),
      padding: EdgeInsets.symmetric(vertical: height * 0.05),
      child: Row(
        children: [
          Container(
            height: height * 0.5,
            width: width * 0.13,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey.shade200, shape: BoxShape.circle),
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              backgroundImage: Image.asset(coin.imageUrl,
                      height: height * 0.35, width: 0.2, fit: BoxFit.fill)
                  .image,
            ),
          ),
          SizedBox(width: width * 0.05),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${coin.name} (${coin.abbreviatedName})",
                  style:
                      Fonts.black14w400.copyWith(fontWeight: FontWeight.w500)),
              Text(
                coin.priceInDollar,
                style: Fonts.black12w300,
              )
            ],
          ))
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final double height;
  final double width;
  const _BottomNavBar({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    final double size = 28;
    return Container(
      height: height,
      alignment: Alignment.topCenter,
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.08, vertical: height * 0.1),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade400)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.home, color: HaggleXColour.primary, size: size),
          Icon(Icons.account_balance_wallet_rounded,
              color: Colors.grey, size: size),
          Icon(Icons.share_location_rounded,
              color: HaggleXColour.primary, size: size),
          Icon(Icons.people, color: Colors.grey, size: size),
          Icon(Icons.money_rounded, color: Colors.grey, size: size)
        ],
      ),
    );
  }
}

enum Currency { ngn, dollar }

class _Balance extends StatefulWidget {
  final double height;
  final double width;
  const _Balance({required this.height, required this.width});

  @override
  State<_Balance> createState() => _BalanceState();
}

class _BalanceState extends State<_Balance> {
  final String priceInNaira = "NGN0.00";
  final String priceInDollar = "\$**.**";

  Currency shown = Currency.dollar;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text("Total Portfolio Balance", style: Fonts.white12w300),
            SizedBox(height: 8),
            Text(shown == Currency.dollar ? priceInDollar : priceInNaira,
                style: Fonts.white18w500)
          ]),
          CustomSwitch<Currency>(
              height: widget.height,
              values: Currency.values,
              active: HaggleXColour.accentLight,
              initial: Currency.dollar,
              onChanged: (currency) => setState(() => shown = currency),
              activeFont: Fonts.black12w500,
              nonActiveFont: Fonts.black12w500,
              nonActive: Colors.white,
              valueToString: (currency) {
                return currency == Currency.dollar ? "USD" : "NGN";
              },
              borderRadius: 25,
              width: widget.width * 0.27)
        ],
      );
    });
  }
}

class _SlideController extends GetxController {
  RxInt _current = 0.obs;

  RxInt get currentIndex => _current;

  void changeSlideTo(int newIndex) {
    _current = newIndex.obs;
    update();
  }
}

class _Slides extends StatelessWidget {
  final double height;
  final double width;
  const _Slides({required this.height, required this.width});

  static const List<String> _urls = [
    "assets/images/slide1.jpeg",
    "assets/images/slide2.jpeg",
    "assets/images/slide3.jpeg",
    "assets/images/slide4.jpeg",
    "assets/images/slide5.jpeg",
    "assets/images/slide6.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: CarouselSlider.builder(
            itemCount: _urls.length,
            options: CarouselOptions(
              height: height,
              viewportFraction: 0.95,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 6),
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              onPageChanged: (index, cause) =>
                  Get.find<_SlideController>().changeSlideTo(index),
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (_, __, currentIndex) {
              return Container(
                height: height,
                width: width * 0.95,
                margin: EdgeInsets.only(left: width * 0.01),
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(_urls[currentIndex],
                      height: height, width: width * 0.95, fit: BoxFit.fill),
                ),
              );
            }));
  }
}
