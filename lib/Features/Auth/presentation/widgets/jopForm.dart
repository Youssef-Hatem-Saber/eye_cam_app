import 'package:cherry_toast/cherry_toast.dart';
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:eye_cam_app/core/utils/sizeConfig.dart';
import 'package:eye_cam_app/core/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class JobApplicationFormFields extends StatefulWidget {
  @override
  _JobApplicationFormFieldsState createState() =>
      _JobApplicationFormFieldsState();
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
  final TextEditingController militaryStatusController =
  TextEditingController();
  final TextEditingController whyHireController = TextEditingController();
  final TextEditingController whyWorkHereController = TextEditingController();
  final TextEditingController goalsController = TextEditingController();
  final TextEditingController salaryExpectationsController =
  TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController motivationController = TextEditingController();
  var now = DateTime.now();
  bool fullTime = false;
  bool partTime = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defultSize! * 2),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: nameController,
              type: TextInputType.name,
              label: 'Applicant’s Name',
              icon: Icon(Icons.person),
              text: 'Applicant’s Name',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: phoneController,
              type: TextInputType.phone,
              label: 'Phone',
              icon: Icon(Icons.phone),
              text: 'Phone',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: positionController,
              type: TextInputType.text,
              label: 'Position applying for',
              icon: Icon(Icons.work),
              text: 'Position applying for',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: ageController,
              type: TextInputType.number,
              label: 'Age',
              icon: Icon(Icons.calendar_today),
              text: 'Age',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: emailController,
              type: TextInputType.emailAddress,
              label: 'E-mail',
              icon: Icon(Icons.email),
              text: 'E-mail',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            SizedBox(height: 16.0),
            SizedBox(height: SizeConfig.defultSize! * 2),
            Text(
              'Availability:',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Full time'),
                    value: fullTime,
                    onChanged: (bool? value) {
                      setState(() {
                        fullTime = value!;
                        partTime = !value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Part time'),
                    value: partTime,
                    onChanged: (bool? value) {
                      setState(() {
                        partTime = value!;
                        fullTime = !value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: graduatedFromController,
              type: TextInputType.text,
              label: 'Graduated from',
              icon: Icon(Icons.school),
              text: 'Graduated from',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: militaryStatusController,
              type: TextInputType.text,
              label: 'Military Status',
              icon: Icon(Icons.shield),
              text: 'Military Status',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: whyHireController,
              type: TextInputType.multiline,
              label: 'Why should Eye-cam hire you?',
              icon: Icon(Icons.question_mark),
              text: 'Why should Eye-cam hire you?',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: whyWorkHereController,
              type: TextInputType.multiline,
              label: 'Why do you want to work here?',
              icon: Icon(Icons.question_mark),
              text: 'Why do you want to work here?',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: goalsController,
              type: TextInputType.multiline,
              label: 'What are your goals?',
              icon: Icon(Icons.question_mark),
              text: 'What are your goals?',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: salaryExpectationsController,
              type: TextInputType.text,
              label: 'What are your salary expectations?',
              icon: Icon(Icons.attach_money),
              text: 'What are your salary expectations?',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: experienceController,
              type: TextInputType.multiline,
              label:
              'Experience demonstrating empathy and patience with individuals with disabilities',
              icon: Icon(Icons.question_mark),
              text:
              'Experience demonstrating empathy and patience with individuals with disabilities',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomTextField(
              controller: motivationController,
              type: TextInputType.multiline,
              label:
              'What motivates you to work with individuals with disabilities?',
              icon: Icon(Icons.question_mark),
              text:
              'What motivates you to work with individuals with disabilities?',
            ),
            SizedBox(height: SizeConfig.defultSize! * 2),
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
                        value: workExperienceRating.isEmpty
                            ? null
                            : workExperienceRating,
                        hint: Text('Select Rating'),
                        onChanged: (String? newValue) {
                          setState(() {
                            workExperienceRating = newValue!;
                          });
                        },
                        items: ratings
                            .map<DropdownMenuItem<String>>((String value) {
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
                        items: ratings
                            .map<DropdownMenuItem<String>>((String value) {
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
                        items: ratings
                            .map<DropdownMenuItem<String>>((String value) {
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
            SizedBox(height: SizeConfig.defultSize! * 2),
            CustomGeneralButton(
              text: "Submit",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  AuthState.submitJobForm(
                      name: nameController.text.toString(),
                      phone: phoneController.text.toString(),
                      position: positionController.text.toString(),
                      age: ageController.text.toString(),
                      email: emailController.text.toString(),
                      availblity: fullTime? "full time":"part time",
                      graduatedFrom: graduatedFromController.text.toString(),
                      militaryStatus: militaryStatusController.text.toString(),
                      whyHire: whyHireController.text.toString(),
                      whyWorkHere: whyWorkHereController.text.toString(),
                      goals: goalsController.text.toString(),
                      salaryExpectations:
                      salaryExpectationsController.text.toString(),
                      experience: experienceController.text.toString(),
                      motivation: motivationController.text.toString(),
                      workExperienceRating: workExperienceRating,
                      educationRating: educationRating,
                      skillsRating: skillsRating);
                      CherryToast.success(title:Text("We will contact you soon"))
                .show(context);
                }
              },
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

  CustomTextField(
      {required this.controller,
        required this.type,
        required this.label,
        required this.icon,
        required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      cursorColor: Colors.blue,
      style: const TextStyle(color: Colors.black, fontSize: 15),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: Colors.black,
        labelText: label,
        prefixIcon: icon,
      ),
    );
  }
}