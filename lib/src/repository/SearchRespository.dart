import 'package:club_house/src/contracts/repository.dart';
import 'package:club_house/src/models/SearchUser.dart';
import 'package:club_house/src/models/SearchClub.dart';

class SearchRepository extends Repository {

  Future<SearchClub> searchClubs(String club_name) => api.searchClubs(club_name);

  Future<SearchUser> searchUsers(String username) => api.searchPeople(username);


}