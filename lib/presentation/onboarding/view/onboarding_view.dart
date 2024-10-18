import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newtr_application/domain/model/models.dart';
import 'package:newtr_application/presentation/onboarding/view_model/onboarding_viewModel.dart';
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
    
    final PageController _pageController = PageController();
    final OnBoardingViewModel _viewModel = OnBoardingViewModel();
    _bind(){
      _viewModel.start();
    }

  @override
  void initState(){
    _bind();
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder:(context,snapshot){
        return _getContentWidget(snapshot.data);
      });
  }

  Widget _getContentWidget(SliderViewObject?SliderViewObject){
    if (SliderViewObject==null) {
      return Container();
    }else{
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
      body: PageView.builder(
        controller: _pageController,
        itemCount: SliderViewObject.numOfSlides,
        onPageChanged: (index){
            _viewModel.onPageChanged(index);
          },
          itemBuilder:(context,index){
            return OnBoardingPage(SliderViewObject.sliderObject);
          }),
        

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
              _getBottomSheetWidget(SliderViewObject)
            ],
          ),
        ),
      );
    }
  }


  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject){
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
              _pageController.animateToPage(_viewModel.goPrevious(),
               duration: const Duration(
                milliseconds: AppConstants.sliderAnimationTime
               ), curve: Curves.bounceInOut);
            },
          ),
          ),
      
          Row(
            children: [
              for(int i = 0 ; i<sliderViewObject.numOfSlides; i++)
              Padding(padding: const EdgeInsets.all(AppPadding.p8),
              child: _getProperCircle(i, sliderViewObject.currentIndex),)
            ],
          ),
          Padding(padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(child: SizedBox(
            width: AppSize.s20,
            height: AppSize.s20,
            child: SvgPicture.asset(ImageAssets.chevronRight),
              ),
               onTap: () {
              _pageController.animateToPage(_viewModel.goNext(),
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



  Widget _getProperCircle(int index, int currentIndex){
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.checkCircle);
    }else { 
      return SvgPicture.asset(ImageAssets.circle);
    }
  }

@override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
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
