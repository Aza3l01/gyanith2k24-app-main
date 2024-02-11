import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkService {
  static Future<String> createDynamicLink(bool short, String eventId) async {
    String _linkMessage;

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse('https://gyanith.org/Event?id=$eventId'),
      uriPrefix: "https://gyanith24.page.link",
      androidParameters:
          const AndroidParameters(packageName: "com.nitpy.gyanith24"),
    );

    Uri url;
    if (short) {
      // final ShortDynamicLink shortLink = await parameters.buildShortLink();
      // url = shortLink.shortUrl;
      final shortLink =
          await FirebaseDynamicLinks.instance.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await FirebaseDynamicLinks.instance.buildLink(parameters);
    }

    _linkMessage = url.toString();
    return _linkMessage;
  }

  // static final DynamicLinkService _singleton = DynamicLinkService._internal();
  // DynamicLinkService._internal();
  // static DynamicLinkService get instance => _singleton;

  // // Create new dynamic link
  // void createDynamicLink() async {
  //   final dynamicLinkParams = DynamicLinkParameters(
  //     link: Uri.parse("https://gyanith24.page.link.com/"),
  //     uriPrefix: "https://gyanith24.page.link",
  // androidParameters:
  //     const AndroidParameters(packageName: "com.nitpy.gyanith24"),
  //   );
  // final dynamicLink =
  //     await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
  // debugPrint("${dynamicLink.shortUrl}");
  // }
}
