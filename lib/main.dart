import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Birthday';
  var items = [
    'Birthday',
    'Wedding',
    'Conference',
    'Concert',
    'Dinner Party',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Event Plan'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.event),
              text: "Event Details",
            ),
            Tab(
              icon: Icon(Icons.group),
              text: "Attendees",
            ),
            Tab(
              icon: Icon(Icons.schedule),
              text: "Timeline",
            ),
          ]),
        ),
        body: TabBarView(children: [
          const ListTile(
            trailing: Icon(Icons.celebration),
            title: Text('Welcome'),
            subtitle: Text('Ready to plan your event? Let\'s get started!'),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SelectableText('Please select the event type:'),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  color: Color.fromARGB(255, 118, 156, 242),
                  child: DropdownButton(
                    value: dropdownValue,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 100,
                  child: TextField(
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter event description here!',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: _showAlertDialog,
                    child: const Text('Submit')),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Event Timeline', style: TextStyle(fontSize: 18)),
                ),
                DataTable(
                  columns: const [
                    DataColumn(label: Text('Task')),
                    DataColumn(label: Text('Description')),
                  ], 
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Venue Booking')),
                      DataCell(Text('Book the event venue and sign the contract.')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Invitations')),
                      DataCell(Text('Design and print invitations.')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Catering')),
                      DataCell(Text('Choose the menu and confirm the catering arrangements.')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Entertainment')),
                      DataCell(Text('Book and confirm entertainment for the event.')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Finalize Details')),
                      DataCell(Text('Finalize all event details and prepare for the big day.')),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ]),
        drawer: Drawer(
            child: ListView(
          children: [
            const DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(163, 228, 12, 55)),
                  accountName: Text('Barun Sharma'),
                  accountEmail: Text('bps@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(172, 238, 255, 0),
                    child: Text("B"),
                  ),
                  currentAccountPictureSize: Size.square(50),
                )),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                "Profile",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.newspaper),
              title: const Text(
                "News",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text(
                "My Events",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                "Settings",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )),
      ),
    );
  }
   Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to submit the event details?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}