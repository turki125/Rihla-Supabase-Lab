import 'package:flutter/material.dart';

import '../data/place_data.dart';
import '../models/place_model.dart';
import 'place_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 0 means Discover tab. 1 means Saved tab.
  int selectedIndex = 0;
  String query = '';

  // Stores the names of places the user bookmarks.
  final Set<String> saved = {};
  final TextEditingController searchController = TextEditingController();
  final List<PlaceModel> places = [];

  void getData() {
    places.addAll(placesData.map(PlaceModel.fromJson));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayedPlaces = places.where((place) {
      final isInSelectedTab = selectedIndex == 0 || saved.contains(place.name);
      final searchableText = '${place.name} ${place.location}'.toLowerCase();
      return isInSelectedTab && searchableText.contains(query.toLowerCase());
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
                const SizedBox(height: 20),
                TextField(
                  controller: searchController,
                  onChanged: (value) => setState(() => query = value),
                  decoration: InputDecoration(
                    hintText: 'Search a place or region',
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFF52634D),
                    ),
                    suffixIcon: query.isEmpty
                        ? null
                        : IconButton(
                            tooltip: 'Clear search',
                            onPressed: () {
                              searchController.clear();
                              setState(() => query = '');
                            },
                            icon: const Icon(Icons.close_rounded),
                          ),
                    filled: true,
                    fillColor: const Color(0xFFFFF9F3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFD8C8B6)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFD8C8B6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0xFFB9653C),
                        width: 2,
                      ),
                    ),
                  ),
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
                          color: const Color(0xFFFFF9F3),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              query.isEmpty
                                  ? Icons.bookmark_add_outlined
                                  : Icons.search_off_rounded,
                              size: 48,
                              color: Color(0xFF3D2A20),
                            ),
                            SizedBox(height: 16),
                            Text(
                              query.isEmpty
                                  ? 'No saved places yet'
                                  : 'No places found',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              query.isEmpty
                                  ? 'Bookmark a destination from Discover to find it here.'
                                  : 'Try a different destination name or region.',
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
                      final isSaved = saved.contains(place.name);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF9F3),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x183D2A20),
                              blurRadius: 22,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              place.image,
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
                                          color: const Color(0xFFDFE8DA),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Text(
                                          place.tag,
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
                                              saved.remove(place.name);
                                            } else {
                                              saved.add(place.name);
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
                                        color: Color(0xFFB9653C),
                                        size: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        place.rating,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    place.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    place.location,
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
                                                  onSave: () {
                                                    setState(() {
                                                      saved.add(place.name);
                                                    });
                                                  },
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
