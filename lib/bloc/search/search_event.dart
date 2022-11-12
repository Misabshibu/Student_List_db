part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchStudent extends SearchEvent {
  SearchStudent({this.searchString = ''});

  String searchString;
}

class RemoveStudent extends SearchEvent {
  RemoveStudent({required this.id});
  final int id;
}
