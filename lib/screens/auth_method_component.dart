import 'package:custom_switch_widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';

class AuthMethodComponent extends StatelessWidget {
  final String title;
  final bool isAvailable;
  final IconData iconData;
  final CustomSwitchController controller;
  final Function(bool) onChange;

  AuthMethodComponent(
      {required this.title,
      required this.iconData,
      required this.isAvailable,
      required this.controller,
      required this.onChange});

  void onAction(bool value) {
    if (!isAvailable) return;
    onChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white12, borderRadius: BorderRadius.circular(16.0)),
        child: ListTile(
          leading: Icon(
            iconData,
            color: Colors.white,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: isAvailable
              ? null
              : const Text(
                  "Unavailable",
                  style: TextStyle(color: Colors.red, fontSize: 11.0),
                ),
          trailing: isAvailable
              ? CustomSwitchWidget(controller: controller, onChange: onAction)
              : const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
        ));
  }
}
