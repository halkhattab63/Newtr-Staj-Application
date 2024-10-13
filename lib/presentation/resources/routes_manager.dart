import 'package:newtr_application/presentation/forgot_password/forget_password_view.dart';
import 'package:newtr_application/presentation/login/login_view.dart';
import 'package:newtr_application/presentation/main/main_view.dart';
import 'package:newtr_application/presentation/register/register_view.dart';
import 'package:newtr_application/presentation/resources/strings_manager.dart';
import 'package:newtr_application/presentation/splash/splash_view.dart';
import 'package:newtr_application/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes{
  static const String splashRoute  = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute :
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute : 
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default :
        return unDefinedRoute();
    }
  }
  
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_)=> Scaffold(
      appBar: AppBar(
        title:  const Text(AppStrings.noRouteFound),// todo move this string to strings 
      ),
      body:  const Center(
        child: Text(AppStrings.noRouteFound),),// todo move this string to strings 
    )
    );
  }

}