import 'dart:developer';

import 'package:url_launcher/url_launcher.dart' as url_launcher;

class QuickOrderController {
  void quickOrder() async {
    const String phoneNumber =
        '1234567890'; // Replace with the desired phone number
    const String message =
        'Hello from my app!'; // Replace with the desired message

    final whatsappUrl = Uri.parse(
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}');

    try {
      if (await url_launcher.canLaunchUrl(whatsappUrl)) {
        await url_launcher.launchUrl(whatsappUrl);
      } else {
        throw 'Could not launch WhatsApp';
      }
    } on Exception catch (err) {
      log('Error: $err');
    }
  }
}
