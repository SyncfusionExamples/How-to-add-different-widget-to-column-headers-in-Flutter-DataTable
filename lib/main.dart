import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SfDataGridDemo()));
}

class SfDataGridDemo extends StatefulWidget {
  const SfDataGridDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SfDataGridDemoState createState() => _SfDataGridDemoState();
}

class _SfDataGridDemoState extends State<SfDataGridDemo> {
  List<Employee> _employees = <Employee>[];
  late EmployeeDataSource _employeeDataSource;

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(_employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter SfDataGrid'),
      ),
      body: SfDataGrid(
          source: _employeeDataSource,
          columnWidthMode: ColumnWidthMode.auto,
          columns: [
            GridColumn(
              columnName: 'id',
              label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('ID'),
              ),
            ),
            GridColumn(
              columnName: 'name',
              label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 4),
                    Text('Name'),
                  ],
                ),
              ),
            ),
            GridColumn(
              width: 170,
              columnName: 'designation',
              label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle action
                  },
                  icon: const Icon(Icons.work),
                  label: const Text('designation'),
                ),
              ),
            ),
            GridColumn(
              width: 120,
              columnName: 'button',
              label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle add action
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                ),
              ),
            ),
          ]),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead '),
      Employee(10002, 'Kathryn', 'Manager'),
      Employee(10003, 'Lara', 'Developer'),
      Employee(10004, 'Michael', 'Designer'),
      Employee(10005, 'Martin', 'Developer'),
      Employee(10006, 'Newberry', 'Developer'),
      Employee(10007, 'Balnc', 'Developer'),
      Employee(10008, 'Perry', 'Developer'),
      Employee(10009, 'Gable', 'Developer'),
      Employee(10010, 'Grimes', 'Developer'),
    ];
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(List<Employee> employees) {
    buildDataGridRow(employees);
  }

  void buildDataGridRow(List<Employee> employeeData) {
    dataGridRow = employeeData.map<DataGridRow>((employee) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: employee.id),
        DataGridCell<String>(columnName: 'name', value: employee.name),
        DataGridCell<String>(
            columnName: 'designation', value: employee.designation),
        const DataGridCell<Widget>(columnName: 'button', value: null),
      ]);
    }).toList();
  }

  List<DataGridRow> dataGridRow = <DataGridRow>[];

  @override
  List<DataGridRow> get rows => dataGridRow.isEmpty ? [] : dataGridRow;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment: Alignment.center,
          child: dataGridCell.columnName == 'button'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_square),
                      onPressed: () {
                        // Handle edit action
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_forever),
                      onPressed: () {
                        // Handle delete action
                      },
                    ),
                  ],
                )
              : Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }
}

class Employee {
  Employee(this.id, this.name, this.designation);
  final int id;
  final String name;
  final String designation;
}
