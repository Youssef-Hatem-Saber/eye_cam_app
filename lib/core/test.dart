import 'package:flutter/material.dart';

void main() {
  runApp(JobApplicationForm());
}

class JobApplicationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Job Application Form'),
        ),
        body: JobApplicationFormFields(),
      ),
    );
  }
}

class JobApplicationFormFields extends StatefulWidget {
  @override
  _JobApplicationFormFieldsState createState() => _JobApplicationFormFieldsState();
}

class _JobApplicationFormFieldsState extends State<JobApplicationFormFields> {
  final _formKey = GlobalKey<FormState>();
  final List<String> ratings = ['Excellent', 'Good', 'Fair', 'Poor'];

  String workExperienceRating = '';
  String educationRating = '';
  String skillsRating = '';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController graduatedFromController = TextEditingController();
  final TextEditingController militaryStatusController = TextEditingController();
  final TextEditingController whyHireController = TextEditingController();
  final TextEditingController whyWorkHereController = TextEditingController();
  final TextEditingController goalsController = TextEditingController();
  final TextEditingController salaryExpectationsController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController motivationController = TextEditingController();

  bool fullTime = false;
  bool partTime = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            CustomTextField(
              controller: TextEditingController(),
              type: TextInputType.datetime,
              label: 'Date',
              icon: Icon(Icons.calendar_today),
              text: 'Date',
            ),
            CustomTextField(
              controller: nameController,
              type: TextInputType.name,
              label: 'Applicant’s Name',
              icon: Icon(Icons.person),
              text: 'Applicant’s Name',
            ),
            CustomTextField(
              controller: phoneController,
              type: TextInputType.phone,
              label: 'Phone',
              icon: Icon(Icons.phone),
              text: 'Phone',
            ),
            CustomTextField(
              controller: positionController,
              type: TextInputType.text,
              label: 'Position applying for',
              icon: Icon(Icons.work),
              text: 'Position applying for',
            ),
            CustomTextField(
              controller: ageController,
              type: TextInputType.number,
              label: 'Age',
              icon: Icon(Icons.calendar_today),
              text: 'Age',
            ),
            CustomTextField(
              controller: emailController,
              type: TextInputType.emailAddress,
              label: 'E-mail',
              icon: Icon(Icons.email),
              text: 'E-mail',
            ),
            SizedBox(height: 16.0),
            Text('Availability:'),
            CheckboxListTile(
              title: Text('Full time'),
              value: fullTime,
              onChanged: (bool? value) {
                setState(() {
                  fullTime = value!;
                  partTime = !value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Part time'),
              value: partTime,
              onChanged: (bool? value) {
                setState(() {
                  partTime = value!;
                  fullTime = !value;
                });
              },
            ),
            CustomTextField(
              controller: graduatedFromController,
              type: TextInputType.text,
              label: 'Graduated from',
              icon: Icon(Icons.school),
              text: 'Graduated from',
            ),
            CustomTextField(
              controller: militaryStatusController,
              type: TextInputType.text,
              label: 'Military Status',
              icon: Icon(Icons.shield),
              text: 'Military Status',
            ),
            CustomTextField(
              controller: whyHireController,
              type: TextInputType.text,
              label: 'Why should Eye-cam hire you?',
              icon: Icon(Icons.question_answer),
              text: 'Why should Eye-cam hire you?',
            ),
            CustomTextField(
              controller: whyWorkHereController,
              type: TextInputType.text,
              label: 'Why do you want to work here?',
              icon: Icon(Icons.question_answer),
              text: 'Why do you want to work here?',
            ),
            CustomTextField(
              controller: goalsController,
              type: TextInputType.text,
              label: 'What are your goals?',
              icon: Icon(Icons.question_answer),
              text: 'What are your goals?',
            ),
            CustomTextField(
              controller: salaryExpectationsController,
              type: TextInputType.text,
              label: 'What are your salary expectations?',
              icon: Icon(Icons.attach_money),
              text: 'What are your salary expectations?',
            ),
            CustomTextField(
              controller: experienceController,
              type: TextInputType.text,
              label: 'Experience demonstrating empathy and patience with individuals with disabilities',
              icon: Icon(Icons.question_answer),
              text: 'Experience demonstrating empathy and patience with individuals with disabilities',
            ),
            CustomTextField(
              controller: motivationController,
              type: TextInputType.text,
              label: 'What motivates you to work with individuals with disabilities?',
              icon: Icon(Icons.question_answer),
              text: 'What motivates you to work with individuals with disabilities?',
            ),
            SizedBox(height: 16.0),
            Table(
              border: TableBorder.all(),
              columnWidths: {
                0: FixedColumnWidth(150.0),
                1: FixedColumnWidth(150.0),
              },
              children: [
                TableRow(children: [
                  TableCell(child: Center(child: Text('Category'))),
                  TableCell(child: Center(child: Text('Rating'))),
                ]),
                TableRow(children: [
                  TableCell(child: Center(child: Text('Work Experience'))),
                  TableCell(
                    child: Center(
                      child: DropdownButton<String>(
                        value: workExperienceRating.isEmpty ? null : workExperienceRating,
                        hint: Text('Select Rating'),
                        onChanged: (String? newValue) {
                          setState(() {
                            workExperienceRating = newValue!;
                          });
                        },
                        items: ratings.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  TableCell(child: Center(child: Text('Education'))),
                  TableCell(
                    child: Center(
                      child: DropdownButton<String>(
                        value: educationRating.isEmpty ? null : educationRating,
                        hint: Text('Select Rating'),
                        onChanged: (String? newValue) {
                          setState(() {
                            educationRating = newValue!;
                          });
                        },
                        items: ratings.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  TableCell(child: Center(child: Text('Skills'))),
                  TableCell(
                    child: Center(
                      child: DropdownButton<String>(
                        value: skillsRating.isEmpty ? null : skillsRating,
                        hint: Text('Select Rating'),
                        onChanged: (String? newValue) {
                          setState(() {
                            skillsRating = newValue!;
                          });
                        },
                        items: ratings.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Print the form data
                  print('Date: ${TextEditingController().text}');
                  print('Name: ${nameController.text}');
                  print('Phone: ${phoneController.text}');
                  print('Position: ${positionController.text}');
                  print('Age: ${ageController.text}');
                  print('Email: ${emailController.text}');
                  print('Availability: Full time: $fullTime, Part time: $partTime');
                  print('Graduated From: ${graduatedFromController.text}');
                  print('Military Status: ${militaryStatusController.text}');
                  print('Why Hire: ${whyHireController.text}');
                  print('Why Work Here: ${whyWorkHereController.text}');
                  print('Goals: ${goalsController.text}');
                  print('Salary Expectations: ${salaryExpectationsController.text}');
                  print('Experience: ${experienceController.text}');
                  print('Motivation: ${motivationController.text}');
                  print('Work Experience Rating: $workExperienceRating');
                  print('Education Rating: $educationRating');
                  print('Skills Rating: $skillsRating');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final Icon icon;
  final String text;

  CustomTextField({required this.controller, required this.type, required this.label, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon,
      ),
    );
  }
}
