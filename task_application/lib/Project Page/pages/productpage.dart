// ignore_for_file: avoid_unnecessary_containers

// import 'package:dave_stores/components/models/laptops.dart';
import 'package:flutter/material.dart';
import 'package:task_application/Project%20Page/components/models/laptops.dart';
// import 'laptops.dart';

class ProductsScreen extends StatelessWidget {
  final Function(Laptops) addToCart;

  ProductsScreen({super.key, required this.addToCart});

  final List<Laptops> _laptops = [
    Laptops(
      name: 'HP Laptop',
      price: '₦485,000',
      image: 'assets/images/laptop.png',
      description: 'Hp ProBook 15, Core i3, 8gb ram, 512gb hdd, Touchscreen',
    ),
    Laptops(
      name: 'Omen Laptop',
      price: '₦1,520,000',
      image: 'assets/images/omen.webp',
      description: 'Hp Omen 15, Core i7, 16gb ram, 512gb hdd',
    ),
    Laptops(
      name: 'DELL Laptop',
      price: '₦550,000',
      image: 'assets/images/dell.webp',
      description: 'Dell 15, Core i5, 12gb ram, 500gb ssd',
    ),
    Laptops(
      name: 'Alienware Laptop',
      price: '₦1,800,000',
      image: 'assets/images/alienware.jpg',
      description: 'Alienware , Core i7, 32gb ram, 1Tb ssd',
    ),
    Laptops(
      name: 'Apple Laptop',
      price: '₦750,000',
      image: 'assets/images/apple.webp',
      description: 'Apple M1, Core i7, 16gb ram, 256gb ssd',
    ),
    Laptops(
      name: 'Microsoft Laptop',
      price: '₦450,000',
      image: 'assets/images/microsoft.png',
      description: 'Microsoft Surface Pro 15, Core i7, 16gb ram, 256gb ssd',
    ),
    Laptops(
      name: 'Samsung Laptop',
      price: '₦960,000',
      image: 'assets/images/samsung.webp',
      description: 'Samsung, Core i7, 16gb ram, 512gb ssd, Touchscreen',
    ),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(Icons.menu),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search'),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "When you gain God's way of doing \n things and you do likewise, \n",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    TextSpan(
                      text: 'life answers to you',
                      style: TextStyle(
                        color: Color(0xFF6C63FF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Hot Deals ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _laptops.length,
                    itemBuilder: (context, index) {
                      final laptop = _laptops[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 60.0, right: 60.0),
                          // width: 250,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0))),
                          child: Column(
                            children: [
                              Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(14.0))),
                                elevation: 2,
                                child: Image.asset(
                                  laptop.image,
                                  height: 175,
                                  width: 250,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Text(
                                  laptop.name,
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25.0, top: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 25,
                                          child: Text(
                                            laptop.price,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          height: 60,
                                          child: Text(
                                            laptop.description,
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => addToCart(laptop),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                  // alignment: Alignment.bottomRight,
                                  width: 100,

                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
