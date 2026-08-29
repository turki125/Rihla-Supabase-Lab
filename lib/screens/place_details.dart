import 'package:flutter/material.dart';

// This screen receives one destination map from the home screen.
class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});

  // Stores the selected destination data.
  // Example: Hegra map, including its name, image, and description.
  final Map<String, dynamic> place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place['name'])),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          // Shows the destination image.
          ClipRRect(
            borderRadius: BorderRadius.circular(24),

            child: Image.asset(
              place['image'],

              width: double.infinity,

              height: MediaQuery.sizeOf(context).width * 0.65,

              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 24),

          // Shows the destination name.
          Text(
            place['name'],
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          const SizedBox(height: 8),

          // Shows the destination location with an icon.
          Row(
            children: [
              const Icon(Icons.location_on_outlined),

              const SizedBox(width: 6),

              Text(place['location']),
            ],
          ),

          const SizedBox(height: 24),

          // Section title.
          Text('The story', style: Theme.of(context).textTheme.titleLarge),

          const SizedBox(height: 10),

          // Shows the description from the map.
          Text(
            place['description'],
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 26),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFCF7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.calendar_month_outlined),

                      const SizedBox(height: 12),

                      Text(
                        'Best time',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        place['bestTime'],
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFCF7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.schedule_rounded),

                      const SizedBox(height: 12),

                      Text(
                        'Ideal visit',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        place['duration'],
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // A creative button for the second screen.
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${place['name']} added to your dream trip!'),
                  ),
                );
              },

              icon: const Icon(Icons.luggage_rounded),

              label: const Text('Add to dream trip'),
            ),
          ),
        ],
      ),
    );
  }
}
