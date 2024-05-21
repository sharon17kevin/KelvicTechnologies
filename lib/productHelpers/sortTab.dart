import 'package:flutter/material.dart';

class SortTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Colors.black
          )
      ),
      padding: EdgeInsets.only(left: 10, top: 3, bottom: 3, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Price Range'),
          GestureDetector(
              onTap: (){},
              child: Icon(Icons.arrow_drop_down)
          ),
        ],
      ),
    );
  }
}