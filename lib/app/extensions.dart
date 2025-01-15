import 'package:newtr_application/app/constants.dart';
import 'package:newtr_application/domain/model/models.dart';

extension NonNullString on String? { 
  String orEmpty(){
    if (this == null) {
      return Constants.empty;
    }else {
      return this!;
    } } }

extension NonNullInteger on int? {
  int orZero(){
    if(this == null){
      return Constants.zero ;
    }else {
      return this!;
    } } }