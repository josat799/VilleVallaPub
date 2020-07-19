import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  List<String> tests = [
    "https://res.cloudinary.com/hsocx4wtk/image/upload/c_fit,q_50,w_1000/orymc2yfyhhxfs7fgllm",
    "Test2",
    "Test3",
    "Test4"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 8,
          color: Colors.lightBlueAccent,
          shadowColor: Colors.greenAccent,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.topLeft, child: Text("Tapp-tavlan")),
              Image.network(
                tests[0],
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        Card(
          elevation: 8,
          color: Colors.lightBlueAccent,
          shadowColor: Colors.greenAccent,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Text("Öppetkvällar"),
              ),
              Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    Text("Dag"),
                    Text("Öppettid"),
                    Text("Kvällens PA"),
                  ]),
                  TableRow(children: [
                    Text("Måndag"),
                    Text("18-23"),
                    Text("Josef"),
                  ]),
                  TableRow(children: [
                    Text("Tisdag"),
                    Text("18-23"),
                    Text("Josef"),
                  ]),
                  TableRow(children: [
                    Text("Onsdag"),
                    Text("18-23"),
                    Text("Josef"),
                  ]),
                  TableRow(children: [
                    Text("Torsdag"),
                    Text("18-23"),
                    Text("Josef"),
                  ]),
                  TableRow(children: [
                    Text("Fredag"),
                    Text("18-01"),
                    Text("Josef"),
                  ]),
                  TableRow(children: [
                    Text("Lördag"),
                    Text("18-01"),
                    Text("Josef"),
                  ])
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
