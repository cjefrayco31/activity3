import 'package:flutter/material.dart';

void main() {
  runApp(const FlowerShopApp());
}

class FlowerShopApp extends StatelessWidget {
  const FlowerShopApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFFF3E5F5),
        cardTheme: ThemeData().cardTheme.copyWith(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.purple, width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
          ),
        ),
      ),
      home: const RegistrationPage(),
    );
  }
}

// ---------------- REGISTRATION PAGE ----------------
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void register() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade300, Colors.purple.shade100],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.local_florist,
                              size: 60, color: Colors.purple),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Join us for beautiful flowers",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 24),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            prefixIcon:
                                Icon(Icons.person, color: Colors.purple),
                          ),
                          validator: (v) =>
                              v == null || v.isEmpty ? "Enter your name" : null,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email, color: Colors.purple),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty)
                              return "Enter your email";
                            if (!v.contains("@")) return "Enter valid email";
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock, color: Colors.purple),
                          ),
                          validator: (v) =>
                              v != null && v.length < 6 ? "Min 6 chars" : null,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: confirmController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            prefixIcon:
                                Icon(Icons.lock_outline, color: Colors.purple),
                          ),
                          validator: (v) => v != passwordController.text
                              ? "Passwords don't match"
                              : null,
                        ),
                        SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: register,
                            child: Text("Register",
                                style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- LOGIN PAGE ----------------
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade300, Colors.purple.shade100],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.local_florist,
                              size: 60, color: Colors.purple),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Login to your account",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 24),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email, color: Colors.purple),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty)
                              return "Enter your email";
                            if (!v.contains("@")) return "Invalid email";
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock, color: Colors.purple),
                          ),
                          validator: (v) => v == null || v.length < 6
                              ? "Password too short"
                              : null,
                        ),
                        SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: login,
                            child:
                                Text("Login", style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- HOME PAGE WITH BOTTOM NAV ----------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = [
    const BookingPage(),
    const ServicesPage(),
    const AppointmentListPage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  void logout() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Flower Shop", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade300, Colors.purple.shade400],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: logout,
            icon: Icon(Icons.logout),
            tooltip: "Logout",
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.purple.shade600,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Order"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_florist), label: "Flowers"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Orders"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

// ---------------- BOOKING PAGE ----------------
class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  bool isFirstTime = false;
  bool smsReminder = false;

  String? selectedService;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final List<String> services = [
    "Rose Bouquet",
    "Tulip Arrangement",
    "Sunflower Bundle",
    "Mixed Flowers",
    "Wedding Package",
  ];

  void saveBooking() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        selectedService == null ||
        selectedDate == null ||
        selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all required fields"),
          backgroundColor: Colors.red.shade400,
        ),
      );
      return;
    }

    AppointmentData.appointments.add({
      "name": nameController.text,
      "email": emailController.text,
      "service": selectedService!,
      "date":
          "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
      "time": selectedTime!.format(context),
      "firstTime": isFirstTime ? "Yes" : "No",
      "smsReminder": smsReminder ? "Yes" : "No",
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Booking Saved Successfully!"),
        backgroundColor: Colors.green.shade400,
      ),
    );

    nameController.clear();
    emailController.clear();
    setState(() {
      selectedService = null;
      selectedDate = null;
      selectedTime = null;
      isFirstTime = false;
      smsReminder = false;
    });
  }

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Colors.pink),
          ),
          child: child!,
        );
      },
    );
    if (date != null) setState(() => selectedDate = date);
  }

  Future<void> pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Colors.pink),
          ),
          child: child!,
        );
      },
    );
    if (time != null) setState(() => selectedTime = time);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Book Your Appointment",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade700,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: selectedService,
                  items: services
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (v) => setState(() => selectedService = v),
                  decoration: InputDecoration(
                    labelText: "Service",
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.pink),
                title: Text(selectedDate == null
                    ? "Select Date"
                    : "Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: pickDate,
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.access_time, color: Colors.pink),
                title: Text(selectedTime == null
                    ? "Select Time"
                    : "Time: ${selectedTime!.format(context)}"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: pickTime,
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              CheckboxListTile(
                value: isFirstTime,
                onChanged: (v) => setState(() => isFirstTime = v!),
                title: Text("First-time Client"),
                secondary: Icon(Icons.new_releases, color: Colors.pink),
                activeColor: Colors.pink,
              ),
              Divider(height: 1),
              SwitchListTile(
                value: smsReminder,
                onChanged: (v) => setState(() => smsReminder = v),
                title: Text("Send SMS Reminder"),
                secondary: Icon(Icons.sms, color: Colors.pink),
                activeColor: Colors.pink,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: saveBooking,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text("Save Booking", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

// ---------------- APPOINTMENTS LIST ----------------
class AppointmentListPage extends StatelessWidget {
  const AppointmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (AppointmentData.appointments.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today_outlined,
                size: 80, color: Colors.grey.shade400),
            SizedBox(height: 16),
            Text(
              "No appointments yet",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: AppointmentData.appointments.length,
      itemBuilder: (context, index) {
        final a = AppointmentData.appointments[index];
        return Card(
          margin: EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purple.shade100,
                      child: Icon(Icons.person, color: Colors.purple),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            a["name"]!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            a["email"]!,
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(height: 20),
                Row(
                  children: [
                    Icon(Icons.local_florist,
                        size: 16, color: Colors.purple.shade300),
                    SizedBox(width: 8),
                    Text(a["service"]!,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today,
                        size: 16, color: Colors.purple.shade300),
                    SizedBox(width: 8),
                    Text("${a["date"]} at ${a["time"]}"),
                  ],
                ),
                if (a["firstTime"] == "Yes") ...[
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "First-time client",
                      style: TextStyle(
                          fontSize: 12, color: Colors.purple.shade700),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

// ---------------- SERVICES PAGE ----------------
class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      "name": "Classic Rose Bouquet",
      "price": "₱1500",
      "icon": Icons.local_florist,
      "color": Color(0xFFBA68C8),
      "description": "Beautiful red roses arrangement",
    },
    {
      "name": "Tulip Collection",
      "price": "₱2000",
      "icon": Icons.yard,
      "color": Color(0xFFAB47BC),
      "description": "Colorful tulip arrangement",
    },
    {
      "name": "Sunflower Bundle",
      "price": "₱1200",
      "icon": Icons.wb_sunny,
      "color": Color(0xFF9C27B0),
      "description": "Bright sunflower arrangement",
    },
    {
      "name": "Mixed Seasonal",
      "price": "₱1800",
      "icon": Icons.eco,
      "color": Color(0xFF8E24AA),
      "description": "Mix of seasonal flowers",
    },
    {
      "name": "Wedding Package",
      "price": "₱5000",
      "icon": Icons.favorite,
      "color": Color(0xFF7B1FA2),
      "description": "Complete wedding flower set",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Card(
          margin: EdgeInsets.only(bottom: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  service["color"].withOpacity(0.1),
                  Colors.white,
                ],
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: service["color"].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  service["icon"],
                  color: service["color"],
                  size: 32,
                ),
              ),
              title: Text(
                service["name"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    service["description"],
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    service["price"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: service["color"],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ---------------- SETTINGS PAGE ----------------
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.purple),
                title: Text("Notifications"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.language, color: Colors.purple),
                title: Text("Language"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.help, color: Colors.purple),
                title: Text("Help & Support"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.info, color: Colors.purple),
                title: Text("About"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------- DATA HOLDER ----------------
class AppointmentData {
  static List<Map<String, String>> appointments = [];
}
