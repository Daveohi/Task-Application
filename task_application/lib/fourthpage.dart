import 'package:flutter/material.dart';

class Fourthpage extends StatefulWidget {
  const Fourthpage({super.key});

  @override
  State<Fourthpage> createState() => _FourthpageState();
}

class _FourthpageState extends State<Fourthpage> {
  int _selectedTab = 1;
  bool _isFabExtended = false;

  final List _pages = [
   const Center(),
    const Center(child: Text("Products")),
    const Center(child: Text("Calendar")),
    const Center(child: Text("Menu")),
  ];

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void _toggleFab() {
    setState(() {
      _isFabExtended = !_isFabExtended;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Jue Feb 17 \n Hola, David 👋 ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 4,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: (MediaQuery.of(context).size.width / 2) - 24,
                    child: const Column(
                      children: [
                        Text('Nuevas tareas'),
                        SizedBox(height: 10),
                        Text('8', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: (MediaQuery.of(context).size.width / 2) - 24,
                    child: const Column(
                      children: [
                        Text('Proyectos activos'),
                        SizedBox(height: 10),
                        Text('13', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: _pages[_selectedTab]),
        ],
      ),
      floatingActionButton: _isFabExtended
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    // _toggleFab();
                    // Add your onPressed code here!
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Crear tarea'),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.extended(
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Crear proyecto'),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _toggleFab,
                  child: const Icon(Icons.close),
                ),
              ],
            )
          : FloatingActionButton(
              onPressed: _toggleFab,
              child: const Icon(Icons.add),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _changeTab,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_copy), label: "Proyectos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Calendario"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'Tareas del día',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        const TaskCard(
            title: 'Diseño de Onboarding', subtitle: 'E-Learning App'),
        const TaskCard(title: 'Landing Page', subtitle: 'Car Rental Website'),
        const TaskCard(
            title: 'Animaciones Onboarding', subtitle: 'E-Learning App'),
        const TaskCard(title: 'Icons', subtitle: 'Car Rental Website'),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const TaskCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
