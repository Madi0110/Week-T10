import 'package:flutter/material.dart';
import 'package:week10/pages/detailed_history/detailed_history_widgets.dart';
import 'package:week10/utils/constants.dart';

class DetailsOfHistoryPage extends StatelessWidget {
  final int id;

  DetailsOfHistoryPage({required this.id});

  Constants _constants = Constants();
  DetailedHistoryWidgets _detailedHistoryWidgets = DetailedHistoryWidgets();

  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: _constants.getAppBar('История', true, context),
        body: Container(
            child: ListView(physics: NeverScrollableScrollPhysics(), children: [
          Container(
              padding:
                  EdgeInsets.symmetric(vertical: screenSize.height * 0.004),
              margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.008),
              decoration: BoxDecoration(
                  color: Colors.white, boxShadow: [_constants.getBoxShadow()]),
              child:
                  _detailedHistoryWidgets.buildDateInfo("11.11.2011", "10:37")),
          _detailedHistoryWidgets.buildFirstInfo(
              'Номер Покупки', "201231", false, screenSize),
          _detailedHistoryWidgets.buildFirstInfo(
              'Местоположение', "Korshynyn uiy", false, screenSize),
          _detailedHistoryWidgets.buildFirstInfo(
              'Итоговая сумма', "1500", true, screenSize),
          Container(
            height: MediaQuery.of(context).size.height * 0.63,
            child: ListView.builder(
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: screenSize.width * 0.01,
                          bottom: screenSize.width * 0.01,
                          right: screenSize.width * 0.02,
                          left: screenSize.width * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://dnajf85knvxy0.cloudfront.net/media/img/product/juice-harvest-pdp/Tropical-Passion-bottle_imageHero.png',
                            width: 50,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                children: [
                                  _detailedHistoryWidgets.buildCard(
                                      'Название', "Juice", false),
                                  _detailedHistoryWidgets.buildCard(
                                      'Количество', "3", false),
                                  _detailedHistoryWidgets.buildCard(
                                      'Цена', "500", false),
                                  _detailedHistoryWidgets.buildCard(
                                      'Сумма', "1500", true)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 3,
                        color: Colors.grey.shade100,
                        offset: Offset(1, 1))
                  ]),
                );
              },
            ),
          )
        ])));
  }
}
