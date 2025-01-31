import 'package:flutter/material.dart';

//S U B S C R I P T I O N  S C R E E N ----------------------------------------------------------------------------------------------------
class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, String>> plans = [
      {
        'title': 'Basic Plan',
        'price': '\$10/month',
        'features': 'Post up to 5 games\nStandard visibility',
      },
      {
        'title': 'Pro Plan',
        'price': '\$20/month',
        'features': 'Post unlimited games\nIncreased visibility\nPriority support',
      },
      {
        'title': 'Elite Plan',
        'price': '\$50/month',
        'features': 'Post unlimited games\nTop visibility on the platform\n24/7 dedicated support',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Plans', style: TextStyle(fontFamily: 'Anton')),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDarkMode
                  ? [Colors.black87, Colors.deepPurple]
                  : [Colors.purple.shade200, Colors.blue.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Colors.deepPurple.shade900, Colors.black87]
                : [Colors.blue.shade100, Colors.purple.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: plans.length,
          itemBuilder: (context, index) {
            final plan = plans[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: isDarkMode
                      ? [Colors.deepPurple.shade700, Colors.black54]
                      : [Colors.purple.shade300, Colors.blue.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode ? Colors.purpleAccent.withOpacity(0.3) : Colors.black26,
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan['title']!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    plan['price']!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    plan['features']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _subscribe(context, plan['title']!);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: const Text('Subscribe Now', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _subscribe(BuildContext context, String planTitle) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Subscription Confirmation'),
          content: Text('You have selected the $planTitle.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/post_game_screen');
              },
              child: const Text('Confirm Subscription'),
            ),
          ],
        );
      },
    );
  }
}
