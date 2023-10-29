import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:queer_world/models/entity/business_entity.dart';
import 'package:queer_world/models/enum/business_type.dart';
import 'package:validators2/validators2.dart';

// Include generated file
part 'form_add_business.g.dart';

class FormAddBusinessStore = _FormAddBusinessStore with _$FormAddBusinessStore;

abstract class _FormAddBusinessStore with Store {
  final FormErrorState error = FormErrorState();

  @observable
  BusinessType businessType = BusinessType.business;

  @observable
  String business = '';

  @observable
  String description = '';

  @observable
  String website = '';

  @observable
  String instagram = '';

  @observable
  String tiktok = '';

  @observable
  String facebook = '';

  @observable
  ObservableList<String> tags = ObservableList<String>();

  @observable
  ObservableFuture<bool> businessnameCheck = ObservableFuture.value(true);

  @computed
  bool get isBusinessCheckPending =>
      businessnameCheck.status == FutureStatus.pending;

  late List<ReactionDisposer> _disposers;

  @action
  void addTag(String tag) {
    tags.add(tag);
  }

  @action
  void removeTag(String tag) {
    tags.remove(tag);
  }

  void setupValidations() {
    _disposers = [
      reaction((_) => business, validateBusinessname),
    ];
  }

  @action
  Future validateBusinessname(String value) async {
    if (value.isEmpty) {
      error.businessname = 'Cannot be blank';
      return;
    }

    try {
      businessnameCheck = ObservableFuture(checkValidBusinessname(value));

      error.businessname = null;

      final isValid = await businessnameCheck;
      if (!isValid) {
        error.businessname = 'Businessname cannot be "admin"';
        return;
      }
    } on Object catch (_) {
      error.businessname = null;
    }

    error.businessname = null;
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Not a valid email';
  }

  Future<bool> checkValidBusinessname(String value) async {
    await Future.delayed(const Duration(seconds: 1));

    return value != 'admin';
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateBusinessname(business);
  }

  @action
  Future<DocumentReference> addBusinessRequest() async {
    BusinessEntity businessRequest = BusinessEntity(
        businessType: businessType,
        business: business,
        description: description,
        website: website,
        instagram: instagram,
        tiktok: tiktok,
        facebook: facebook,
        requestedAt: Timestamp.now(),
        tags: tags);
    return FirebaseFirestore.instance
        .collection(BusinessEntity.kCollectionName)
        .add(businessRequest.toJson());
    // Business businessRequest = Business(
    //     name: business,
    //     description: description,
    //     website: website,
    //     requestedAt: Timestamp.now(),
    //     tags: tags);
    // final future = client.repositories.listUserRepositories(user).toList();
    // fetchReposFuture = ObservableFuture(future);

    // return repositories = await future;
  }
}

// ignore: library_private_types_in_public_api
class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? businessname;

  @observable
  String? email;

  @observable
  String? password;

  @computed
  bool get hasErrors =>
      businessname != null || email != null || password != null;
}
