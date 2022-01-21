import 'package:flutter/material.dart';
import '../services/PostalCodeService.dart';
import '../model/PostalData.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String appbarTitle = "Postal Codes";

  @override
  Widget build(BuildContext context) {
    int pinCode = 422207;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("$appbarTitle")),
      body: Container(
        child: FutureBuilder(
          future: PostalCodeService().getPostalCode(pinCode: pinCode),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: const Center(child: CircularProgressIndicator()),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(3),
                      child: dataBody(snapshot.data)),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  SingleChildScrollView dataBody(List<PostOffice> postalCodes) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Branch Type")),
            DataColumn(label: Text("Circle")),
            DataColumn(label: Text("Delivery Status")),
          ],
          rows: postalCodes
              .map((data) => DataRow(cells: [
                    DataCell(Text(data.name)),
                    DataCell(Text(data.branchType)),
                    DataCell(Text(data.circle)),
                    DataCell(Text(data.deliveryStatus)),
                  ]))
              .toList(),
        ),
      ),
    );
  }
}
