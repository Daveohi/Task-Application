// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:task_application/inicio.dart';

// class Thirdpage extends StatefulWidget {
//   const Thirdpage({super.key});

//   @override
//   State<Thirdpage> createState() => _ThirdpageState();
// }

// class _ThirdpageState extends State<Thirdpage> {
//   int _selectedTab = 0;
//   int totalTasks = 0;
//   int taskCompleted = 0;

//   final List _pages = [];

//   @override
//   void initState() {
//     super.initState();
//     initState();
//     _pages.add(_ThirdpageState);
//     //  Center(
//       Inicio(
//          onUpdateTotalTasks: (int newTotalTasks) {
//           setState(() => totalTasks = newTotalTasks);
//         },
//         onUpdateCompletedTasks: (int newCompletedTasks) {
//           setState(() {
//             taskCompleted = newCompletedTasks;
//           });
//         },
      
//     );
    
    
//     // _pages.add(
//     //   Inicio(
//     //     onUpdateTotalTasks: (int newTotalTasks) {
//     //       setState(() => totalTasks = newTotalTasks);
//     //     },
//     //     onUpdateCompletedTasks: (int newCompletedTasks) {
//     //       setState(() {
//     //         taskCompleted = newCompletedTasks;
//     //       });
//     //     },
//     //   ),
//     // );
//      _pages.add(
//       const Center(child: Text("Products")),
//     );
//     _pages.add(
//       const Center(child: Text("Calendar")),
//     );
//     _pages.add(
//       const Center(child: Text("Menu")),
//     );
//   }
//   // ];

//   void _changeTab(int index) {
//     setState(() {
//       _selectedTab = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         title: const Text('June 21, 2024 \nHola, David 👋 '),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               CupertinoIcons.search,
//               color: Colors.black,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               CupertinoIcons.bell,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: const Color(0xfafafafa),
//       body: Padding(
//         padding: const EdgeInsets.all(6.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Card(
//                   elevation: 4,
//                   color: Colors.white,
//                   margin: const EdgeInsets.only(
//                       left: 10.0, top: 10.0, bottom: 10.0),
//                   child: Container(
//                     padding:  const EdgeInsets.all(16),
//                     width: (MediaQuery.of(context).size.width / 2) - 24,
//                     child:  Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                          const Icon(
//                           CupertinoIcons.gift_fill,
//                           color: Colors.red,
//                           size: 30,
//                           shadows: [
//                             BoxShadow(
//                               color: Colors.black,
//                               blurRadius: 5.0,
//                               spreadRadius: 5.0,
//                               offset: Offset(1.0, 1.0),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 1.0, top: 40.0, right: 40, bottom: 18.0),
//                           child: Text.rich(
//                             TextSpan(
//                               children: [
//                                 const TextSpan(
//                                   text: 'Nuevas toreas \n',
//                                   style: TextStyle(
//                                     color: Colors.black38,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: totalTasks.toString(),
//                                   style: const TextStyle(
//                                       color: Colors.black54,
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Card(
//                   elevation: 4,
//                   color: Colors.white,
//                   margin: const EdgeInsets.only(
//                       right: 10.0, top: 10.0, bottom: 10.0),
//                   child: Container(
//                     constraints: const BoxConstraints(
//                       maxWidth: double.infinity,
//                     ),
//                     padding: const EdgeInsets.all(16),
//                     width: (MediaQuery.of(context).size.width / 2) - 24,
//                     child:  Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Icon(
//                           CupertinoIcons.headphones,
//                           color: Colors.red,
//                           size: 30,
//                           shadows: [
//                             BoxShadow(
//                               color: Colors.black,
//                               blurRadius: 5.0,
//                               spreadRadius: 5.0,
//                               offset: Offset(1.0, 1.0),
//                             ),],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 1.0, top: 40.0, right: 40, bottom: 18.0),
//                           child: Text.rich(
//                             TextSpan(
//                               children: [
//                                 const TextSpan(
//                                   text: 'Proyectos \n',
//                                   style: TextStyle(
//                                     color: Colors.black38,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: taskCompleted.toString(),
//                                   style: const TextStyle(
//                                       color: Colors.black54,
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: _pages[_selectedTab],
//               //   ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedTab,
//         onTap: (index) => _changeTab(index),
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.file_copy), label: "Proyectos"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.calendar_month), label: "Calendario"),
//           BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
//         ],
//       ),
//     );
//   }
// }
