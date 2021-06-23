import 'package:club_house/src/contracts/controller.dart';
import 'package:club_house/src/models/Channel.dart';
import 'package:club_house/src/models/Club.dart';
import 'package:club_house/src/models/User.dart';
import 'package:club_house/src/repository/SearchRespository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../../main.dart';

class SearchPageController extends Controller {
  // search repository
  SearchRepository _searchRepository = Get.find();

  List<FullUser> users = [];

  List<Club> channels = [];

  final searchInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _searchTerms = BehaviorSubject<String>();

  var _results = BehaviorSubject<String>();

  Stream<String> get results => _results.stream;

  @override
  void onInit() {
    _searchTerms
        .debounce((_) => TimerStream(true, Duration(milliseconds: 350),),)
        .listen(
      (text) {
        _findWord(text);
      },
    );
  }

  find(String text) {
    _searchTerms.add(text);
  }

  _findWord(String text) {
    _searchRepository.searchUsers(text).asStream().asyncMap((event) {
      users = event.users ?? [];
      update();
      return _searchRepository.searchClubs(text);
    }).asyncMap((event) {
      channels = event.clubs ?? [];
    }).handleError((onError) {
      logger.e(onError);
    }).listen((event) {
      update();
    });
  }

  @override
  void dispose() {
    _results.close();
    _searchTerms.close();
    super.dispose();
  }
}
