import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time Movies (Task 5)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/add'),
          ),
        ],
      ),
      // Real-time updates માટે StreamBuilder નો ઉપયોગ
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Movies')
            .orderBy('createdAt', descending: true)
            .snapshots(), // snapshots() વગર real-time અપડેટ ન મળે
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('કંઈક ભૂલ થઈ છે...'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('હજુ સુધી કોઈ મુવી ઉમેરવામાં આવી નથી.'));
          }

          final movies = snapshot.data!.docs;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              final data = movie.data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(
                    data['title'] ?? 'No Title',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${data['genre'] ?? 'N/A'} • ${data['rating'] ?? 0} Stars'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => movie.reference.delete(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
