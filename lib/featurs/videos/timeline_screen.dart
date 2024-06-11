import 'package:flutter/material.dart';
import 'package:jjintok/featurs/videos/widgets/video_post.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({
    super.key,
  });

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();
  final _scrollDuration = const Duration(milliseconds: 250);
  final _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      setState(() {});
    }
  }

  void _onVideoFinished() {
    return;
    // _pageController.nextPage(
    //   duration: _scrollDuration,
    //   curve: _scrollCurve,
    // );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      displacement: 30,
      edgeOffset: 20,
      color: Theme.of(context).primaryColor,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        scrollDirection: Axis.vertical,
        itemCount: _itemCount,
        itemBuilder: (context, index) => VideoPost(
          onVideoFinished: _onVideoFinished,
          index: index,
        ),
      ),
    );
  }
}
