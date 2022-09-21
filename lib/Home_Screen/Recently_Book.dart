import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recently_Book extends StatefulWidget {
  const Recently_Book({
    Key? key,
  }) : super(key: key);

  @override
  State<Recently_Book> createState() => _Recently_BookState();
}

class _Recently_BookState extends State<Recently_Book> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SizedBox(
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
                                    Colors.black.withOpacity(0.25),
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
                                fontSize: 21, fontWeight: FontWeight.bold),
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
                                    color: Colors.grey.withOpacity(0.56),
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
                                color: Colors.grey.withOpacity(0.70)),
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
            itemCount: 4),
      ),
    );
  }
}
