import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/features/notes/pages/note_list_page.dart';
import 'package:ioe_hub/features/pastPaper/pages/past_questions_page.dart';
import 'package:ioe_hub/features/profile/pages/profile_page.dart';
import 'package:ioe_hub/features/syllabus/pages/courses_page.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final _pages = [
    const CoursesPage(),
    const PastQuestionsPage(),
    const NoteListPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        bottomNavigationBar: SafeArea(
          child: NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              destinations: const [
                NavigationDestination(
                    icon: Icon(Iconsax.book_1), label: 'Syllabus'),
                NavigationDestination(
                    icon: Icon(Iconsax.document), label: 'Questions'),
                NavigationDestination(
                    icon: Icon(Iconsax.note_2), label: 'Notes'),
                NavigationDestination(
                    icon: Icon(Iconsax.user), label: 'Profile'),
              ]),
        ),
        body: _pages[_selectedIndex]);
  }
}
