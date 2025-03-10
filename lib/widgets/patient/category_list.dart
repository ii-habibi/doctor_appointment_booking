import 'package:doctor_appointments/screens/patient/doctor_selection/selected_category.dart';
import 'package:flutter/material.dart';
import '../../screens/patient/doctor_selection/all_doctor_categories.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  List<Map<String, dynamic>> categories = [
    {"icon": "assets/icons/neurology.png", "label": "Neurologist"},
    {"icon": "assets/icons/cardiology.png", "label": "Cardiology"},
    {"icon": "assets/icons/dermatologist.png", "label": "Dermatologist"},
    {"icon": "assets/icons/psychiatrist.png", "label": "Psychiatrist"},
    {"icon": "assets/icons/gynecologist.png", "label": "Gynecologist"},
    {"icon": "assets/icons/oncology.png", "label": "Oncologist"},
    {"icon": "assets/icons/pediatric.png", "label": "Pediatrician"},
    {"icon": "assets/icons/nephrologist.png", "label": "Nephrologist"},
    {"icon": "assets/icons/hematologist.png", "label": "Hematologist"},
    {"icon": "assets/icons/ophthalmology.png", "label": "Ophthalmologist"},
    {"icon": "assets/icons/gastroenterologist.png", "label": "Gastroenterologist"},
    {"icon": "assets/icons/urology.png", "label": "Urologist"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 155,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Category",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AllDoctorCategoriesScreen()));
            },
            child: Text("View all"),
          ),
        ]),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final item = categories[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorSelectionScreen(
                    selectedCategory: item["label"],
                  )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      Hero(
                        tag: item["label"],
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            item["icon"],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(item['label']),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
