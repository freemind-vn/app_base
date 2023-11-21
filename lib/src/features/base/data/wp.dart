import 'package:wordpress_client/wordpress_client.dart';

const serviceScheme =
    String.fromEnvironment('SERVICE_SCHEME', defaultValue: 'https');
const serviceHost = String.fromEnvironment(
  'SERVICE_HOST',
  defaultValue: 'wp.dev.freemind.vn',
);

final wp = WordpressClient(
  baseUrl: Uri.parse('$serviceScheme://$serviceHost'),
  bootstrapper: (b) => b.withDebugMode(false).build(),
);
