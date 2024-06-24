import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jjintok/constants/gaps.dart';
import 'package:jjintok/constants/sizes.dart';
import 'package:jjintok/featurs/users/widgets/persistent_tabbar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('JJini'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      foregroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/ogw/AF2bZyicJ-YXXWq21mBVwHApPO6y8Bxq-OAeQp-wwfHdgY6swA=s32-c-mo'),
                      child: Text('Jiini'),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '@Jiini',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size16,
                          color: Colors.blue.shade500,
                        )
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: Sizes.size52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                '97',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Gaps.v3,
                              Text(
                                'Following',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                          ),
                          Column(
                            children: [
                              const Text(
                                '10M',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Gaps.v3,
                              Text(
                                'Followers',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                          ),
                          Column(
                            children: [
                              const Text(
                                '194.3M',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Gaps.v3,
                              Text(
                                'Likes',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12,
                              horizontal: Sizes.size70,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Sizes.size2),
                              ),
                            ),
                            child: const Text(
                              'Follow',
                              style: TextStyle(
                                fontSize: Sizes.size14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Gaps.h5,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size9,
                              horizontal: Sizes.size10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Sizes.size2),
                              ),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.youtube,
                              size: Sizes.size24,
                            ),
                          ),
                          Gaps.h5,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12,
                              horizontal: Sizes.size16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Sizes.size2),
                              ),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.caretDown,
                              size: Sizes.size18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.size32),
                      child: Text(
                        'All highlights and wherrre to watch live matches on FIFA+',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size12,
                        ),
                        Gaps.h4,
                        Text(
                          'https://www.instagram.com/ddubukkang',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                padding: EdgeInsets.zero,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 9 / 14,
                  crossAxisCount: 3,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 9 / 14,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/dubu1.JPG',
                            image:
                                'https://pbs.twimg.com/media/FhH_BUaUoAEZdKU?format=jpg&name=large',
                          ),
                        ),
                        if (index == 0)
                          Positioned(
                            top: 4,
                            left: 5,
                            child: Container(
                              padding: const EdgeInsets.all(Sizes.size1),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(Sizes.size3),
                                ),
                              ),
                              child: const Text(
                                'Pinned',
                                style: TextStyle(
                                  fontSize: Sizes.size13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        const Positioned(
                          bottom: 2,
                          left: 10,
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.play,
                                color: Colors.white,
                                size: Sizes.size18,
                              ),
                              Gaps.h8,
                              Text(
                                '4.1M',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text('Page two'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
