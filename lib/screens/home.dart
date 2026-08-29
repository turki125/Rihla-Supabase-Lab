import 'package:flutter/material.dart';

import 'place_details.dart';

List<Map<String, dynamic>> places = [
  {
    'name': 'Hegra',
    'location': 'AlUla, Madinah Province',
    'image': 'assets/images/hegra.jpg',
    'description': 'Walk among monumental Nabataean tombs carved into sandstone at Saudi Arabia\'s first UNESCO World Heritage Site.',
    'tag': 'Ancient wonder',
    'rating': '4.9',
    'bestTime': 'October - March',
    'duration': 'Half day',
  },
  {
    'name': 'Edge of the World',
    'location': 'Tuwaiq Escarpment, Riyadh',
    'image': 'assets/images/edge_of_the_world.jpg',
    'description': 'Stand above an endless horizon where dramatic limestone cliffs fall away into the ancient ocean floor.',
    'tag': 'Epic views',
    'rating': '4.8',
    'bestTime': 'November - February',
    'duration': 'Full day',
  },
  {
    'name': 'Al-Balad',
    'location': 'Historic Jeddah, Makkah Province',
    'image': 'assets/images/al_balad.webp',
    'description': 'Discover traditional houses, wooden balconies, lively streets, and centuries of Red Sea history.',
    'tag': 'Living heritage',
    'rating': '4.7',
    'bestTime': 'November - March',
    'duration': '3-4 hours',
  },
  {
    'name': 'Rijal Almaa',
    'location': 'Asir Province',
    'image': 'assets/images/rijal_almaa.jpg',
    'description': 'Explore a mountain village of stone buildings, colorful windows, green hills, and cool highland air.',
    'tag': 'Hidden gem',
    'rating': '4.8',
    'bestTime': 'April - September',
    'duration': 'Half day',
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 0 means Discover tab. 1 means Saved tab.
  int selectedIndex = 0;

  // Stores the names of places the user bookmarks.
  final Set<String> saved = {};

  @override
  Widget build(BuildContext context) {
    final displayedPlaces = selectedIndex == 0
        ? places
        : places.where((place) {
            return saved.contains(place['name']);
          }).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(
          children: [
            Icon(Icons.explore_rounded),
            SizedBox(width: 8),
            Text('RIHLA', style: TextStyle(fontWeight: FontWeight.w900)),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedIndex == 0
                      ? 'Discover Saudi Arabia'
                      : 'Your saved journeys',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  selectedIndex == 0
                      ? 'Explore remarkable places, history, and natural beauty.'
                      : 'Keep the places that inspire your next trip.',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: displayedPlaces.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFCF7),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.bookmark_add_outlined,
                              size: 48,
                              color: Color(0xFF183B36),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No saved places yet',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Bookmark a destination from Discover to find it here.',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                    itemCount: displayedPlaces.length,
                    itemBuilder: (context, index) {
                      final place = displayedPlaces[index];
                      final isSaved = saved.contains(place['name']);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        clipBehavior: Clip.antiAlias,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              place['image'],
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).width * 0.58,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE4ECE7),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Text(
                                          place['tag'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),

                                      IconButton(
                                        tooltip: isSaved
                                            ? 'Remove from saved'
                                            : 'Save place',

                                        onPressed: () {
                                          setState(() {
                                            if (isSaved) {
                                              saved.remove(place['name']);
                                            } else {
                                              saved.add(place['name']);
                                            }
                                          });
                                        },

                                        icon: Icon(
                                          isSaved
                                              ? Icons.bookmark
                                              : Icons.bookmark_border,
                                        ),
                                      ),

                                      const Icon(
                                        Icons.star_rounded,
                                        color: Color(0xFFC97832),
                                        size: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        place['rating'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    place['name'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    place['location'],
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  SizedBox(
                                    width: double.infinity,
                                    child: FilledButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PlaceDetailsScreen(
                                                  place: place,
                                                ),
                                          ),
                                        );
                                      },
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
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Discover',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border_rounded),
            selectedIcon: Icon(Icons.bookmark_rounded),
            label: 'Saved',
          ),
        ],
      ),
    );
  }
}
