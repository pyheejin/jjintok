import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jjintok/constants/gaps.dart';
import 'package:jjintok/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen>
    with SingleTickerProviderStateMixin {
  void _onTap() {
    FocusScope.of(context).unfocus();
  }

  final List<String> _emojiList = [
    '\u{2764}\u{2764}\u{2764}',
    '\u{1F602}\u{1F602}\u{1F602}',
    '\u{1F44D}\u{1F44D}\u{1F44D}',
  ];

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 200,
    ),
  );

  late final Animation<Offset> _panelAnimation = Tween(
    begin: const Offset(0, 2.5),
    end: const Offset(0, 0),
  ).animate(_animationController);

  void _onEmojiTap() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: Sizes.size10,
            leading: Stack(
              children: [
                const CircleAvatar(
                  radius: Sizes.size24,
                  foregroundImage: NetworkImage(
                      'https://lh3.googleusercontent.com/ogw/AF2bZyicJ-YXXWq21mBVwHApPO6y8Bxq-OAeQp-wwfHdgY6swA=s32-c-mo'),
                  child: Text('JJIN'),
                ),
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
            title: const Text(
              'JJini',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text('Active now'),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.flag,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
                Gaps.h32,
                FaIcon(
                  FontAwesomeIcons.ellipsis,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size14,
                ),
                itemBuilder: (context, index) {
                  final isMine = index % 2 == 0;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isMine
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Sizes.size14),
                        decoration: BoxDecoration(
                          color: isMine
                              ? Colors.blue
                              : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(Sizes.size20),
                            topRight: const Radius.circular(Sizes.size20),
                            bottomLeft: Radius.circular(
                                isMine ? Sizes.size20 : Sizes.size5),
                            bottomRight: Radius.circular(
                                !isMine ? Sizes.size20 : Sizes.size5),
                          ),
                        ),
                        child: const Text(
                          'slfjlfsf',
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Gaps.v10,
                itemCount: 10),
            Positioned(
              left: 10,
              bottom: 120,
              child: SlideTransition(
                position: _panelAnimation,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var emoji in _emojiList)
                      Container(
                        height: 30,
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size2,
                          horizontal: Sizes.size14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(Sizes.size20),
                        ),
                        child: Text(
                          emoji,
                          style: const TextStyle(
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                    Container(
                      height: 30,
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size2,
                        horizontal: Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(Sizes.size20),
                      ),
                      child: const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.squareCaretRight,
                            size: Sizes.size16,
                          ),
                          Gaps.h5,
                          Text(
                            'Share post',
                            style: TextStyle(
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                elevation: 1,
                color: Colors.grey.shade50,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: _onEmojiTap,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(FontAwesomeIcons.faceSmile),
                              ],
                            ),
                          ),
                          hintText: ' Send a message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Sizes.size18),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size10,
                            vertical: Sizes.size16,
                          ),
                        ),
                      ),
                    ),
                    Gaps.h14,
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidPaperPlane,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
