import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: NewHabitScreen(),
    );
  }
}

class NewHabitScreen extends StatefulWidget {
  @override
  _NewHabitScreenState createState() => _NewHabitScreenState();
}

class _NewHabitScreenState extends State<NewHabitScreen> {
  TextEditingController habitNameController = TextEditingController();
  List<bool> selectedDays = [false, false, false, false, false, false, false];
  Color? selectedColor;
  String? selectedIcon;

  final List<Color> habitColors = [
    Colors.pink[100]!,
    Colors.purple[100]!,
    Colors.green[100]!,
    Colors.yellow[100]!,
    Colors.orange[100]!,
    Colors.blue[100]!,
  ];

  final List<String> habitIcons = [
    '📖', '🌿', '🏋️', '🎨', '💼', '💤', '🎧', '📚', '📅', '🎯',
    '🎉', '🎲', '🎸', '🎮', '🎤', '🎹', '🎺', '🎻', '🏈', '🏀',
    // Add more icons as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom AppBar
              _buildCustomAppBar(context),
              SizedBox(height: 20),
              TextField(
                controller: habitNameController,
                decoration: InputDecoration(
                  labelText: 'Habit Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Repeat Days in the Week',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10.0,
                children: List.generate(7, (index) {
                  return FilterChip(
                    label: Text(
                        ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'][index]
                    ),
                    selected: selectedDays[index],
                    onSelected: (bool selected) {
                      setState(() {
                        selectedDays[index] = selected;
                      });
                    },
                  );
                }),
              ),
              SizedBox(height: 20),
              Text(
                'Habit Color (Customize)',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10.0,
                children: habitColors.map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: color,
                      child: selectedColor == color
                          ? Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Habit Icon (Customize)',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: habitIcons.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIcon = habitIcons[index];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedIcon == habitIcons[index]
                              ? Colors.purple
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          habitIcons[index],
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  // Add your save habit logic here
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white, // Change the icon color to white
                ),
                label: Text(
                  'Add New Habit',
                  style: TextStyle(
                    color: Colors.white, // Change the label text color to white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: Size(double.infinity, 50),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;

    return PreferredSize(
      preferredSize: Size.fromHeight(heightSize * 0.2),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(47),
          ),
        ),
        padding: EdgeInsets.only(
          left: widthSize * 0.05,
          top: heightSize * 0.02,
          bottom: heightSize * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Hello, User!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              "Track your habits and stay organized in your daily routine.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
