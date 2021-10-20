import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.imgUrl,
    required this.fullName,
  }) : super(key: key);
  final String imgUrl;
  final String fullName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 0.7,
            offset: Offset(3, 3), // changes position of shadow
          ),

        ],
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image(
                height: 60,
                width: 60,
                fit: BoxFit.cover,
                image: NetworkImage(imgUrl),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                fullName,
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
