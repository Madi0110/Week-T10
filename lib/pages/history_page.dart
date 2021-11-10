import 'package:flutter/material.dart';
import 'package:week10/utils/constants.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../data/data_list.dart';
import '../model/data_model.dart';
import 'detailed_history/detailed_history.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Constants _mainColors = Constants();
  bool tempBool = true;

  List<DataModel> data_list = [];

  @override
  void initState() {
    data_list = Data().items as List<DataModel>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('История'),
        centerTitle: true,
        backgroundColor: _mainColors.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
            child: Container(
                child: GroupedListView<DataModel, String>(
          elements: data_list,
          groupBy: (element) => DateFormat('dd.MM.yyyy')
              .format(DateTime.parse(element.createdAt!)),
          groupSeparatorBuilder: (String groupByValue) => Text(
            groupByValue,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff613EEA)),
          ),
          itemBuilder: (context, DataModel element) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: Colors.black12,
                        offset: Offset(0, 3))
                  ]),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: ListTile(
                          leading: Image.network(
                            'https://image.freepik.com/free-vector/refrigeration-showcase-with-drinks-colorful-bottles-flat-style_136277-38.jpg',
                          ),
                          title: Text(
                            '${element.address}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var i in element.details!)
                                Text('${i.quantity}x ${i.name}'),
                              Text(
                                '${element.price}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            size: 45,
                            color: Color(0xff613EEA),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsOfHistoryPage(
                                          id: element.id!,
                                        )));
                          },
                        ),
                      )),
                ),
              ],
            );
          },

          useStickyGroupSeparators: true, // optional
          order: GroupedListOrder.ASC, // optional
        )

                // ListView.builder(
                //   itemCount: snapshot.data!.data.length,
                //   itemBuilder: (context, index) {

                //     return
                //   },
                // ); // end of lisbuild

                )),
      ),
    );
  }
}
