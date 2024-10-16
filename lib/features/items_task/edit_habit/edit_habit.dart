import 'package:flutter/material.dart';
import 'package:habit_tracker/features/core/themes/colors.dart';

class EditHabitItem extends StatefulWidget {
  const EditHabitItem({super.key});

  @override
  State<EditHabitItem> createState() => _EditHabitItemState();
}

class _EditHabitItemState extends State<EditHabitItem> {
  TextEditingController habitNameController = TextEditingController();
  List<bool> selectedDays = [false, false, false, false, false, false, false];
  Color? selectedColor;
  Image? selectedIcon;
  TextStyle textStyle = const TextStyle(fontSize: 16, color: Colors.white);

  final List<Color> habitColors = [
    Colors.pink[100]!,
    Colors.purple[100]!,
    Colors.green[100]!,
    Colors.yellow[100]!,
    Colors.orange[100]!,
    Colors.blue[100]!,
  ];

  final List<Image> habitIcons = [
    icons("assets/HabitIcons/athkar.png"),
    icons("assets/HabitIcons/baking.png"),
    icons("assets/HabitIcons/books.png"),
    icons("assets/HabitIcons/care.png"),
    icons("assets/HabitIcons/cooking.png"),
    icons("assets/HabitIcons/design.png"),
    icons("assets/HabitIcons/garden.png"),
    icons("assets/HabitIcons/journel.png"),
    icons("assets/HabitIcons/medidate.png"),
    icons("assets/HabitIcons/night.png"),
    icons("assets/HabitIcons/picnic.png"),
    icons("assets/HabitIcons/Quran.png"),
    icons("assets/HabitIcons/reading.png"),
    icons("assets/HabitIcons/spa.png"),
    icons("assets/HabitIcons/sport.png"),
    icons("assets/HabitIcons/walking.png"),
    icons("assets/HabitIcons/writing.png"),
    icons("assets/HabitIcons/water.png"),
    icons("assets/HabitIcons/yoga.png"),
  ];

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildCustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(widthSize * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom AppBar
              SizedBox(height: heightSize * 0.03),
              TextFormField(
                controller: habitNameController,
                decoration: const InputDecoration(
                  labelText: 'Habit Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: heightSize * 0.03),
              Text(
                'Repeat Days in the Week',
                style: textStyle,
              ),
              SizedBox(height: heightSize * 0.01),
              Wrap(
                spacing: 10.0,
                children: List.generate(7, (index) {
                  return FilterChip(
                    label: Text([
                      'Sat',
                      'Sun',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri'
                    ][index]),
                    selected: selectedDays[index],
                    onSelected: (bool selected) {
                      setState(() {
                        selectedDays[index] = selected;
                      });
                    },
                  );
                }),
              ),
              SizedBox(height: heightSize * 0.019),
              Text(
                'Habit Color (Customize)',
                style: textStyle,
              ),
              SizedBox(height: heightSize * 0.01),
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
                          ? const Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: heightSize * 0.019),
              Text(
                'Habit Icon (Customize)',
                style: textStyle,
              ),
              SizedBox(height: heightSize * 0.01),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      child: Center(child: habitIcons[index]),
                    ),
                  );
                },
              ),
              SizedBox(height: heightSize * 0.019),
              ElevatedButton.icon(
                onPressed: () {
                  // Add your save habit logic here
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white, // Change the icon color to white
                ),
                label: Text('Edit Your Habit', style: textStyle),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildCustomAppBar() {
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;

    return PreferredSize(
      preferredSize: Size.fromHeight(heightSize * 0.2),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(47),
          ),
        ),
        padding: EdgeInsets.only(
          left: widthSize * 0.0,
          top: heightSize * 0.02,
          bottom: heightSize * 0.05,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(height: 18,),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back,size: 30,color: AppColors.textColor,),
                ),
              ],
            ),
            Container(
              width:290,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Hello Ahmed !',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    "Edit your habit to perfect your ideal routine.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Image icons(String assetImage) {
  return Image(
    image: AssetImage(assetImage),
    width: 30,
  );
}