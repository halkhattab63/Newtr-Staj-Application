import 'package:newtr_application/app/constants.dart';
import 'package:newtr_application/app/extensions.dart';
import 'package:newtr_application/data/response/responses.dart';
import 'package:newtr_application/domain/model/models.dart';

extension CustomerResponseMapper on CustomerResponse?{
  Customer toDomain(){
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.numOfNotifications.orZero() ?? Constants.zero);
  }
}

extension ContactsResponseMapper  on ContactsResponse?{
  Contacts toDomain(){
    return Contacts(
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty);
  }
}


extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts.toDomain());
  }
}