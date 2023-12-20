import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoalList extends StatefulWidget {
  const GoalList({super.key});

  @override
  State<GoalList> createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GoalListItem(),
      GoalListItem(),
      GoalListItem(),
      GoalListItem(),
      GoalListItem(),
      GoalListItem(),
      GoalListItem(),
      GoalListItem(),
      GoalListItem(),
    ]);
  }
}

class GoalListItem extends StatelessWidget {
  const GoalListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFF161616), width: 1))),
      padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('에어팟 맥스 사기 🎵 ', style: TextStyle(color: Colors.white, fontSize: 14)),
              SizedBox(height: 14),
              Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFFFD600))
                    ),
                    child: Text('단기', style: TextStyle(color: Color(0xFFFFD600), fontSize: 8))
                ),
                SizedBox(width: 10),
                Text('500,000원', style: TextStyle(color: Color(0xFFFFD600), fontSize: 20)),
              ]),
              SizedBox(height: 11),
              Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.string(
                  '''<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                      <circle cx="7" cy="7.00024" r="6.25" fill="#F2E3C6" stroke="#E33741" stroke-width="1.5"/>
                      <path d="M7 4.00024V7.50024H10.5" stroke="black"/>
                    </svg>''', width: 14, height: 14,
                ),
                SizedBox(width: 6),
                Text('0개월 남음', style: TextStyle(color: Color(0xFFB265FF), fontSize: 13)),
                SizedBox(width: 17),
                Text('~ 2023.11.09', style: TextStyle(color: Color(0xFF999999), fontSize: 13)),
              ])
            ])
          ),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              backgroundColor: Color(0xFF272727),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,)
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
              // color: Color(0xFF272727),
              child: SvgPicture.string(
              '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                              <g opacity="0.8">
                                <rect x="11" y="5.80005" width="2.19995" height="2.19995" fill="white"/>
                                <rect x="11" y="10.9998" width="2.19995" height="2.19995" fill="white"/>
                                <rect x="11" y="16.1995" width="2.19995" height="2.19995" fill="white"/>
                              </g>
                </svg>''',
              width: 24, height: 24,
              ),
            ),
            onPressed: () => print(111),
          )
        ]
      )
    );
  }
}

