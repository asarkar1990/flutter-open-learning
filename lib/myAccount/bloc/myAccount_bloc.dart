import 'package:flutter/cupertino.dart';
import 'package:ncert/models/model.dart';

import 'myAccount_repository.dart';

class MyAccountBloc {

  MyAccountRepository _repository = MyAccountRepository();

  MyAccountBloc._internal();

  static final MyAccountBloc _singleton =  MyAccountBloc._internal();

  factory MyAccountBloc() {
    return _singleton;
  }

  factory MyAccountBloc.of(BuildContext context, {bool listen}) {
    return MyAccountBloc();
  }

  void updateUserStandard(Standard std){
    _repository.updateUserStd(std);
  }
}

