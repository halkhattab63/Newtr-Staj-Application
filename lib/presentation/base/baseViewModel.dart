
abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs{
  // Herhangi bir görünüm modeli aracılığıyla kullanılacak paylaşılan değişkenler ve fonksiyon.
}

abstract class BaseViewModelInputs {
  void start ();// start view model job
  void dispose();// will be called when view model dies
}
 mixin BaseViewModelOutputs {

}