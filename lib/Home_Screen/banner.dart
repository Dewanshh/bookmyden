import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.25),
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
    );
  }
}
