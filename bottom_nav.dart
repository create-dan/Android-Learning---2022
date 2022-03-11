// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: HomePage(),
  ));
}

// steps code
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   var current_step = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Utils App"),
//       ),
//       body: Container(
//         child: Stepper(
//           steps: [
//             Step(
//                 title: Text("Step 1"),
//                 content: Text("Idea Submisson"),
//                 isActive: true),
//             Step(
//                 title: Text("Step 2"),
//                 content: Text("Idea Submisson"),
//                 isActive: true),
//             Step(
//                 title: Text("Step 3"),
//                 content: Text("Idea Submisson"),
//                 isActive: true),
//           ],
//           currentStep: current_step,
//           type: StepperType.vertical,
//         ),
//       ),
//     );
//   }
//
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(IntProperty('current_step', current_step));
//   }
// }

// code for snack

// class MyBody extends StatelessWidget {
//   AlertDialog dialog = AlertDialog(
//     content: Text(
//       "Dialog is up..",
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   );
//
//   MyBody({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: RaisedButton(
//           child: Text(
//             "click",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           color: Colors.pink,
//
//           // snackbar code
//
//           // onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
//           //   content: Text("You cliked me"),
//           //   duration: Duration(seconds: 3),
//           // )),
//
//           onPressed: () => showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: const Text(' Title'),
//                 content: SingleChildScrollView(
//                   child: ListBody(
//                     children: const <Widget>[
//                       Text('This is a demo alert dialog.'),
//                       Text('Would you like to approve of this message?'),
//                     ],
//                   ),
//                 ),
//                 actions: <Widget>[
//                   TextButton(
//                     child: const Text('Approve'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// code for bottom nav bar

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar"),
      ),
      body: TabBarView(
        children: [
          NewPage(
            title: 'New page',
          ),
        ],
        controller: tabController,
      ),
      bottomNavigationBar: Material(
        child: TabBar(
          controller: tabController,
          tabs: [
            IconButton(
              icon: Icon(Icons.favouite),
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String title;

  const NewPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
