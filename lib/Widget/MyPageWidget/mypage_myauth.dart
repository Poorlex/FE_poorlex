import 'package:flutter/material.dart';
import 'package:poorlex/Widget/Common/icon.dart';

class MyPageMyAuth extends StatefulWidget {
  const MyPageMyAuth({super.key});

  @override
  State<MyPageMyAuth> createState() => _MyPageMyAuthState();
}

class _MyPageMyAuthState extends State<MyPageMyAuth> {
  final List<String> samples = [
    'https://search.pstatic.net/common?type=f&size=150x150&quality=75&direct=true&src=https%3A%2F%2Fmusicmeta-phinf.pstatic.net%2Falbum%2F007%2F795%2F7795016.jpg%3Ftype%3Dr204Fll%26v%3D20230316150014',
    'https://search.pstatic.net/common?type=f&size=150x150&quality=75&direct=true&src=https%3A%2F%2Fmusicmeta-phinf.pstatic.net%2Falbum%2F008%2F500%2F8500274.jpg%3Ftype%3Dr204Fll%26v%3D20230327175600',
    'https://search.pstatic.net/common?type=f&size=150x150&quality=75&direct=true&src=https%3A%2F%2Fmusicmeta-phinf.pstatic.net%2Falbum%2F009%2F413%2F9413944.jpg%3Ftype%3Dr204Fll%26v%3D20230724181026',
    'https://search.pstatic.net/common?type=f&size=150x150&quality=75&direct=true&src=https%3A%2F%2Fmusicmeta-phinf.pstatic.net%2Falbum%2F010%2F035%2F10035234.jpg%3Ftype%3Dr204Fll%26v%3D20230725100734',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('내 인증', style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(width: 10),
            Text('${samples.length}', style: TextStyle(color: Color(0xffB265FF), fontSize: 18)),
          ],
        ),
        Row(
            // direction: Axis.horizontal, spacing: 17,
            children: [
              Expanded(child:
                BackgroundImageWithBlack(height: 153, child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                      SizedBox(height: 13),
                      Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  )
                )
              ),
              SizedBox(width: 17),
              Expanded(child:
                BackgroundImageWithBlack(height: 153, child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                      SizedBox(height: 13),
                      Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  )
                )
              ),
            ]
        ),
        SizedBox(height: 17),
        Row(
          // direction: Axis.horizontal, spacing: 17,
            children: [
              Expanded(child:
                BackgroundImageWithBlack(height: 153, child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                      SizedBox(height: 13),
                      Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  )
                )
              ),
              SizedBox(width: 17),
              Expanded(child:
                BackgroundImageWithBlack(height: 153, child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('2023.08.09 (목)', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 13)),
                      SizedBox(height: 13),
                      Text('9.000원', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  )
                )
              ),
            ]
        ),
        SizedBox(height: 17),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.0, color: Color(0xffFFD600)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
          ),
          child:
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('지출 전체 보기', style: TextStyle(color: Color(0xffFFD600), fontSize: 14)),
                  SizedBox(width: 5),
                  CustomIcon(icon: 'arrow-right', width: 15, height: 15, color: '#FFD600',)
                ]),
            ),
          onPressed: () {},
        )
    ]);
  }
}

class BackgroundImageWithBlack extends StatelessWidget {
  double height;
  Widget child;

  BackgroundImageWithBlack({
    super.key,
    required this.height,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0, right: 0, left: 0, bottom: 0,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/sample/sample2.png"), fit: BoxFit.cover),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(child:
              Container(
                  height: height,
                  decoration: BoxDecoration(
                    color: Color(0xff000000).withOpacity(0.6),
                  ),
                  child: this.child
              ),
            )
          ],
        )
      ],
    );
  }
}

