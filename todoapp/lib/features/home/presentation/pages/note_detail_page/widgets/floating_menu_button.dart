import 'dart:developer';

import 'package:flutter/material.dart';

class FloatingMenuButton extends StatefulWidget {
  const FloatingMenuButton({Key? key}) : super(key: key);

  @override
  _FloatingMenuButtonState createState() => _FloatingMenuButtonState();
}

class _FloatingMenuButtonState extends State<FloatingMenuButton> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          right: isMenuOpen ? -60 : 0,
          bottom: 0,
          curve: Curves.bounceInOut,
          child: Visibility(
            visible: isMenuOpen,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                log("Pressed edit button", name: 'FloatingMenuButton');
                // Edit action
              },
              child: const Icon(Icons.edit),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          right: isMenuOpen ? 60 : 0,
          bottom: 0,
          curve: Curves.bounceInOut,
          child: Visibility(
            visible: isMenuOpen,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                // Delete action
                log("Pressed delete button", name: 'FloatingMenuButton');
              },
              child: const Icon(Icons.delete),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          right: 0,
          bottom: isMenuOpen ? 60 : 0,
          curve: Curves.bounceInOut,
          child: Visibility(
            visible: isMenuOpen,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                // Send action
                log("Pressed send button", name: 'FloatingMenuButton');
              },
              child: const Icon(Icons.send),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          right: 0,
          bottom: 0,
          curve: Curves.bounceInOut,
          child: FloatingActionButton(
            onPressed: () {
              log("Pressed exit menu button", name: 'FloatingMenuButton');
              setState(() {
                isMenuOpen = !isMenuOpen;
              });
            },
            child: Icon(isMenuOpen ? Icons.close : Icons.menu),
          ),
        ),
      ],
    );
  }
}
