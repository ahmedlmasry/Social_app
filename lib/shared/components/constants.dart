import 'package:groub/shared/components/components.dart';
import 'package:groub/shared/network/local/cache_helper.dart';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';
String uId = '';
