import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

// Material

class Routes {
  static String root = '/';
  static String login = '/custom/login';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR====>ROUTE WAS NOT FONUND!!!');
    });

    router.define(login, handler: loginHandler);
    // router.define(mainPage, handler: mainHandler);
    // router.define(mobileLoginPage, handler: mobileLoginHandler);
    // router.define(verifyCode, handler: VerificationCodeHandler);
    // router.define(feeback, handler: FeedbackHandler);
    // router.define(setPassword, handler: setPasswordHandler);
    // router.define(profile, handler: ProfilePageHandler);
    // router.define(profileEdit, handler: ProfileEditPageHandler);
    // router.define(orderDetail, handler: OrderDetailHandler);
    // router.define(orderCancel, handler: OrderCancelHandler);
    // router.define(estimatedPricePage, handler: estimatedPricePageHandler);
    // router.define(invoiceDetailPage, handler: InvoiceDetailPageHandler);
    // router.define(invoiceListPage, handler: InvoiceListPageHandler);
    // router.define(invoiceHistoryPage, handler: InvoiceHistoryPageHandler);
    // router.define(invoiceHelpPage, handler: InvoiceHelpPageHandler);
    // router.define(invitationCode, handler: InvitationCodeHandler);
    // router.define(wxTestPage, handler: WxTestPageHandler);
    // router.define(wxSharePage, handler: WxSharePageHandler);
    // router.define(personCenterPage,handler: PersonCenterPageHandler);
    // router.define(orderListNewPage,handler: OrderListNewPageHandler);
    // router.define(noticeNoNetworkPage,handler: NoticeNoNetworkPageHandler);
  }
}
