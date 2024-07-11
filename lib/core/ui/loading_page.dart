import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Platform.isAndroid
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const Center(
                child: CupertinoActivityIndicator(),
              ),
      ),
    );
  }
}

class PagingLoadingIndicator extends StatelessWidget {
  const PagingLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : const Center(
            child: CupertinoActivityIndicator(),
          );
  }
}
