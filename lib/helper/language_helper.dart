import 'package:flutter/cupertino.dart';
import 'package:vendor_list/widgets/widgets.dart';

class Language extends ChangeNotifier{
  bool _language=false;
  get getLanguage=>_language;
  changeLanguage()
  {
    if(_language) {
      _language = false;
      english=false;
    } else {
      _language = true;
      english=true;
    }
    notifyListeners();
  }

}