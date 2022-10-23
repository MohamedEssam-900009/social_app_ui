import 'package:flutter/material.dart';
import 'package:social_app_ui/model/user_model.dart';

class BuildProfile extends StatefulWidget {
  final UserModel user;
  final Function() onPressed;

  const BuildProfile({super.key, required this.user,required this.onPressed});

  @override
  State<BuildProfile> createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildUser(widget.user)),
              _followButton(widget.user),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildUser(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(user.location),
      ],
    );
  }

  _followButton(UserModel user) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      width: user.isFollow ? 50 : 120,
      height: 50,
      child: user.isFollow ? buildUnFollow() : buildFollow(),
    );
  }

  buildUnFollow() {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.teal,
        ),
        child: const Icon(
          Icons.people,
          color: Colors.white,
        ),
      ),
    );
  }

  buildFollow() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.tealAccent,width: 2.5,
        ),
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            'Follow',
            style: TextStyle(
              color: Colors.tealAccent,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}
