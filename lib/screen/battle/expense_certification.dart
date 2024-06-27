import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/main.dart';
import 'package:poorlex/provider/expenditures_provider.dart';
import 'package:poorlex/provider/member_provider.dart';
import 'package:poorlex/schema/expenditure_response/expenditure_response.dart';
import 'package:poorlex/schema/member_profile_response/member_profile_response.dart';
import 'package:poorlex/widget/common/dialog/common_alert.dart';
import 'package:poorlex/widget/common/image/image_network.dart';
import 'package:poorlex/widget/common/medal.dart';
import 'package:poorlex/widget/level/profile.dart';
import 'package:poorlex/widget/loading_screen.dart';

/// [MEMO] router에 등록되지 않는 페이지입니다.
class ExpenseCertificationScreen extends StatefulWidget {
  final int expenditureId;
  const ExpenseCertificationScreen({
    super.key,
    required this.expenditureId,
  });

  @override
  State<ExpenseCertificationScreen> createState() =>
      _ExpenseCertificationScreenState();
}

class _ExpenseCertificationScreenState
    extends State<ExpenseCertificationScreen> {
  final ExpendituresProvider _expendituresProvider =
      Get.find<ExpendituresProvider>();
  final MemberProvider _memberProvider = Get.find<MemberProvider>();

  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;
  void _onChevron(bool isNext) {
    if (isNext) {
      _carouselController.nextPage();
    } else {
      _carouselController.previousPage();
      setState(() {});
    }
  }

  ExpenditureResponse? _expenditureResponse;
  MemberProfileResponse _memberProfile = MemberProfileResponse.empty();
  int _totalImageCount = 1;
  Future<void> _getDetailById() async {
    final response = await _expendituresProvider.getDetailById(
      expenditureId: widget.expenditureId,
    );
    _expenditureResponse = response;
    if (_expenditureResponse?.subImageUrl != null) {
      _totalImageCount = 2;
    }
    setState(() {});
    await _getMemberProfile();
  }

  Future<void> _getMemberProfile() async {
    if (_expenditureResponse == null) return;
    final response = await _memberProvider.getMemberProfile(
      memberId: _expenditureResponse!.memberId,
    );

    await response.fold(
      (l) async {
        await commonAlert(
          context: navigatorKey.currentContext!,
          message: l.message,
        );
      },
      (r) {
        _memberProfile = r;
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    _getDetailById();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_expenditureResponse == null) {
      return LoadingScreen();
    }
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
                child: Text(
                  '인증내역(${_currentIndex + 1}/$_totalImageCount)',
                  style: CTextStyles.Body1(),
                ),
              ),
            )
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
                  itemCount: _totalImageCount,
                  itemBuilder: (context, index, realIndex) {
                    final imageSrc = index == 0
                        ? _expenditureResponse?.mainImageUrl
                        : _expenditureResponse?.subImageUrl;
                    return CImageNetwork(
                      fit: BoxFit.cover,
                      src: imageSrc,
                      width: double.maxFinite,
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      _currentIndex = index;
                      setState(() {});
                    },
                  ),
                ),
                Positioned(
                  left: 0,
                  child: GestureDetector(
                    onTap: () => _onChevron(false),
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
                ),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () => _onChevron(true),
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
                      CProfile(
                        level: _memberProfile.levelInfo.level,
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(width: 6),
                      LevelMedal(
                        level: _memberProfile.levelInfo.level,
                        size: 16,
                      ),
                      SizedBox(width: 6),
                      Text(
                        _memberProfile.nickname,
                        style: CTextStyles.Headline(),
                      ),
                    ],
                  ),
                  SizedBox(height: 17),
                  Text(
                    "${_expenditureResponse?.description}",
                    style: CTextStyles.Headline(),
                  ),
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
