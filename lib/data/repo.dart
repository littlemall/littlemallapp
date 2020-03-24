import 'package:flutter/material.dart';
import 'package:littlemallapp/data/http.dart';
import 'package:littlemallapp/data/url_api.dart';

class Repo {
  
  register(params, {BuildContext context}) {
    return Http().postRequest(apiPath['register'], params, context: context);
  }

  login(params, {BuildContext context}) {
    return Http().postRequest(apiPath['login'], params, context: context);
  }

  getUser(params, {BuildContext context}) {
    return Http()
        .getRequest(apiPath['getUser'], params: params, context: context);
  }

  changePassword(params, {BuildContext context}) {
    return Http()
        .postRequest(apiPath['changePassword'], params, context: context);
  }
}
