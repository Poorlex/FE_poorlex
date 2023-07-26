import 'package:flutter/material.dart';

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
    'https://search.pstatic.net/common?type=f&size=150x150&quality=75&direct=true&src=https%3A%2F%2Fmusicmeta-phinf.pstatic.net%2Falbum%2F009%2F787%2F9787038.jpg%3Ftype%3Dr204Fll%26v%3D20230724181516',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('내 인증',
                style: TextStyle(color: Colors.white, fontSize: 25)),
            const SizedBox(width: 10),
            Text('${samples.length}',
                style: TextStyle(color: Colors.purple.shade600, fontSize: 25)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              SizedBox(
                width: 500,
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  itemCount: samples.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.network(samples[index], width: 150, height: 150)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
