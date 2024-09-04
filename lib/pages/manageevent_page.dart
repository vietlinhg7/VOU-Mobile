import 'package:flutter/material.dart';
import 'package:untitled/class/event.dart';

class ManageEventPage extends StatefulWidget {
  final List<Event> events;

  const ManageEventPage({super.key, required this.events});

  @override
  State<ManageEventPage> createState() => _ManageEventPageState();
}

class _ManageEventPageState extends State<ManageEventPage> {
  final Set<int> favoriteEvents = {};
  final Set<int> joinedEvents = {};

  void _toggleFavorite(int eventId) {
    setState(() {
      if (favoriteEvents.contains(eventId)) {
        favoriteEvents.remove(eventId);
      } else {
        favoriteEvents.add(eventId);
      }
    });
  }

  void _joinEvent(int eventId) {
    setState(() {
      joinedEvents.add(eventId);
    });

    // Show a confirmation dialog or message
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Event Joined'),
          content: const Text('You have successfully joined the event.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tổng hợp sự kiện'),
      ),
      body: ListView.builder(
        itemCount: widget.events.length,
        itemBuilder: (context, index) {
          final event = widget.events[index];
          final isFavorite = favoriteEvents.contains(event.id);
          final isJoined = joinedEvents.contains(event.id);

          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(
                  event.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(event.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Số lượng: ${event.vouchers}'),
                  Text('Bắt đầu: ${event.startTime.toString().split(' ')[0]}'),
                  Text('Kết thúc: ${event.endTime.toString().split(' ')[0]}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () => _toggleFavorite(event.id),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Chơi'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
