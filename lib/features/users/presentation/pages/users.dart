import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:portfolio_admin_panel/core/constants/palette.dart';
import 'package:portfolio_admin_panel/core/constants/sizes.dart';
import 'package:portfolio_admin_panel/core/layouts/master.dart';
import 'package:portfolio_admin_panel/responsive_layout.dart';
import 'package:portfolio_admin_panel/widgets/tables/table_with_paginate.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Id',
      field: 'id',
      type: PlutoColumnType.text(),
      backgroundColor: AppColors.purpleLight,

    ),
    PlutoColumn(
      title: 'Name',
      field: 'name',
      type: PlutoColumnType.text(),
      backgroundColor: AppColors.purpleLight,
    ),
    PlutoColumn(
      title: 'Age',
      field: 'age',
      type: PlutoColumnType.number(),
      backgroundColor: AppColors.purpleLight,
    ),
    PlutoColumn(
      title: 'Role',
      field: 'role',
      type: PlutoColumnType.select(<String>[
        'Programmer',
        'Designer',
        'Owner',
      ]),
      backgroundColor: AppColors.purpleLight,
    ),
    PlutoColumn(
      title: 'Joined',
      field: 'joined',
      type: PlutoColumnType.date(),
      backgroundColor: AppColors.purpleLight,
    ),
    PlutoColumn(
      title: 'Working time',
      field: 'working_time',
      type: PlutoColumnType.time(),
      backgroundColor: AppColors.purpleLight,
    ),
    PlutoColumn(
      title: 'salary',
      field: 'salary',
      type: PlutoColumnType.currency(),
      backgroundColor: AppColors.purpleLight,
    ),
  ];

  final List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'id': PlutoCell(value: 'user1'),
        'name': PlutoCell(value: 'Mike'),
        'age': PlutoCell(value: 20),
        'role': PlutoCell(value: 'Programmer'),
        'joined': PlutoCell(value: '2021-01-01'),
        'working_time': PlutoCell(value: '09:00'),
        'salary': PlutoCell(value: 300),
      },
    ),
    PlutoRow(
      cells: {
        'id': PlutoCell(value: 'user2'),
        'name': PlutoCell(value: 'Jack'),
        'age': PlutoCell(value: 25),
        'role': PlutoCell(value: 'Designer'),
        'joined': PlutoCell(value: '2021-02-01'),
        'working_time': PlutoCell(value: '10:00'),
        'salary': PlutoCell(value: 400),
      },
    ),
    PlutoRow(
      cells: {
        'id': PlutoCell(value: 'user3'),
        'name': PlutoCell(value: 'Suzi'),
        'age': PlutoCell(value: 40),
        'role': PlutoCell(value: 'Owner'),
        'joined': PlutoCell(value: '2021-03-01'),
        'working_time': PlutoCell(value: '11:00'),
        'salary': PlutoCell(value: 700),
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Master(
      body: ResponsiveLayout(
        defaultWidget: TableWithPaginate(columns: columns, rows: rows),
      ),
    );
  }
}
