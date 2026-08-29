import 'package:flutter/material.dart';

List<Map<String, dynamic>> places = [

  {
    "name": "Hegra",
    "location": "AlUla, Madinah Province",
    "image": "assets/images/hegra.jpg",
    "description":
        "Walk among monumental Nabataean tombs carved into sandstone at Saudi Arabia's first UNESCO World Heritage Site.",
    "tag": "Ancient wonder",
    "rating": "4.9",
    "bestTime": "October - March",
    "duration": "Half day",
  },


  {
    "name": "Edge of the World",
    "location": "Tuwaiq Escarpment, Riyadh",
    "image": "assets/images/edge_of_the_world.jpg",
    "description":
        "Stand above an endless horizon where dramatic limestone cliffs fall away into the ancient ocean floor.",
    "tag": "Epic views",
    "rating": "4.8",
    "bestTime": "November - February",
    "duration": "Full day",
  },


  {
    "name": "Al-Balad",
    "location": "Historic Jeddah, Makkah Province",
    "image": "assets/images/al_balad.webp",
    "description":
        "Discover traditional houses, wooden balconies, lively streets, and centuries of Red Sea history.",
    "tag": "Living heritage",
    "rating": "4.7",
    "bestTime": "November - March",
    "duration": "3-4 hours",
  },


  {
    "name": "Rijal Almaa",
    "location": "Asir Province",
    "image": "assets/images/rijal_almaa.jpg",
    "description":
        "Explore a mountain village of stone buildings, colorful windows, green hills, and cool highland air.",
    "tag": "Hidden gem",
    "rating": "4.8",
    "bestTime": "April - September",
    "duration": "Half day",
  },

];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  // The top bar of the screen.
  appBar: AppBar(
    backgroundColor: Colors.transparent,

    // Row puts the icon and app name side by side.
    title: const Row(
      children: [
        Icon(Icons.explore_rounded),

        // Creates space between the icon and "RIHLA".
        SizedBox(width: 8),

        Text(
          'RIHLA',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    ),
  ),

  // ListView.builder creates one scrolling card for each place.
  body: ListView.builder(
    // Space around the complete list.
    padding: const EdgeInsets.all(18),

    // Number of destination cards to create.
    itemCount: places.length,

    // Runs once for every place in the list.
    itemBuilder: (context, index) {
      // Gets the current map: Hegra, Edge of the World, etc.
      final place = places[index];

      return Container(
        // Space underneath each card.
        margin: const EdgeInsets.only(bottom: 20),

        // Ensures the image follows the rounded card corners.
        clipBehavior: Clip.antiAlias,

        // Controls card color, rounded corners, and shadow.
        decoration: BoxDecoration(
          color: const Color(0xFFFFFCF7),

          borderRadius: BorderRadius.circular(24),

          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
          ],
        ),

        // Column puts the image above the text and button.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Loads the image path from the current place map.
            Image.asset(
              place['image'],

              // Makes the image fill the card width.
              width: double.infinity,

              // Changes image height depending on phone width.
              height: MediaQuery.sizeOf(context).width * 0.58,

              // Crops the image without stretching it.
              fit: BoxFit.cover,
            ),

            // Adds space around the title, location, and button.
            Padding(
              padding: const EdgeInsets.all(18),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // Destination name, for example: Hegra.
                  Text(
                    place['name'],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 6),

                  // Destination location, for example: AlUla.
                  Text(
                    place['location'],
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Makes the Explore button take the full card width.
                  SizedBox(
                    width: double.infinity,

                    child: FilledButton(
                      // We will add navigation in the next step.
                      onPressed: () {},

                      child: const Text('Explore'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  ),
);
  }
  
}