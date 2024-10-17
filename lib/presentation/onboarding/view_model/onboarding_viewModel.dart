import 'dart:async';

import 'package:newtr_application/domain/models.dart';
import 'package:newtr_application/presentation/base/baseViewModel.dart';
import 'package:newtr_application/presentation/resources/assets_manager.dart';
import 'package:newtr_application/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{
 
   final _streamController = StreamController<SliderViewObject>();

    late final List<SliderObject> _list;
    int _currentIndex = 0;
 
  @override
  void dispose() {
    _streamController.close();
  }
  
  @override
  void start() {
   _list = _getSliderData();
    _postDataToView();
  }

  @override
    int goNext(){
      int nextIndex = ++ _currentIndex;
      if(nextIndex == _list.length){
        nextIndex = 0 ;
      }
      return nextIndex;
    }
    
      @override
      int goPrevious() {
     int previousIndex = --_currentIndex;
        if(previousIndex == -1){
         previousIndex = _list.length -1 ;
       }
      return previousIndex;
      }
    
      @override

      Sink get inputSliderViewObject => _streamController.sink;
    
      @override
      void onPageChanged(int index) {
         _currentIndex = index;
         _postDataToView();
      }
    
      @override
      Stream<SliderViewObject> get outputSliderViewObject 
    => _streamController.stream.map((sliderViewObject)=> sliderViewObject);
  
  void _postDataToView(){
inputSliderViewObject.add(SliderViewObject(_list[_currentIndex],_list.length,_currentIndex));
  }  
   List<SliderObject> _getSliderData() =>[ //مكونات الصفحة 
      SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1 , ImageAssets.onboardingLogo1),
      SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2 , ImageAssets.onboardingLogo2),
      SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3 , ImageAssets.onboardingLogo3),
      SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4 , ImageAssets.onboardingLogo4),
    ];

}




mixin OnBoardingViewModelInputs {
  int goNext(); // when user clicks on right arrow or swipe left

  int goPrevious(); // when user clicks on left arrow or swipe right

  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

mixin OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}