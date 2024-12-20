import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ioe_hub/core/di/di_config.dart';
import 'package:ioe_hub/core/ui/app_button.dart';
import 'package:ioe_hub/core/ui/dropdown_widget.dart';
import 'package:ioe_hub/features/profile/blocs/contribute_bloc/contribute_bloc.dart';
import 'package:ioe_hub/features/profile/blocs/contribute_bloc/contribute_event.dart';
import 'package:ioe_hub/features/profile/blocs/contribute_bloc/contribute_state.dart';

@RoutePage()
class ContributionPage extends StatefulWidget {
  const ContributionPage({super.key});

  @override
  State<ContributionPage> createState() => _ContributionPageState();
}

class _ContributionPageState extends State<ContributionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ContributionBloc>(),
      child: ContributionForm(),
    );
  }
}

// ignore: must_be_immutable
class ContributionForm extends StatelessWidget {
  final _questionController = TextEditingController();
  String? selectedFaculty;
  int? selectedYear;
  int? selectedSemester;

  final List<String> faculties = ['Engineering', 'Science', 'Arts', 'Commerce'];
  final List<int> years = [2020, 2021, 2022, 2023, 2024];
  final List<int> semesters = [1, 2, 3, 4, 5, 6, 7, 8];

  ContributionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CONTRIBUTE"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(hintText: "Google drive link"),
              maxLines: 3,
            ),
            const SizedBox(height: 10),

            // CustomDropdown for Faculty
            CustomDropdown<String>(
              hintText: "Select Faculty",
              selectedValue: selectedFaculty,
              items: faculties,
              onChanged: (String? value) {
                selectedFaculty = value;
              },
              getItemLabel: (String faculty) => faculty,
            ),
            const SizedBox(height: 10),

            // CustomDropdown for Year
            CustomDropdown<int>(
              hintText: "Select Year",
              selectedValue: selectedYear,
              items: years,
              onChanged: (int? value) {
                selectedYear = value;
              },
              getItemLabel: (int year) => year.toString(),
            ),
            const SizedBox(height: 10),

            // CustomDropdown for Semester
            CustomDropdown<int>(
              hintText: "Select Semester",
              selectedValue: selectedSemester,
              items: semesters,
              onChanged: (int? value) {
                selectedSemester = value;
              },
              getItemLabel: (int semester) => "Semester $semester",
            ),
            const SizedBox(height: 20),

            BlocConsumer<ContributionBloc, ContributionState>(
              listener: (context, state) {
                if (state is ContributionSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Question submitted successfully!'),
                    ),
                  );
                } else if (state is ContributionFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${state.error}')),
                  );
                }
              },
              builder: (context, state) {
                var isValid = selectedFaculty != null &&
                    selectedYear != null &&
                    selectedSemester != null;
                return AppButton(
                  onPressed: () {
                    final question = _questionController.text;
                    if (selectedFaculty != null &&
                        selectedYear != null &&
                        selectedSemester != null) {
                      context.read<ContributionBloc>().add(
                            SubmitQuestion(
                              question: question,
                              faculty: selectedFaculty!,
                              year: selectedYear!,
                              semester: selectedSemester!,
                            ),
                          );
                    }
                  },
                  isDisabled: state is ContributionLoading || !isValid,
                  text: 'Submit Question',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
