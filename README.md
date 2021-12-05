# E-commerce-UI-Flutter-Practice with GetX

<img width="350" alt="스크린샷" src="https://user-images.githubusercontent.com/28912774/144739393-8ed16137-ade1-4537-bec9-9f689efcc69c.gif">

## 🗂 File Tree

```markdown
📦lib
┣ 📂model
┃ ┗ 📜product.dart => **Product 모델**
┣ 📂pages => **총 2개의 페이지**
┃ ┣ 📂details => **details 페이지**
┃ ┃ ┣ 📂components => **Detail page Components**
┃ ┃ ┃ ┣ 📜add_to_cart.dart
┃ ┃ ┃ ┣ 📜body.dart
┃ ┃ ┃ ┣ 📜cart_counter.dart
┃ ┃ ┃ ┣ 📜color_and_size.dart
┃ ┃ ┃ ┣ 📜counter_with_fav_btn.dart
┃ ┃ ┃ ┣ 📜description.dart
┃ ┃ ┃ ┗ 📜product_title_with_image.dart
┃ ┃ ┣ 📜details_binding.dart => **Detail page binding**
┃ ┃ ┣ 📜details_controller.dart => **Detail page controller**
┃ ┃ ┗ 📜details_page.dart => **Detail main page**
┃ ┗ 📂home
┃ ┃ ┣ 📂components => **Home page components**
┃ ┃ ┃ ┣ 📜body.dart
┃ ┃ ┃ ┣ 📜categories.dart
┃ ┃ ┃ ┗ 📜item_card.dart
┃ ┃ ┣ 📜home_binding.dart => **Home page binding**
┃ ┃ ┣ 📜home_controller.dart => **Home page controller**
┃ ┃ ┗ 📜home_page.dart => **Home page**
┣ 📂repository
┃ ┗ 📜fetch_db.dart => **DB**
┣ 📜constants.dart -> **Constants**
┗ 📜main.dart => **Main.dart**
```

## 🪜 UI Component Structure

<img width="350" alt="스크린샷" src="https://user-images.githubusercontent.com/28912774/144741177-c3d0fd43-40da-4e5a-a977-db72f0f935f0.png">

<img width="350" alt="스크린샷" src="https://user-images.githubusercontent.com/28912774/144741185-ef4b2800-454f-4bef-b69a-e4e398119918.png">

## Check Point!

### GetMaterialAPP GetPage

```dart
// in main.dart

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-commerce-UI-APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/details/:productID",
          page: () => DetailPage(),
          binding: DetailsBinding(),
        ),
      ],
    );
  }
}
```

### GetView.builder

```dart
// in home/components/body.dart

Expanded(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
    child: GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: kDefaultPadding,
        crossAxisSpacing: kDefaultPadding,
        childAspectRatio: 0.74,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Get.toNamed("/details/$index");
        },
        child: ItemCard(
          product: products[index],
        ),
      ),
    ),
  ),
),

```

### Detail view controller

```dart
class DetailController extends GetxController {
  static DetailController get to => Get.find();

  // Get Parmameter Index
  final productID = int.parse(Get.parameters["productID"]!);

  // CartCounter number
  RxInt numOfItems = 1.obs;

  void incremnetsCartCount() {
    numOfItems.value++;
  }

  void decremnetsDartCount() {
    if (numOfItems.value > 1) {
      numOfItems.value--;
    }
  }
}

```

### Hero animation

1. create Hero animation start point

```dart
// in home/components/item_card.dart

Expanded(
  child: Container(
    padding: EdgeInsets.all(kDefaultPadding),
    decoration: BoxDecoration(
      color: product.color,
      borderRadius: BorderRadius.circular(16),
    ),
    // Create Hero animation start point as Image
    child:
        Hero(tag: "${product.id}", child: Image.asset(product.image!)),
  ),
),
```

2. receive Hero animation end point

```dart
// in details/components/product_title_with_image.dart

 Expanded(
  child: Hero(
    tag: "${product!.id}",
    child: Image.asset(
      product!.image!,
      fit: BoxFit.fitWidth,
    ),
  ),
)
```
