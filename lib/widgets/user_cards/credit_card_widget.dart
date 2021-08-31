import 'package:flutter/material.dart';
import '../../common/screen_type.dart';
import '../../constant/app_assets.dart' as ast;
import '../../constant/constant_public.dart';
import '../../model/user_cards_detail_model.dart';

class CreditCard extends StatefulWidget {
  final bool isFirstCard;
  final UserCardsDetailModel cardData;

  const CreditCard(
      {Key? key, required this.isFirstCard, required this.cardData})
      : super(key: key);

  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  var _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 240,
      width: 380,
      decoration: BoxDecoration(
        image: _buildImage(),
      ),
      child: Container(
        margin: EdgeInsets.only(
          left: ScreenType.isMobile(context) ? _width * 0.05 : 30,
          bottom: 30,
          right: 2,
        ),
        child: _buildCardText(),
      ),
    );
  }

  Widget _buildCardText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.cardData.cardNumber,
          style: creditCardNumberText,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            '${widget.cardData.cardholderName} ${widget.cardData.expDate}',
            style: creditCardNameText,
          ),
        )
      ],
    );
  }

  DecorationImage _buildImage() {
    return DecorationImage(
        image: AssetImage(widget.isFirstCard
            ? ast.AssetImages.creditCardPink
            : ast.AssetImages.creditCardBlue),
        fit: BoxFit.contain);
  }
}
