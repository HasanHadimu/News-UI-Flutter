import 'package:flutternews/models/slider_model.dart';

List<SliderModel> getSliders() {
  // Membuat list untuk menyimpan slider
  List<SliderModel> sliders = [];

  // Menambahkan slider pertama
  sliders.add(SliderModel(
    image: "assets/images/business.jpg",
    name: "How to The Authority of silenforce",
  ));

  // Menambahkan slider kedua
  sliders.add(SliderModel(
    image: "assets/images/enterteinment.jpg",
    name: "How to The Authority of silenforce",
  ));

  // Menambahkan slider ketiga
  sliders.add(SliderModel(
    image: "assets/images/healt.png",
    name: "How to The Authority of silenforce",
  ));

  return sliders;
}
