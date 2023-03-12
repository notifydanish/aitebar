// import 'package:flutter/material.dart';
//
// class DefaultAppRouter {
//   final BuildContext context;
//
//   DefaultAppRouter(this.context);
//
//   Future<dynamic> push(Widget widget) {
//     return Navigator.of(context).push(
//       MaterialPageRoute(builder: (_) => widget),
//     );
//   }
//
//   Future<dynamic> pushAndRemoveUntil(Widget widget, {required bool Function(Route<dynamic>) predicate}) {
//     return Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (_) => widget),
//       (_) => predicate(_),
//     );
//   }
//
//   Future<dynamic> navigate(Widget widget) {
//     return Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (_) => widget),
//     );
//   }
//
//   Future<dynamic> navigateAndPopUntil(Widget widget) {
//     return Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (_) => widget),
//       (_) => false,
//     );
//   }
//
//   void pop() {
//     Navigator.of(context).pop();
//   }
// }
