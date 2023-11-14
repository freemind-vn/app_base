import 'package:woo_api/woo_api.dart';

import 'package:app/base.dart';

final woo = WooApi(
  scheme: serviceScheme,
  host: serviceHost,
  consumerKey: const String.fromEnvironment(
    'SERVICE_KEY',
    defaultValue: 'ck_035f1b119915354512de933ed10a17b7b9a1dbba',
  ),
  consumerSecret: const String.fromEnvironment(
    'SERVICE_SECRET',
    defaultValue: 'cs_327a6d29343442bae049d1170797b3bcc7b79b79',
  ),
);
