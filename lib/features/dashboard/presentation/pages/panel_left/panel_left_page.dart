import 'package:flutter/material.dart';
import 'package:portfolio_admin_panel/core/constants/palette.dart';
import 'package:portfolio_admin_panel/core/constants/sizes.dart';
import 'package:portfolio_admin_panel/features/dashboard/presentation/pages/panel_left/circle_graph.dart';
import 'package:portfolio_admin_panel/features/dashboard/presentation/pages/panel_left/curved_chart.dart';
import 'package:portfolio_admin_panel/responsive_layout.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  final List<Todo> _todos = [
    Todo(name: "Purchase Paper", enable: true),
    Todo(name: "Refill the inventory of speakers", enable: true),
    Todo(name: "Hire someone", enable: true),
    Todo(name: "Maketing Strategy", enable: true),
    Todo(name: "Selling furniture", enable: true),
    Todo(name: "Finish the disclosure", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: AppColors.purpleLight,
              width: 50,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppSizes.kPadding / 2,
                      top: AppSizes.kPadding / 2,
                      right: AppSizes.kPadding / 2),
                  child: Card(
                    color: AppColors.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: ListTile(
                        //leading: Icon(Icons.shopping_basket),
                        title: Text(
                          "Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "18% of Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            "4,500",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const LineChartSample2(),
                const PieChartSample2(),
                Padding(
                  padding: const EdgeInsets.only(
                      right: AppSizes.kPadding / 2,
                      bottom: AppSizes.kPadding,
                      top: AppSizes.kPadding /2,
                      left: AppSizes.kPadding / 2),
                  child: Card(
                    color: AppColors.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: List.generate(
                        _todos.length,
                            (index) => CheckboxListTile(
                          title: Text(
                            _todos[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          value: _todos[index].enable,
                          onChanged: (newValue) {
                            setState(() {
                              _todos[index].enable = newValue ?? true;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
