/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'constants/theme.dart';
import 'i18n/strings.g.dart';
// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Pages are pre-rendered in the base locale (pl). The client switches to the
  // browser locale before hydration (see main.client.dart).
  runApp(Document(
    title: t.appTitle,
    lang: 'pl',
    base: const String.fromEnvironment('BASE_PATH', defaultValue: '/'),
    meta: {
      'description': 'Testowe kody kreskowe dla projektu Pola.',
    },
    head: [
      const link(rel: 'manifest', href: 'manifest.json'),
      const link(rel: 'icon', href: 'favicon.png', attributes: {'type': 'image/png'}),
      const link(rel: 'apple-touch-icon', href: 'icons/Icon-192.png'),
      // Handle redirect from 404.html for SPA routing on GitHub Pages.
      // The 404.html encodes the original path as "/?/original/path" and
      // redirects here. This inline script restores the correct URL before the
      // client script loads so that the router can match the intended route.
      //
      // See https://github.com/rafgrstdev/spa-github-pages for more details.
      const script(content: r'''
(function(l) {
  if (l.search[1] === '/') {
    var decoded = l.search.slice(1).split('&').map(function(s) {
      return s.replace(/~and~/g, '&');
    }).join('?');
    window.history.replaceState(null, null,
      l.pathname.slice(0, -1) + decoded + l.hash
    );
  }
}(window.location));
'''),
    ],
    styles: [
      css('html, body').styles(
        width: 100.percent,
        minHeight: 100.vh,
        padding: .zero,
        margin: .zero,
        color: AppColors.text,
        backgroundColor: Colors.white,
        raw: {
          'font-family': "system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif",
          'color-scheme': 'light',
        },
      ),
      css('*').styles(boxSizing: .borderBox),
    ],
    body: App(),
  ));
}
