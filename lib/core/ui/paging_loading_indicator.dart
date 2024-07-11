import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PagingLoadingIndicator extends StatelessWidget {
  const PagingLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Platform.isAndroid
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
    );
  }
}
