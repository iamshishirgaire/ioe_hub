import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ioe_hub/core/di/di_config.dart';
import 'package:ioe_hub/core/ui/app_button.dart';
import 'package:ioe_hub/core/ui/dropdown_widget.dart';
import 'package:ioe_hub/core/utils/separate_letter_digits.dart';
import 'package:ioe_hub/core/utils/snake_case.dart';
import 'package:ioe_hub/features/my_space/blocs/my_space_bloc/my_space_bloc.dart';
import 'package:ioe_hub/features/my_space/blocs/my_space_bloc/my_space_event.dart';
import 'package:ioe_hub/features/my_space/repository/my_space_repository.dart';
import 'package:ioe_hub/features/syllabus/models/faculty.dart';
import 'package:ioe_hub/features/syllabus/models/semester.dart';

@RoutePage()
class MySpacePage extends StatefulWidget {
  const MySpacePage({super.key});

  @override
  State<MySpacePage> createState() => _MySpacePageState();
}

class _MySpacePageState extends State<MySpacePage> {
  Faculty? selectedFaculty;
  Semester? selectedSemester;
  List<Semester>? semesters;
  List<Faculty>? faculties;
  bool isFieldDirty = false;

  @override
  void initState() {
    super.initState();
    getFaculties();
    getSpaceFaculty(); // Will fetch semesters after faculty is loaded
    getSpaceSemester();
    context.read<MySpaceBloc>().add(LoadFacultiesEvent());
  }

  Future<void> getSpaceFaculty() async {
    var res = await getIt<MySpaceRepository>().getCurrentFaculty();
    setState(() {
      selectedFaculty = res;
      // Fetch semesters once the selected faculty is loaded
      if (selectedFaculty != null) {
        getFacultySemesters(selectedFaculty!.id);
      }
    });
  }

  Future<void> getFacultySemesters(int facultyId) async {
    var res = await getIt<MySpaceRepository>().getAllSemesters(facultyId);
    setState(() {
      semesters = res;
    });
  }

  Future<void> getFaculties() async {
    var res = await getIt<MySpaceRepository>().getAllFaculties();
    setState(() {
      faculties = res;
    });
  }

  Future<void> getSpaceSemester() async {
    var res = await getIt<MySpaceRepository>().getCurrentSemester();
    setState(() {
      selectedSemester = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY SPACE'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              SvgPicture.asset(
                'assets/icons/space.svg',
                width: 150,
                height: 150,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: const Center(
                  child: Text(
                    'Set or update your space',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                  child: Text(
                    'Minimize the number of taps to save your time',
                    style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: CustomDropdown(
                  hintText: 'Select Faculty',
                  selectedValue: selectedFaculty,
                  items: faculties ?? [],
                  onChanged: (newValue) {
                    setState(() {
                      selectedFaculty = newValue;
                      selectedSemester =
                          null; // Reset selectedSemester when faculty changes
                      isFieldDirty = true;
                      getFacultySemesters(
                          newValue!.id); // Fetch semesters for the new faculty
                    });
                  },
                  getItemLabel: (faculty) => toTitleCase(faculty.name),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: CustomDropdown<Semester>(
                    hintText: 'Select Semester',
                    selectedValue: selectedSemester,
                    items: semesters ?? [],
                    onChanged: (newValue) {
                      setState(() {
                        selectedSemester = newValue;
                        isFieldDirty = true;
                      });
                    },
                    getItemLabel: (sem) => separateLettersDigits(sem.name)),
              ),
              const SizedBox(height: 16),
              AppButton(
                isDisabled: isFieldDirty == false,
                onPressed: selectedFaculty != null && selectedSemester != null
                    ? () {
                        setState(() {
                          isFieldDirty = false;
                        });
                        context.read<MySpaceBloc>().add(SaveCurrentSpaceEvent(
                              selectedFaculty!,
                              selectedSemester!,
                            ));
                        // Remove these lines to retain the dropdown selections after saving
                        // selectedFaculty = null;
                        // selectedSemester = null;
                      }
                    : null,
                text: "Set Space",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
