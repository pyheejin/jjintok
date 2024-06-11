import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jjintok/constants/gaps.dart';
import 'package:jjintok/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  bool _isWriting = true;

  final TextEditingController _textEditingController =
      TextEditingController(text: 'Search');

  void _onSearchChanged(String value) {
    if (value.isEmpty) {
      setState(() {
        _isWriting = false;
      });
    } else {
      setState(() {
        _isWriting = true;
      });
    }
  }

  void _onSearchSubmitted(String value) {}

  void _onClearTap() {
    _textEditingController.clear();
    setState(() {
      _isWriting = false;
    });
  }

  void _keyboardDisabled() {
    FocusScope.of(context).unfocus();
  }

  void _keyboardEnabled() {
    setState(() {
      _isWriting = true;
    });
  }

  void _onTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: GestureDetector(
        onTap: _keyboardDisabled,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0.01,
            title: Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  size: Sizes.size20 + Sizes.size2,
                ),
                Gaps.h12,
                Expanded(
                  child: TextField(
                    onTap: _keyboardEnabled,
                    controller: _textEditingController,
                    onChanged: _onSearchChanged,
                    onSubmitted: _onSearchSubmitted,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size12,
                        vertical: Sizes.size10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.size12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Sizes.size12 + Sizes.size3,
                          horizontal: Sizes.size12,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: Sizes.size16 + Sizes.size2,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size12 + Sizes.size3,
                          horizontal: Sizes.size12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_isWriting)
                              GestureDetector(
                                onTap: _onClearTap,
                                child: FaIcon(
                                  FontAwesomeIcons.solidCircleXmark,
                                  size: Sizes.size16 + Sizes.size2,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Gaps.h12,
                const FaIcon(
                  FontAwesomeIcons.sliders,
                  size: Sizes.size20 + Sizes.size2,
                ),
              ],
            ),
            bottom: TabBar(
              onTap: (value) => _onTap(),
              unselectedLabelColor: Colors.grey.shade500,
              splashFactory: NoSplash.splashFactory,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              indicatorColor: Colors.black,
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(
                  Sizes.size10,
                ),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 9 / 20,
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.size4)),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: 'assets/images/dubu1.JPG',
                          image:
                              'https://pbs.twimg.com/media/FhH_BUXUcAA_wFz?format=jpg&name=large',
                        ),
                      ),
                    ),
                    Gaps.v8,
                    const Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // 넘어가는 텍스트 줄임
                      'salfjslafjlskfjalsfjsalfjslafjlskfjalsfjlskjfsalkjfsalkjflskjfsalkjfsalkjf',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size14,
                      ),
                    ),
                    Gaps.v10,
                    DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                                'https://lh3.googleusercontent.com/ogw/AF2bZyicJ-YXXWq21mBVwHApPO6y8Bxq-OAeQp-wwfHdgY6swA=s32-c-mo'),
                          ),
                          Gaps.h4,
                          const Expanded(
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis, // 넘어가는 텍스트 줄임
                              '@longlonglonglongname',
                            ),
                          ),
                          Gaps.h4,
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size16,
                            color: Colors.grey.shade600,
                          ),
                          Gaps.h2,
                          const Text('20K')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(
                    tab,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
