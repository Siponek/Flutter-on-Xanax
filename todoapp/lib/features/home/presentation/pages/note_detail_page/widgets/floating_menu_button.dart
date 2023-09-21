import 'dart:developer';
import 'package:todoapp/features/home/domain/entities/note_entity.dart';
import 'package:todoapp/features/home/presentation/pages/note_detail_page/note_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class FloatingMenuButton extends StatefulWidget {
  const FloatingMenuButton({
    Key? key,
    required this.note,
  }) : super(key: key);

  final NoteEntity note;

  @override
  _FloatingMenuButtonState createState() => _FloatingMenuButtonState();
}

Future<void> _launchMaps(double latitude, double longitude) async {
  final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _FloatingMenuButtonState extends State<FloatingMenuButton> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final double halfOfDeviceWidth = MediaQuery.sizeOf(context).width / 2;
    return Stack(
      // alignment: Alignment.bottomCenter,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          right: isMenuOpen ? halfOfDeviceWidth - 60 - 44 : halfOfDeviceWidth,
          bottom: 0,
          curve: Curves.bounceInOut,
          child: Visibility(
            visible: isMenuOpen,
            child: FloatingActionButton(
              heroTag: null,
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
          right: isMenuOpen ? 60 + halfOfDeviceWidth - 44 : halfOfDeviceWidth,
          bottom: 0,
          curve: Curves.bounceInOut,
          child: Visibility(
            visible: isMenuOpen,
            child: FloatingActionButton(
              heroTag: null,
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
          right: halfOfDeviceWidth - 44,
          bottom: isMenuOpen ? 60 : 0,
          curve: Curves.bounceInOut,
          child: Visibility(
            visible: isMenuOpen,
            child: FloatingActionButton(
              heroTag: null,
              mini: true,
              onPressed: () {
                // Send action
                log("Pressed map button", name: 'FloatingMenuButton');
                _launchMaps(widget.note.location!.latitude,
                    widget.note.location!.longitude);
              },
              child: const Icon(Icons.map),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          right: halfOfDeviceWidth - 48,
          bottom: 0,
          curve: Curves.bounceInOut,
          child: FloatingActionButton(
            heroTag: null,
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
