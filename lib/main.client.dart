/// The entrypoint for the **client** environment.
///
/// The [main] method will only be executed on the client when loading the page.
/// To run code on the server during pre-rendering, check the `main.server.dart` file.
library;

import 'package:jaspr/client.dart';
import 'package:universal_web/web.dart' as web;

import 'i18n/strings.g.dart';
// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.client.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultClientOptions,
  );

  // Switch to the browser locale before hydration, so the first client render
  // is already translated (pages are pre-rendered in the base locale).
  LocaleSettings.setLocaleRawSync(web.window.navigator.language);

  runApp(
    const ClientApp(),
  );
}
