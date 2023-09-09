import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:todoapp/services/repository_firestore.dart';

abstract class BottomSheetChooseImage {
  static Future<XFile?> show(
    BuildContext context,
  ) async {
    XFile? file;

    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            TextButton(
                onPressed: () async {
                  file = await choosePictureFromCamera(context);
                  Navigator.of(context).pop();
                },
                child: const Text('Camera')),
            TextButton(
                onPressed: () async {
                  file = await choosePictureFromGallery(context);
                  Navigator.of(context).pop();
                },
                child: const Text('Gallery')),
          ],
        );
      },
    );

    return file;
  }
}

Future<XFile?> choosePictureFromGallery(BuildContext context) async {
  final bool hasPermission = await askForPermissions(
    context: context,
    permission: await obtainPermissionToPhotos(),
    dialogSubtitle: 'Please give permission',
  );

  if (!hasPermission) {
    return null;
  }
  final imagePicker = ImagePicker();

  return await imagePicker.pickImage(source: ImageSource.gallery);
}

Future<XFile?> choosePictureFromCamera(BuildContext context) async {
  if (Platform.isIOS) {
    final bool hasPermission = await askForPermissions(
      context: context,
      permission: Permission.camera,
      dialogSubtitle: 'Please give permission',
    );

    if (!hasPermission) {
      return null;
    }
  }

  final imagePicker = ImagePicker();
  return await imagePicker.pickImage(source: ImageSource.camera);
}

/// If permission is given then does nothing.
/// If permission is not given show a dialog with button to open settings.
Future<bool> askForPermissions({
  required BuildContext context,
  required Permission permission,
  required String dialogSubtitle,
}) async {
  final PermissionStatus status = await permission.status;
  switch (status) {
    case PermissionStatus.granted:
    case PermissionStatus.limited:
      return true;
    case PermissionStatus.denied:
      final PermissionStatus newStatus = await permission.request();
      if (newStatus.isGranted || newStatus.isLimited) {
        return true;
      }
      log('No permission granted. Open settings to give permission.');

      return false;
    case PermissionStatus.permanentlyDenied:
    case PermissionStatus.restricted:
      log('No permission granted. Open settings to give permission.');
      return false;
    case PermissionStatus.provisional:
      return false;
  }
}

Future<Permission> obtainPermissionToPhotos() async {
  late final Permission permission;

  if (Platform.isAndroid) {
    final AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
    final int sdkInt = androidInfo.version.sdkInt;

    if (sdkInt >= 33) {
      permission = Permission.photos;
    } else {
      permission = Permission.storage;
    }
  } else {
    permission = Permission.photos;
  }
  return permission;
}
