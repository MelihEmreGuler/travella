import 'package:flutter/cupertino.dart';

import '../fliters_methods/ilgi_alanlari.dart';
import '../fliters_methods/fliter_screen.dart';
import '../temporary_pages/mainpage.dart';

class ilgiAlaniKontrol extends StatelessWidget {
  const ilgiAlaniKontrol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if( IlgiAlanlari.ilgiAlanlari.isNotEmpty) {
      return main_page();
    }else {
      return FilterScreen();
    }
  }
}
