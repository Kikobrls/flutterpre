import 'package:flutter/material.dart';

class LoadingAppWidget extends StatelessWidget {
  const LoadingAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
