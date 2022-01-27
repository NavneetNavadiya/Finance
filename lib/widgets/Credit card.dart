import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';

Widget Credit(_balance) {
  return Container(
      height: 200,
      child: CreditCard(
          bankName: "الرصيد",
          cardNumber: _balance,
          textExpDate: '',
          mask: '',
          textExpiry: '',
          textName: '',
          cardType: CardType.other,
          showBackSide: false,
          frontBackground: CardBackgrounds.custom(0xFFFFFFFF),
          backBackground: CardBackgrounds.black,
          frontTextColor: Colors.black,
          showShadow: true,
          horizontalMargin: 10));
}
