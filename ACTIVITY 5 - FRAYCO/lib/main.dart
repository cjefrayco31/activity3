import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

// ----------------- PROVIDERS -----------------
class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

class CartProvider with ChangeNotifier {
  final List<String> _items = [];
  List<String> get items => _items;
  int get count => _items.length;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }
}

class TodoProvider with ChangeNotifier {
  final List<String> _todos = [];
  List<String> get todos => _todos;

  void addTask(String task) {
    _todos.add(task);
    notifyListeners();
  }
}

// ----------------- MAIN -----------------
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => TodoProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Demo',
      themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

// ----------------- HOME PAGE -----------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final theme = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Showcase'),
        actions: [
          IconButton(
            icon: Icon(theme.isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Cart example
          Text("🛒 Cart Items: ${cart.count}",
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context
                .read<CartProvider>()
                .addItem("Flower ${cart.count + 1}"),
            child: const Text("Add Flower to Cart"),
          ),
          const Divider(),

          // Image examples
          Text("🖼 Images", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Local image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.purple, width: 3),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/flower1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Internet image
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  'https://i.imgur.com/Fxk7ZQX.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // GridView
          Text("🌸 Grid of Local Images",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemBuilder: (_, i) => Image.asset(
                'assets/images/flower${(i % 2) + 1}.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Divider(),

          // Todo list
          const TodoSection(),
        ],
      ),
    );
  }
}

// ----------------- TO-DO SECTION -----------------
class TodoSection extends StatefulWidget {
  const TodoSection({super.key});

  @override
  State<TodoSection> createState() => _TodoSectionState();
}

class _TodoSectionState extends State<TodoSection> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoProvider>().todos;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("📝 To-do List", style: Theme.of(context).textTheme.titleLarge),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration:
                    const InputDecoration(hintText: 'Add a new task...'),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.purple),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  context.read<TodoProvider>().addTask(controller.text);
                  controller.clear();
                }
              },
            ),
          ],
        ),
        ...todos.map((t) => ListTile(
              leading:
                  const Icon(Icons.check_circle_outline, color: Colors.purple),
              title: Text(t),
            )),
      ],
    );
  }
}
