import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/root/root_view_model.dart';

class RootScreen extends GetView<RootViewModel> {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Root Screen"),
      ),
    );
  }
}
