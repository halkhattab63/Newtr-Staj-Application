import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newtr_application/presentation/resources/assets_manager.dart';
import 'package:newtr_application/presentation/resources/color_manager.dart';
import 'package:newtr_application/presentation/resources/constants_manager.dart';
import 'package:newtr_application/presentation/resources/routes_manager.dart';
import 'package:newtr_application/presentation/resources/strings_manager.dart';
import 'package:newtr_application/presentation/resources/values_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
    late final List<SliderObject> _list = _getSliderData();
    final PageController _pageController = PageController();
    int _currentIndex = 0;

    List<SliderObject> _getSliderData() =>[ //مكونات الصفحة 
      SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1 , ImageAssets.onboardingLogo1),
      SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2 , ImageAssets.onboardingLogo2),
      SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3 , ImageAssets.onboardingLogo3),
      SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4 , ImageAssets.onboardingLogo4),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(// هذا القسم هنا للتعامل مع شريط الاشعارات 
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: PageView.builder(controller: _pageController,
      itemCount: _list.length,
      onPageChanged: (index){
        setState(() {
          _currentIndex = index ;
        });
      },
      itemBuilder: (context, index ){
        return OnBoardingPage(_list[index]);
      },
      ),
      // الشريط السفلي

      bottomSheet: Container(
        color: ColorManager.white,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                }, 
                child:  Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.end,
                  ),
                ),
             ),
            _getBottomSheetWidget()
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget(){
    return Container(
      color: ColorManager.crimsonBlaze,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              width: AppSize.s20,
              height: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.chevronLeft),
            ),
            onTap: () {
              _pageController.animateToPage(_getPreviousIndex(),
               duration: const Duration(
                milliseconds: AppConstants.sliderAnimationTime
               ), curve: Curves.bounceInOut);
            },
          ),
          ),
      
          Row(
            children: [
              for(int i = 0 ; i<_list.length; i++)
              Padding(padding: const EdgeInsets.all(AppPadding.p8),
              child: _getProperCircle(i),)
            ],
          ),
          Padding(padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(child: SizedBox(
            width: AppSize.s20,
            height: AppSize.s20,
            child: SvgPicture.asset(ImageAssets.chevronRight),
              ),
               onTap: () {
              _pageController.animateToPage(_getnextIndex(),
               duration: const Duration(
                milliseconds: AppConstants.sliderAnimationTime
               ), curve: Curves.bounceInOut);
            },
            ),
          ),
        ],
      ),
    );
  }


  int _getPreviousIndex(){
    int previousIndex = --_currentIndex;
    if (previousIndex == -1){
      previousIndex = _list.length -1 ;
    }
    return previousIndex; 
  }


  int _getnextIndex(){
    int nextIndex = ++_currentIndex ;
    if(nextIndex == _list.length){
      nextIndex = 0;
    }
    return nextIndex;
  }

  Widget _getProperCircle(int index){
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.checkCircle);
    }else { 
      return SvgPicture.asset(ImageAssets.circle);
    }
  }

}

class OnBoardingPage extends StatelessWidget {

  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject,{Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:  MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40,),
        Padding(padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
        _sliderObject.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge,
        ),),
        Padding(padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(_sliderObject.subTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
        ),),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}