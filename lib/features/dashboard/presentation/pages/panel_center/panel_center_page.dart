import 'package:flutter/material.dart';
import 'package:portfolio_admin_panel/core/constants/palette.dart';
import 'package:portfolio_admin_panel/core/constants/sizes.dart';
import 'package:portfolio_admin_panel/features/dashboard/presentation/pages/panel_center/linear_graph.dart';
import 'package:portfolio_admin_panel/widgets/cards/custom_card.dart';

class Person {
  String name;
  Color color;
  Person({required this.name, required this.color});
}

class PanelCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Person> persons = [
      Person(name: "Theia Bowen", color: const Color(0xfff8b250)),
      Person(name: "Fariha Odling", color: const Color(0xffff5182)),
      Person(name: "Viola Willis", color: const Color(0xff0293ee)),
      Person(name: "Emmett Forrest", color: const Color(0xfff8b250)),
      Person(name: "Nick Jarvis", color: const Color(0xff13d38e)),
      Person(name: "ThAmit Clayeia", color: const Color(0xfff8b250)),
      Person(name: "ThAmalie Howardeia", color: const Color(0xffff5182)),
      Person(name: "Campbell Britton", color: const Color(0xff0293ee)),
      Person(name: "Haley Mellor", color: const Color(0xffff5182)),
      Person(name: "Harlen Higgins", color: const Color(0xff13d38e)),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: AppSizes.kPadding / 2,
                right: AppSizes.kPadding / 2,
                left: AppSizes.kPadding / 2),
            child: CustomCard(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const SizedBox(
                width: double.infinity,
                child: ListTile(
                  //leading: Icon(Icons.sell),
                  title: Text(
                    "Products Available",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "82% of Products Avail.",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Chip(
                    label: Text(
                      "20,500",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          BarChartSample2(),
          Padding(
            padding: const EdgeInsets.only(
                top: AppSizes.kPadding,
                left: AppSizes.kPadding / 2,
                right: AppSizes.kPadding / 2,
                bottom: AppSizes.kPadding),
            child: CustomCard(
              child: Column(
                children: List.generate(
                  persons.length,
                      (index) => ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: persons[index].color,
                      child: Text(
                        persons[index].name.substring(0, 1),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      persons[index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.message,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
