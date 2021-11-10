import 'package:flutter/material.dart';
import 'package:week10/utils/constants.dart';

class DetailedHistoryWidgets {
  Constants _constants = Constants();

  Row buildDateInfo(String date, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(
          flex: 2,
        ),
        Text('$date'),
        Spacer(),
        Text('$time'),
        Spacer(
          flex: 2,
        )
      ],
    );
  }

  Container buildFirstInfo(
      String _title, String _trailing, bool _bool, Size screenSize) {
    return Container(
      margin: _bool
          ? EdgeInsets.all(0)
          : EdgeInsets.only(bottom: screenSize.height * 0.01),
      decoration: BoxDecoration(
          color: _bool ? Color(0xff47536D) : Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 20,
                offset: Offset(2, 4))
          ]),
      child: ListTile(
        dense: true,
        title: Text(
          '$_title',
          style: _bool
              ? TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
              : TextStyle(),
        ),
        trailing: Text(
          '$_trailing',
          style: _bool
              ? TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
              : TextStyle(),
        ),
      ),
    );
  }

  Card buildCard(String _title, String _trailing, bool _bool) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          dense: true,
          title: Text(
            '$_title',
            style: TextStyle(
                color: _constants.t2MainColor,
                fontWeight: _bool ? FontWeight.bold : FontWeight.normal),
          ),
          trailing: Text(
            '$_trailing',
            style: TextStyle(
                color: _constants.t2MainColor,
                fontWeight: _bool ? FontWeight.bold : FontWeight.normal),
          ),
        ),
        color: Color(0xffEFF2F7),
        shadowColor: Colors.white);
  }
}
