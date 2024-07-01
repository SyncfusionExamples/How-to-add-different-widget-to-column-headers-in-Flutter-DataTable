# How to add different widget to column headers in Flutter DataTable (SfDataGrid)?

In this article, we will show you how to add different widget to column headers in [Flutter DataTable](https://www.syncfusion.com/flutter-widgets/flutter-datagrid).

Initialize the [SfDataGrid](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid-class.html) widget with all the required properties. you can use the [GridColumn](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/GridColumn-class.html) property to add any widget to a column. This capability allows you to include widgets in column headers based on the respective GridColumn. Consequently, actions can be performed based on the widgets loaded in each GridColumn.

```dart
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
```

You can download the example from [GitHub](https://github.com/SyncfusionExamples/How-to-add-different-widget-to-column-headers-in-Flutter-DataTable).