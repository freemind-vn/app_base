import 'package:wordpress_client/wordpress_client.dart';

final wp = WordpressClient(
  baseUrl: Uri.parse('https://trongkhuvuon.com'),
  bootstrapper: (b) => b.withDebugMode(true).build(),
);
