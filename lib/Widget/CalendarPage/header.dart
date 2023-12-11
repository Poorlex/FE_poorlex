import 'package:flutter/material.dart';
import 'package:poorlex/Widget/PickerWidget/month_picker.dart';

class CalenderHeader extends StatelessWidget {
  final int current;

  const CalenderHeader(
      int this.current,
      { super.key }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: (
        Expanded(
          child: Column(
              children: [
                Text('요약', style: TextStyle(fontSize: 24, color: Colors.white)),
                SizedBox(height: 20),
                Container(
                    child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios, size: 25, color: Colors.white,),
                              onPressed: () => print('111')
                          ),
                          MonthPicker(
                            current: this.current,
                            child: Row(
                              children: [
                                Text(this.current.toString(), style: TextStyle(color: Colors.white, fontSize: 25)),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_drop_down_sharp, size: 35, color: Colors.white,)
                              ],
                            ),
                            select: (int current) => {
                              print(current)
                            }
                          ),
                          IconButton(
                              icon: Icon(Icons.arrow_forward_ios, size: 25, color: Colors.white,),
                              onPressed: () => print('111')
                          )
                        ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    )
                ),
              ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )
        )
      )
    );
  }
}
