import 'package:newtr_application/presentation/resources/color_manager.dart';
import 'package:newtr_application/presentation/resources/font_manager.dart';
import 'package:newtr_application/presentation/resources/styles_manager.dart';
import 'package:newtr_application/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getAppLicationTheme(){
  return ThemeData(
    // main colors 
    primaryColor : ColorManager.crimsonBlaze, 
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary ,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary, 
    // cardview theme 
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,),

    // AppBar theme 
    appBarTheme:  AppBarTheme(
      centerTitle: true,
      color: ColorManager.crimsonBlaze ,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16)),
      
      // button theme 
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary , 
        splashColor: ColorManager.lightPrimary,),

      //  eleveted buttom theme 
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(color: ColorManager.white ,fontSize: FontSize.s17), 
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),))),
      
      // text theme 
      textTheme: TextTheme(
        displayLarge:
            getLightStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
        
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16),

        headlineMedium: getRegularStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s14),

        titleMedium: getMediumStyle(
            color: ColorManager.crimsonBlaze, fontSize: FontSize.s16),

        bodySmall: getRegularStyle(color: ColorManager.grey),

        bodyLarge: getRegularStyle(color: ColorManager.grey1)),


      // input decoration theme 
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),//constend padding 
        hintStyle: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s14), //hint style 
        labelStyle: getMediumStyle(color: ColorManager.grey,fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),

        //enabled border style 
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      // focused border style 
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color:  ColorManager.grey, width: AppSize.s1_5),
       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      
      //error border style 
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius:  const BorderRadius.all(Radius.circular(AppSize.s8))),

      //focused border style 
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary , width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
      );
}