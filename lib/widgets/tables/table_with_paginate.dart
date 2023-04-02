import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:portfolio_admin_panel/core/constants/palette.dart';
import 'package:portfolio_admin_panel/core/constants/sizes.dart';
import 'package:portfolio_admin_panel/core/layouts/master.dart';
import 'package:portfolio_admin_panel/responsive_layout.dart';

class TableWithPaginate extends StatefulWidget {
  final List<PlutoColumn> columns;
  final List<PlutoRow> rows;
  const TableWithPaginate({super.key, required this.columns, required this.rows});

  @override
  State<TableWithPaginate> createState() => _TableWithPaginateState();
}

class _TableWithPaginateState extends State<TableWithPaginate> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: AppSizes.kPadding / 2,
        left: AppSizes.kPadding / 2,
        bottom: AppSizes.kPadding,
        top: AppSizes.kPadding,
      ),
      child: PlutoGrid(
        columns: widget.columns,
        rows: widget.rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager.setSelectingMode(PlutoGridSelectingMode.cell);
        },
        configuration: const PlutoGridConfiguration(style: PlutoGridStyleConfig(
            columnTextStyle: TextStyle(color: Colors.white),
            rowColor: AppColors.purpleLight,
            cellTextStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
            gridBackgroundColor: AppColors.purpleDark,
            gridBorderRadius: BorderRadius.all(Radius.circular(15))
        )),
        createFooter: (stateManager) {
          stateManager.setPageSize(1, notify: false); // default 40
          return PlutoPagination(stateManager);
        },
      ),
    );
  }
}
