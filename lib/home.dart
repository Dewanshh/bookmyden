import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    FirebaseFirestore.instance
        .collection('num')
        .doc('x')
        .snapshots()
        .listen((event) {
      setState(() {
        _counter = event['nu'];
      });
    });
    super.initState();
  }

  TextEditingController search = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.10),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20.0),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "BOOK MY DEN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(CupertinoIcons.bell),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(CupertinoIcons.bookmark),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      child: Text(
                        "Hello, Daniel 👋",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: Colors.green.shade500,
                          ),
                          // labelStyle: TextStyle(color: Colors.grey.shade500),
                          labelText: "Search",
                          prefixIconColor: Colors.green.shade500,
                          filled: true,
                          focusColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        controller: search,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return OutlinedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))))),
                            onPressed: () {},
                            child: Text(
                              "Hello World",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Container(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black
                                                      .withOpacity(0.25),
                                                  BlendMode.darken),
                                              image: NetworkImage(
                                                "https://cdn.pixabay.com/photo/2016/11/18/17/20/living-room-1835923_960_720.jpg",
                                              ))),
                                      height: 250,
                                      width: 311,
                                    ),
                                    Positioned(
                                      child: Text(
                                        "Kharar PG",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                      bottom: 60,
                                      left: 10,
                                    ),
                                    Positioned(
                                      child: Text(
                                        "Mohali,",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            // fontStyle: FontStyle.italic,
                                            fontSize: 20),
                                      ),
                                      bottom: 40,
                                      left: 10,
                                    ),
                                    Positioned(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Rs.2000/ per month",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Icon(
                                            CupertinoIcons.bookmark,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                      bottom: 15,
                                      left: 10,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Recently Booked",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(
                            "See All",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 500,
                      child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.40),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                "https://cdn.pixabay.com/photo/2016/11/18/17/20/living-room-1835923_960_720.jpg",
                                              ),
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black
                                                      .withOpacity(0.25),
                                                  BlendMode.darken)),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey),
                                      height: 70,
                                      width: 70,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              color: Colors.grey
                                                  .withOpacity(0.70)),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        RichText(
                                            text:
                                                TextSpan(text: "⭐", children: [
                                          TextSpan(
                                              text: " 4.8",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: " (4,378 reviews)",
                                              style: TextStyle(
                                                  color: Colors.grey
                                                      .withOpacity(0.56),
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
                                              fontSize: 15,
                                              color: Colors.grey
                                                  .withOpacity(0.70)),
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
                              height: 20,
                            );
                          },
                          itemCount: 5),
                    )
                  ]),
            ),
          ),
        ));
  }
}
