import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.black),
        ),
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Icon(Icons.share, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 IMAGEN
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://static.bershka.net/assets/public/d934/50a1/498e46f9baa9/e085512b27a3/07410732717-a4o/07410732717-a4o.jpg?ts=1763390819712&w=850&f=auto",
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// 🔹 TITULO + RATING
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Sudadera cuello cremallera print",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(Icons.star, color: Colors.pink, size: 18),
                  SizedBox(width: 4),
                  Text("4.8", style: TextStyle(color: Colors.pink)),
                ],
              ),
            ),

            const SizedBox(height: 5),

            /// 🔹 PRECIO
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "\$119.000",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// 🔹 SELECT SIZE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Select Size",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ["S", "M", "L", "XL"].map((size) {
                bool isSelected = size == selectedSize;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.pink.shade50 : Colors.white,
                      border: Border.all(
                        color: isSelected ? Colors.pink : Colors.grey.shade300,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      size,
                      style: TextStyle(
                        color: isSelected ? Colors.pink : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            /// 🔹 DESCRIPCIÓN
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Experience the beauty of spring with our vestido floral. Lightweight fabric with pink blossoms, perfect for parties and sunny afternoons.",
              ),
            ),

            /// 🔹 BOTONES
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding: const EdgeInsets.symmetric(vertical: 22),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// 🔹 RECOMENDADOS
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "You might also like",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _productCard("Cazadora paño bordado", "\$339.000"),
                  _productCard("Boho Chic Maxi", "\$339.000"),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// 🔹 CARD DE PRODUCTO
  Widget _productCard(String title, String price) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Image.network(
            "https://static.bershka.net/assets/public/3d93/3a0d/45654ff28965/1b786f7c19dd/00810758500-a4o/00810758500-a4o.jpg?ts=1768550665540&w=850&f=auto",
            height: 120,
          ),
          const SizedBox(height: 10),
          Text(title),
          Text(price, style: const TextStyle(color: Colors.pink)),
        ],
      ),
    );
  }
}
