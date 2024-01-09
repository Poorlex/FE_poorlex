import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  Image image;
  Image icon;
  String name;

  UserItem({
    super.key,
    required this.image,
    required this.icon,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40, height: 40, decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Color(0xffe4d4be), ),
          child: image,
        ),
        SizedBox(width: 6,),
        SizedBox(width: 16, height: 16, child: icon),
        SizedBox(width: 6,),
        Text(name, style: TextStyle(color: Colors.white))
      ]
    );
  }
}

class UserItemNameIcon extends StatelessWidget {
  Image icon;
  String name;

  UserItemNameIcon({
    super.key,
    required this.icon,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 16, height: 16, child: icon),
          SizedBox(width: 6,),
          Text(name, style: TextStyle(color: Color(0xffB265FF)))
        ]
    );
  }
}
