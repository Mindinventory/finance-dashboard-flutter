import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../constant/color_constant.dart';
import '../../model/user_cards_detail_model.dart';
import 'credit_card_widget.dart';

class CreditCardSlider extends StatefulWidget {
  final bool isMobile;

  const CreditCardSlider({Key? key, required this.isMobile}) : super(key: key);

  @override
  _CreditCardSliderState createState() => _CreditCardSliderState();
}

class _CreditCardSliderState extends State<CreditCardSlider> {
  int _current = 0;
  var _width = 0.0;
  final CarouselController _pageController = CarouselController();

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          _buildCardSlider(widget.isMobile),
          _buildCardIndicator(widget.isMobile),
        ],
      ),
    );
  }

  Widget _buildCardIndicator(_isMobile) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_getCardsWidgetList(_isMobile).length, (index) {
          return Container(
            height: 4,
            width: _current == index ? 20 : 4,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: _current == index ? AppColors.white : Colors.grey,
            ),
          );
        }));
  }

  Widget _buildCardSlider(bool _isMobile) {
    return Container(
      height: _isMobile ? 240 : 500,
      width: _isMobile ? _width : 400,
      child: CarouselSlider(
        items: [..._getCardsWidgetList(_isMobile)],
        carouselController: _pageController,
        options: CarouselOptions(
          enlargeCenterPage: _isMobile ? true : false,
          aspectRatio: _isMobile ? 1 : 1,
          viewportFraction: _isMobile
              ? _width < 600
                  ? 1
                  : 0.5
              : 1,
          autoPlay: false,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
      ),
    );
  }

  List<Widget> _getCardsWidgetList(bool _isMobile) {
    return _isMobile
        ? [
            _buildCardPages(
                firstCardData: UserCardsDetailModel(
                    expDate: '05/25',
                    cardNumber: '**** 5658',
                    cardholderName: 'Vladimir Putin'),
                isMobile: _isMobile),
            _buildCardPages(
                secondCardData: UserCardsDetailModel(
                  expDate: '05/23',
                  cardNumber: '**** 5654',
                  cardholderName: 'John Carter',
                ),
                isMobile: _isMobile),
            _buildCardPages(
                firstCardData: UserCardsDetailModel(
                    expDate: '05/22',
                    cardNumber: '**** 5278',
                    cardholderName: 'Bruce Wayne'),
                isMobile: _isMobile),
            _buildCardPages(
                secondCardData: UserCardsDetailModel(
                    expDate: '05/21',
                    cardNumber: '**** 4678',
                    cardholderName: 'William Ray'),
                isMobile: _isMobile),
            _buildCardPages(
                firstCardData: UserCardsDetailModel(
                    expDate: '05/27',
                    cardNumber: '**** 5348',
                    cardholderName: 'Robin Hood'),
                isMobile: _isMobile),
            _buildCardPages(
                secondCardData: UserCardsDetailModel(
                    expDate: '05/23',
                    cardNumber: '**** 5654',
                    cardholderName: 'John Carter'),
                isMobile: _isMobile),
          ]
        : [
            _buildCardPages(
                firstCardData: UserCardsDetailModel(
                    expDate: '05/25',
                    cardNumber: '**** 5658',
                    cardholderName: 'Vladimir Putin'),
                secondCardData: UserCardsDetailModel(
                    expDate: '05/25',
                    cardNumber: '**** 5638',
                    cardholderName: 'Martin Luther'),
                isMobile: _isMobile),
            _buildCardPages(
                firstCardData: UserCardsDetailModel(
                    expDate: '05/22',
                    cardNumber: '**** 5278',
                    cardholderName: 'Bruce Wayne'),
                secondCardData: UserCardsDetailModel(
                    expDate: '05/21',
                    cardNumber: '**** 4678',
                    cardholderName: 'William Ray'),
                isMobile: _isMobile),
            _buildCardPages(
                firstCardData: UserCardsDetailModel(
                    expDate: '05/27',
                    cardNumber: '**** 5348',
                    cardholderName: 'Robin Hood'),
                secondCardData: UserCardsDetailModel(
                    expDate: '05/23',
                    cardNumber: '**** 5654',
                    cardholderName: 'John Carter'),
                isMobile: _isMobile),
          ];
  }

  Widget _buildCardPages({
    required bool isMobile,
    UserCardsDetailModel? firstCardData,
    UserCardsDetailModel? secondCardData,
  }) {
    return isMobile
        ? CreditCard(
            isFirstCard: firstCardData != null ? true : false,
            cardData: firstCardData ?? secondCardData!,
          )
        : Column(
            children: [
              CreditCard(
                isFirstCard: true,
                cardData: firstCardData!,
              ),
              CreditCard(
                isFirstCard: false,
                cardData: secondCardData!,
              ),
            ],
          );
  }
}
