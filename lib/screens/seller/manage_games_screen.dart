import 'package:flutter/material.dart';


//M A N A G E  G A M E S ----------------------------------------------------------------------------------------------------------
class ManageGameScreen extends StatefulWidget {
  const ManageGameScreen({super.key});

  @override
  _ManageGameScreenState createState() => _ManageGameScreenState();
}

class _ManageGameScreenState extends State<ManageGameScreen> {
  final List<Map<String, String>> _games = [
    //hardcoded manage game items
    {
      'title': 'GTA',
      'description': 'A futuristic RPG with immersive storytelling.',
      'location': 'Colombo',
      'price': 'LKR 1200',
      'type': 'Sell',
      'image': 'assets/images/GTA.png',
    },
    {
      'title': 'ELDEN RING',
      'description': 'Explore magical lands and uncover hidden secrets.',
      'location': 'Kandy',
      'price': 'LKR 950',
      'type': 'Rent',
      'image': 'assets/images/elden_ring.png',
    },
    {
      'title': 'CALL OF DUTY',
      'description': 'Explore magical lands and uncover hidden secrets.',
      'location': 'Kandy',
      'price': 'LKR 950',
      'type': 'Rent',
      'image': 'assets/images/cod.png',
    },
    {
      'title': 'FARCRY6',
      'description': 'Explore magical lands and uncover hidden secrets.',
      'location': 'Kandy',
      'price': 'LKR 950',
      'type': 'Rent',
      'image': 'assets/images/farcry.png',
    },
  
  ];
//remove from the list
  void _removeGame(int index) {
    setState(() {
      _games.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Games', style: TextStyle(fontFamily: 'Anton')),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDarkMode
                  ? [Colors.deepPurple, Colors.black87]
                  : [Colors.blueAccent.shade100, Colors.purpleAccent.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Colors.black87, Colors.deepPurple.shade900]
                : [Colors.blue.shade50, Colors.purple.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _games.isEmpty
            ? Center(
                child: Text(
                  'No games available.',
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _games.length,
                itemBuilder: (context, index) {
                  final game = _games[index];
                  return _buildGameCard(game, index);
                },
              ),
      ),
    );
  }
//game card desplay 
  Widget _buildGameCard(Map<String, String> game, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade300, Colors.blue.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              game['image']!,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  game['description']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 4),
                Text('Location: ${game['location']}', style: const TextStyle(color: Colors.white70)),
                Text('Price: ${game['price']}', style: const TextStyle(color: Colors.white70)),
                Text('Type: ${game['type']}', style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  // Implement edit functionality
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () => _removeGame(index),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
