import 'package:base/ui/views/countaer_provider_view.dart';
import 'package:base/ui/views/countaer_view.dart';
import 'package:base/ui/views/view_404.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/sateful',
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/sateful/:base',
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/provider',
      transitionType: TransitionType.fadeIn,
      handler: _counterProviderHandler,
    );
    router.define(
      '/dashboard/users/:userid/:roleid',
      transitionType: TransitionType.fadeIn,
      handler: _dashboardUserHAndler,
    );

    router.notFoundHandler = _pageNotFound;
  }

  //handler
  static final Handler _counterHandler =
      Handler(handlerFunc: (context, params) {
    print(params['base']?.first);
    return CounterView(
      base: params['base']?[0] ?? '5',
    );
  });

  static final Handler _counterProviderHandler =
      Handler(handlerFunc: (context, params) {
    return CounterProviderView(
      base: params['q']?[0] ?? '10',
    );
  });

  static final Handler _pageNotFound =
      Handler(handlerFunc: (context, params) => View404());

  static final Handler _dashboardUserHAndler =
      Handler(handlerFunc: (context, params) {
    print(params);
    return View404();
  });
}
