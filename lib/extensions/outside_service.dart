// ignore_for_file: unused_element

import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class OutsideService {
  void call(String number) => launchUrl(Uri.parse('tel: $number'));
  void sendMail(String email) => launchUrl(Uri.parse('mailto: $email'));

  void openGmail() async {
    String url = "https://mail.google.com/mail/u/0/#inbox'";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void sendViber(String phone) {
    //TODO
  }

  void sendWhatsApp(String phone) async {
    var content = 'This is message';
    final url = 'https://wa.me/$phone?body=$content';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void sendSMS(String phone) async {
    var content = 'This is message';
    final messageUrl = 'sms:$phone?body=$content';

    if (await canLaunch(messageUrl)) {
      await launch(messageUrl);
    } else {
      // iOS
      var uri = 'sms:$phone?body=$content';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  void _launchURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'my.mail@example.com',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  Future<void> contactDial(String number) async {
    await _launchCaller(number);
  }

  _launchCaller(String number) async {
    String url = Platform.isIOS ? 'tel://$number' : 'tel:$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchMapUrl(String address) async {
    // String encodedAddress = Uri.encodeComponent(address);

    // String googleMapUrl = "google.navigation:q=$lat,$lng&mode=c";
    // String appleMapUrl = "http://maps.apple.com/?q=$encodedAddress";
    // if (Platform.isAndroid) {
    //   try {
    //     if (await canLaunch(googleMapUrl)) {
    //       await launch(googleMapUrl);
    //     }
    //   } catch (error) {
    //     throw("Cannot launch Google map");
    //   }
    // }
  }
}
