import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../constants/icons.dart';
import '../constants/theme.dart';

class Header extends StatelessComponent {
  const Header({
    super.key,
    required this.title,
    this.showHomeLink = false,
  });

  final String title;
  final bool showHomeLink;

  @override
  Component build(BuildContext context) {
    return header(classes: 'app-bar', [
      if (showHomeLink) const Link(to: '/', classes: 'home-link', child: .text('⌂')),
      h1([.text(title)]),
      a(
        href: 'https://github.com/KlubJagiellonski/pola-barcodes',
        target: Target.blank,
        classes: 'github-link',
        attributes: {'rel': 'noopener noreferrer', 'aria-label': 'GitHub'},
        [RawText(AppIcons.github)],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.app-bar', [
      css('&').styles(
        display: .flex,
        minHeight: 56.px,
        padding: .symmetric(horizontal: 16.px),
        alignItems: .center,
        gap: .all(12.px),
        color: Colors.white,
        backgroundColor: AppColors.red,
      ),
      css('h1').styles(
        margin: .zero,
        overflow: .hidden,
        fontSize: 20.px,
        fontWeight: .w500,
        textOverflow: .ellipsis,
        whiteSpace: .noWrap,
      ),
      css('.home-link').styles(
        color: Colors.white,
        fontSize: 28.px,
        textDecoration: const TextDecoration(line: .none),
        lineHeight: 1.em,
      ),
      css('.github-link').styles(
        display: .flex,
        alignItems: .center,
        color: Colors.white,
        lineHeight: 0.em,
        raw: {'margin-left': 'auto'},
      ),
    ]),
  ];
}
