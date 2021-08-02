import 'package:url_launcher/url_launcher.dart';

class OpenNewsService {

  static Future openLink({required String url}) async => _launchUrl(url);

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, forceSafariVC: true,).catchError((error) {print(error);});
    }
  }

}