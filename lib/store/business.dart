import 'package:mobx/mobx.dart';

// Include generated file
part 'business.g.dart';

// This is the class used by rest of your codebase
class Business = _Business with _$Business;

// The store-class
abstract class _Business with Store {
  @observable
  List<String> tags = [];

  @action
  void addTag(String tag) {
    tags.add(tag);
  }

  @action
  void removeTag(String tag) {
    tags.remove(tag);
  }
}
