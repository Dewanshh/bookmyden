import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recco extends StatefulWidget {
  const Recco({Key? key}) : super(key: key);

  @override
  State<Recco> createState() => _ReccoState();
}

class _ReccoState extends State<Recco> {
  @override
  bool grid = false;
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.red.withOpacity(0.10),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.15),
          // centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Recently Booked",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      CupertinoIcons.doc_plaintext,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        grid = !grid;
                      });
                    },
                    child: Icon(
                      grid
                          ? CupertinoIcons.rectangle_grid_2x2_fill
                          : CupertinoIcons.rectangle_grid_2x2,
                      color: grid ? Colors.green : Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: SizedBox(
            child: grid
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.62,
                      crossAxisCount: 2,
                    ),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int item) {
                      return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "https://cdn.pixabay.com/photo/2016/11/18/17/20/living-room-1835923_960_720.jpg",
                                        ),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0),
                                            BlendMode.darken)),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    color: Colors.grey),
                                height: 150,
                                // width: 70,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Hotel President",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          "⭐ 4.8 ",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "Paris, France",
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.70),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: RichText(
                                            text: TextSpan(
                                                text: "₹ 4,000",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: [
                                                  TextSpan(
                                                      text: "  / month",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ]),
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.bookmark_fill,
                                          color: Colors.green,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ));
                    })
                : ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    blurStyle: BlurStyle.outer),
                              ],
                              // color: Colors.grey.withOpacity(0.40),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "https://cdn.pixabay.com/photo/2016/11/18/17/20/living-room-1835923_960_720.jpg",
                                        ),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0),
                                            BlendMode.darken)),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey),
                                height: 70,
                                width: 70,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "President Hotel",
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Kharar, Punjab",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.withOpacity(0.70)),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  RichText(
                                      text: TextSpan(text: "⭐", children: [
                                    TextSpan(
                                        text: " 4.8",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    TextSpan(
                                        text: " (4,378 reviews)",
                                        style: TextStyle(
                                            color:
                                                Colors.grey.withOpacity(0.56),
                                            fontWeight: FontWeight.bold))
                                  ])),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "₹ 450",
                                    style: TextStyle(
                                        fontSize: 21,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "/ month",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Icon(
                                    CupertinoIcons.bookmark_fill,
                                    color: Colors.green,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 0,
                      );
                    },
                    itemCount: 10)));
  }
}
