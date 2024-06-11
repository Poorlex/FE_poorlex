import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/image/image_network.dart';
import 'package:poorlex/widget/common/medal.dart';

/// [MEMO] router에 등록되지 않는 페이지입니다.
class ExpenseCertificationScreen extends StatefulWidget {
  const ExpenseCertificationScreen({super.key});

  @override
  State<ExpenseCertificationScreen> createState() =>
      _ExpenseCertificationScreenState();
}

class _ExpenseCertificationScreenState
    extends State<ExpenseCertificationScreen> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              iconSize: 26,
              icon: Icon(Icons.close, color: CColors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
                child: Center(
                    child: Text('인증내역(1/7)', style: CTextStyles.Body1())))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: 2,
                  itemBuilder: (context, index, realIndex) {
                    return CImageNetwork(
                      fit: BoxFit.cover,
                      src:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5x1eP5JS50H8Ylg6bTZ7i7WtHZoHYxKLjifjcvfLx7dLKr4lGaA7Fov7yH-39tmf7mg8&usqp=CAU',
                    );
                  },
                  options: CarouselOptions(
                    // height: 375,
                    viewportFraction: 1,
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      left: 21,
                      right: 20,
                      top: 16,
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      color: CColors.black.withOpacity(0.5),
                    ),
                    child: _CarouselLeftBtn(),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 21,
                      top: 16,
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      color: CColors.black.withOpacity(0.5),
                    ),
                    child: _CarouselRightBtn(),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        width: 40,
                        height: 40,
                        'assets/ranking/first_profile_60_60.png',
                      ),
                      SizedBox(width: 6),
                      LevelMedal(level: 1, size: 16),
                      SizedBox(width: 6),
                      Text("최지출", style: CTextStyles.Headline()),
                    ],
                  ),
                  SizedBox(height: 17),
                  Text("약값 지출 ...", style: CTextStyles.Headline()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CarouselLeftBtn extends StatelessWidget {
  const _CarouselLeftBtn();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string('''
        <svg width="12" height="20" viewBox="0 0 12 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M11 1L2 10L11 19" stroke="white" stroke-width="1.5"/>
        </svg>
      ''');
  }
}

class _CarouselRightBtn extends StatelessWidget {
  const _CarouselRightBtn();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string('''
        <svg width="12" height="20" viewBox="0 0 12 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M1 1L10 10L1 19" stroke="white" stroke-width="1.5"/>
      </svg>
      ''');
  }
}
