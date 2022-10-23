import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../model/user_model.dart';
import '../widgets/build_profile.dart';
import '../widgets/item_widget.dart';

class DiscoveryView extends StatefulWidget {
  const DiscoveryView({super.key});

  @override
  State<DiscoveryView> createState() => _DiscoveryViewState();
}

class _DiscoveryViewState extends State<DiscoveryView> {
  final panelController = PanelController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person_outline),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SlidingUpPanel(
        maxHeight: 400,
        minHeight: 150,
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        controller: panelController,
        color: Colors.transparent,
        body: PageView.builder(
          itemBuilder: (context, index) {
            return Image.network(
              users[index].urlImage,
              fit: BoxFit.cover,
            );
          },
          itemCount: users.length,
          onPageChanged: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
        panelBuilder: (ScrollController scroll) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemWidget(
                      title: 'Followers',
                      count: users[index].countFollowers,
                    ),
                    ItemWidget(
                      title: 'Posts',
                      count: users[index].countPosts,
                    ),
                    ItemWidget(
                      title: 'Following',
                      count: users[index].countFollowing,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      BuildProfile(
                        user: users[index],
                        onPressed: () {
                          setState(() {
                            users[index].isFollow = !users[index].isFollow;
                          });
                        },
                      ),
                      Expanded(child: buildProfileDetails(users[index])),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        backgroundColor: Colors.tealAccent,
        items: const [
          Icon(Icons.map, size: 30.0),
          Icon(Icons.home, size: 30.0),
          Icon(Icons.people, size: 30.0),
        ],
      ),
    );
  }

  buildProfileDetails(UserModel user) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.bio,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            'Photo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: user.urlPhotos
                  .map((url) => Container(
                        height: 100,
                        width: 100,
                        padding: EdgeInsets.only(right: 5),
                        child: Image.network(url, fit: BoxFit.cover),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
