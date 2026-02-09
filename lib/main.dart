import 'package:flutter/material.dart';

void main() {
  runApp(const DaveFlexxApp());
}

class DaveFlexxApp extends StatelessWidget {
  const DaveFlexxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dave Flexx',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  final screens = const [
    LiveTVScreen(),
    RadioScreen(),
    SeriesScreen(),
    AnimeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dave Flexx 🇿🇦')),
      body: screens[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.tv), label: 'Live TV'),
          NavigationDestination(icon: Icon(Icons.radio), label: 'Radio'),
          NavigationDestination(icon: Icon(Icons.movie), label: 'Series'),
          NavigationDestination(icon: Icon(Icons.animation), label: 'Anime'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class LiveTVScreen extends StatelessWidget {
  const LiveTVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ChannelCard(title: 'SABC News', subtitle: 'Official Live Stream'),
        ChannelCard(title: 'eNCA', subtitle: 'News Live'),
        ChannelCard(title: 'Newzroom Afrika', subtitle: 'Live'),
      ],
    );
  }
}

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ChannelCard(title: 'Metro FM', subtitle: 'Radio Live'),
        ChannelCard(title: 'Ukhozi FM', subtitle: 'Zulu Radio'),
        ChannelCard(title: 'Power FM', subtitle: 'Talk Radio'),
      ],
    );
  }
}

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Series coming soon 🎬', style: TextStyle(fontSize: 18)),
    );
  }
}

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Anime coming soon 🔥', style: TextStyle(fontSize: 18)),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.star, size: 80, color: Colors.amber),
          SizedBox(height: 12),
          Text('Founder Account', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text('Premium: Active'),
          Text('Ads: Disabled'),
        ],
      ),
    );
  }
}

class ChannelCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const ChannelCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.play_circle_fill),
        onTap: () {},
      ),
    );
  }
}

