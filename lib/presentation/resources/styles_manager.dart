import 'package:newtr_application/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle( double fontSize, FontWeight fontWeight , Color color ){
  return TextStyle(
      fontSize: fontSize ,
      fontFamily:  FontConstants.fontFamily ,
      color: color ,
      fontWeight: fontWeight); 
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// Bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}


// light style 

TextStyle getLightStyle ( 
  {double fontSize = FontSize.s12 ,required Color color}){
    return _getTextStyle(fontSize, FontWeightManager.light , color);
}


// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}


// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}