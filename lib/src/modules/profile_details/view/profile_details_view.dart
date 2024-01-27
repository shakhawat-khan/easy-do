import 'package:flutter/material.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Details'),
        ),
        body: const Column(
          children: [],
        ),
      ),
    );
  }
}
