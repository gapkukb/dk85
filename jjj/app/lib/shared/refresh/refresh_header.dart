import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BingoRefreshHead extends RefreshIndicator {
  BingoRefreshHead({super.key})
    : super(height: 130, refreshStyle: RefreshStyle.Follow);

  @override
  State<BingoRefreshHead> createState() => _BingoRefreshHeadState();
}

class _BingoRefreshHeadState extends RefreshIndicatorState<BingoRefreshHead>
    with SingleTickerProviderStateMixin {
  static const String _textBrand =
      'Powered by DigiPlus, a Fortune Southeast Asia 500 company';
  static const String _releaseText = 'Release to refresh';
  static const String _loadingText = 'Loading...';
  static const String _refreshedText = 'Refresh finished';

  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.linear),
    );
    _rotationController.repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  Widget _buildRefreshContent(String text) {
    return Container(
      width: double.infinity,
      height: 130,
      color: Color(0xffeeeeee),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // _buildLogoRow(),
            SizedBox(height: 3),
            _buildBrandText(),
            SizedBox(height: 10),
            _buildStatusContent(text),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/ic_refresh_logo.png', width: 75, height: 30),
        Container(
          width: 1,
          height: 24,
          color: Color(0xffeeeeee),
          margin: EdgeInsets.symmetric(horizontal: 12),
        ),
        Image.asset(
          'assets/images/ic_refresh_pagcor.png',
          width: 39,
          height: 36,
        ),
      ],
    );
  }

  Widget _buildBrandText() {
    return Text(
      _textBrand,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        fontSize: 10,
        color: Color(0xff111111),
      ),
    );
  }

  Widget _buildStatusContent(String text) {
    if (text == _loadingText) {
      return _buildRotatingLoading();
    }

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        fontSize: 10,
        color: Color(0xff111111),
      ),
    );
  }

  Widget _buildRotatingLoading() {
    return CupertinoActivityIndicator();
    return RotationTransition(
      turns: _rotationAnimation,
      child: Image.asset(
        'assets/images/icon_loading_flower.png',
        width: 25,
        height: 25,
      ),
    );
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    String displayText = _loadingText;
    try {
      switch (mode) {
        case RefreshStatus.refreshing:
          displayText = _loadingText;
          break;
        case RefreshStatus.canRefresh:
          displayText = _refreshedText;
          break;
        default:
          displayText = _releaseText;
          break;
      }
    } catch (e) {
      debugPrint('BingoRefreshHead: $e');
    }

    return _buildRefreshContent(displayText);
  }
}
