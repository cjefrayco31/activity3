import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower Shop Navigation Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      // Named routes
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/contact': (context) => const ContactScreen(),
      },
    );
  }
}

// ---------------- LOGIN SCREEN ----------------
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.local_florist, color: Colors.purple, size: 60),
                const SizedBox(height: 20),
                const Text("Welcome to Flower Shop",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  icon: const Icon(Icons.login),
                  label: const Text("Login"),
                  onPressed: () {
                    // Using pushReplacement to remove Login from stack
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- HOME SCREEN ----------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _bottomIndex = 0;
  late TabController _tabController;

  final List<Widget> _bottomPages = const [
    HomeTabPage(),
    ProfileTabPage(),
    SettingsTabPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _onBottomTapped(int index) {
    setState(() => _bottomIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flower Shop Home'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.chat), text: "Chats"),
            Tab(icon: Icon(Icons.favorite), text: "Status"),
            Tab(icon: Icon(Icons.call), text: "Calls"),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple.shade300),
              child: const Center(
                child: Text("Flower Shop Menu",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About"),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text("Contact"),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                // Using push() (stack keeps Login)
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text("Chats Tab")),
          Center(child: Text("Status Tab")),
          Center(child: Text("Calls Tab")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomIndex,
        onTap: _onBottomTapped,
        selectedItemColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

// ---------------- TABBED SCREENS (Bottom Navigation Pages) ----------------
class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Welcome to the Home Tab", style: TextStyle(fontSize: 18)),
    );
  }
}

class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile Information", style: TextStyle(fontSize: 18)),
    );
  }
}

class SettingsTabPage extends StatelessWidget {
  const SettingsTabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Settings and Preferences", style: TextStyle(fontSize: 18)),
    );
  }
}

// ---------------- ABOUT PAGE (Named Route) ----------------
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: const Center(
        child: Text(
          "This app demonstrates Flutter navigation techniques.",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// ---------------- CONTACT PAGE (Named Route) ----------------
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact")),
      body: const Center(
        child: Text(
          "Contact us at: flowershop@example.com",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
