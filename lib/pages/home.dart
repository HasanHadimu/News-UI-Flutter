import 'package:flutter/material.dart';
import 'package:flutternews/models/category_model.dart';
import 'package:flutternews/models/slider_model.dart';
import 'package:flutternews/services/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutternews/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Step Pertama
class _HomeState extends State<Home> {
// step5
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  int activeIndex = 0; // Variabel untuk menyimpan indeks aktif
  @override
  void initState() {
    categories = getCategories();
    sliders = getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ambon"),
              Text(
                "News",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
        // step 6
        body: Container(
          padding: const EdgeInsets.all(
              8.0), // Menambahkan padding untuk ruang di sekitar kategori
          child: Column(
            // agar teks breaking news berada di kiri
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kategori ListView.builder
              Container(
                height:
                    80, // Menentukan tinggi kategori agar tidak mengambil seluruh ruang
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Categorytile(
                      image: categories[index].image,
                      categoryName: categories[index].categoryName,
                    );
                  },
                ),
              ),

              // Menambahkan SizedBox untuk memberi jarak antara kategori dan carousel
              SizedBox(
                height: 30.0, // Menentukan jarak antara kategori dan carousel
              ),

// membuat teks breaking news dan view all
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Breaking News',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20.0, // Menentukan jarak antara kategori dan carousel
              ),
              // Carousel Slider
              Container(
                // Membungkus carousel slider agar lebih fleksibel
                margin: EdgeInsets.symmetric(
                    horizontal: 8.0), // Memberikan margin untuk carousel
                child: CarouselSlider.builder(
                  itemCount: sliders.length,
                  itemBuilder: (context, index, realIndex) {
                    String? res = sliders[index].image;
                    String? res1 = sliders[index].name;
                    return buildImage(res, index, res1);
                  },
                  options: CarouselOptions(
                      height: 200, // Menentukan tinggi carousel
                      enlargeCenterPage: true,
                      autoPlay: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      }),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(child: buildIndicator()),

              // Menambahkan SizedBox untuk memberi jarak antara kategori dan carousel
              SizedBox(
                height: 30.0, // Menentukan jarak antara kategori dan carousel
              ),

// membuat teks breaking news dan view all
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tranding News',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildImage(String image, int index, String name) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: MediaQuery.of(context)
              .size
              .width, // Perbaiki kesalahan sintaksis di sini
        ),
      ),
      // Container()
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: sliders.length,
        effect: SlideEffect(
            dotWidth: 12, dotHeight: 12, activeDotColor: Colors.blue),
      );
}

// step kedua
class Categorytile extends StatelessWidget {
  final image, categoryName;

  const Categorytile({this.categoryName, this.image});

// step7 tambahkan slicing pada categoytile: margin, Clipreact, Boxfit
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child:
                Image.asset(image, width: 126, height: 60, fit: BoxFit.cover),
          ),
          // step8
          Container(
            width: 120,
            height: 70,
            child: Center(
                child: Text(categoryName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
          )
        ],
      ),
    );
  }
}
