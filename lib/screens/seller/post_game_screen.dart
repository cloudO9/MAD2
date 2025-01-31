import 'package:flutter/material.dart';

//P O S T  G A M E S ---------------------------------------------------------------------------------------------------------------
class PostGameScreen extends StatefulWidget {
  const PostGameScreen({super.key});

  @override
  _PostGameScreenState createState() => _PostGameScreenState();
}

class _PostGameScreenState extends State<PostGameScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  String _sellOrRent = 'Sell';

  final List<Map<String, String>> _games = [
    {
      'title': 'Cyber Quest',
      'description': 'A futuristic RPG with immersive storytelling.',
      'location': 'Colombo',
      'sellOrRent': 'Sell',
      'image': 'assets/images/GTA.png',
    },
    {
      'title': 'Mystic Lands',
      'description': 'Explore magical lands and uncover secrets.',
      'location': 'Kandy',
      'sellOrRent': 'Rent',
      'image': 'assets/images/elden_ring.png',
    },
  ];

  void _submitGame() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _games.add({
          'title': _titleController.text,
          'description': _descriptionController.text,
          'location': _locationController.text,
          'sellOrRent': _sellOrRent,
          'image': 'assets/images/pokimon.png',
        });
      });
      _titleController.clear();
      _descriptionController.clear();
      _locationController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Colors.black87, Colors.deepPurple.shade900]
                : [Colors.purple.shade200, Colors.indigo.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField(
                            controller: _titleController,
                            label: 'Game Title',
                            hint: 'Enter the game title',
                            icon: Icons.videogame_asset,
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            controller: _descriptionController,
                            label: 'Description',
                            hint: 'Describe the game',
                            icon: Icons.description,
                            maxLines: 3,
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            controller: _locationController,
                            label: 'Location',
                            hint: 'Enter the location',
                            icon: Icons.location_on,
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField(
                            value: _sellOrRent,
                            items: const [
                              DropdownMenuItem(value: 'Sell', child: Text('Sell')),
                              DropdownMenuItem(value: 'Rent', child: Text('Rent')),
                            ],
                            decoration: InputDecoration(
                              labelText: 'Sell or Rent',
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onChanged: (value) => setState(() => _sellOrRent = value!),
                          ),
                          const SizedBox(height: 24),

                          ElevatedButton(
                            onPressed: _submitGame,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent,
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 8,
                            ),
                            child: const Text('Post Game', style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(height: 24),

                          if (_games.isNotEmpty) ...[
                            const Text(
                              'Posted Games:',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            ..._games.map((game) => _buildGameCard(game)).toList(),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.purpleAccent),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      maxLines: maxLines,
      validator: (value) => value!.isEmpty ? 'Please enter $label' : null,
    );
  }

  Widget _buildGameCard(Map<String, String> game) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
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
                Text('Title: ${game['title']}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Description: ${game['description']}', style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 4),
                Text('Location: ${game['location']}', style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 4),
                Text('Type: ${game['sellOrRent']}', style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
