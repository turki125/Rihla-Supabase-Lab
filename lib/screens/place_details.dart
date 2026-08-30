import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({
    super.key,
    required this.place,
    required this.onSave,
  });

  final Map<String, dynamic> place;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place['name']),
        backgroundColor: const Color(0xFF3D2A20),
        foregroundColor: const Color(0xFFFFF9F3),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
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

          Text(
            place['name'],
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          const SizedBox(height: 8),

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
                    color: const Color(0xFFFFF9F3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE0D0BF)),
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
                    color: const Color(0xFFFFF9F3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE0D0BF)),
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

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                onSave();
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
