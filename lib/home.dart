import 'package:flutter/material.dart';

class tipcalculator extends StatefulWidget {
  const tipcalculator({super.key});

  @override
  State<tipcalculator> createState() => _tipcalculator();
}

class _tipcalculator extends State<tipcalculator> {
  int tippercentage = 0;
  int personcounter = 1;
  double balance = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.cyan,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 165, 218, 235),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("total per person"), Text("\$123")],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        prefixText: "bill amount",
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        balance = double.parse(value);
                      } catch (e) {
                        balance - 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("slpit"),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (personcounter > 1) {
                                  personcounter--;
                                } else {
                                  //do nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.amber),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                          Text("$personcounter"),
                          InkWell(
                            onTap: () {
                              setState(() {
                                personcounter++;
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.all(10),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "data",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text("\$ ${calculatetotaltip(billammount, splitby, tippercentage)}"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("$tippercentage %"),
                      Slider(
                          min: 0,
                          max: 100,
                          divisions: 10,
                          value: tippercentage.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              tippercentage = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  calculatetotalperperson(double totaltip, double billammount, int splitby) {
    var totalperperson = (totaltip + billammount) / splitby;
    return totalperperson;
  }

  calculatetotaltip(double billammount, int splitby, int tippercentage) {
    double totaltip = 0.0;
    if (billammount < 0 ||
        billammount.toString().isEmpty ||
        billammount == null) {
      //no go}
    } else {
      totaltip = (billammount + tippercentage) / 100;
    }
    return totaltip;
  }
}
