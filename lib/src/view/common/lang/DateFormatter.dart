import 'package:club_house/main.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jalali_calendar/jalali_calendar.dart';

class DateFormatter{

  static setup(List<String> locals){
    locals.forEach((element) {
      if(_formatter.containsKey(element)){
        initializeDateFormatting(element, null).then(_formatter[element]);
      }
    });
  }

  static Map<String,Function> _formatter = {
    'fa_IR':(_){

    },
    'en_US':(_){

    }
  };


}