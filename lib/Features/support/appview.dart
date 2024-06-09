import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:eye_cam_app/core/utils/sizeConfig.dart';
import 'package:eye_cam_app/core/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class appView extends StatefulWidget {

  appView({super.key, required this.name, required this.phone, required this.position, required this.age, required this.email, required this.graduatedFrom, required this.militaryStatus, required this.whyHire, required this.whyWorkHere, required this.goals, required this.salaryExpectations, required this.experience, required this.motivation, required this.avability, required this.date});

  @override
  _appViewState createState() =>
      _appViewState();
  final List<String> ratings = [''];
  final avability;
  final String workExperienceRating = '';
  final String educationRating = '';
  final String skillsRating = '';
  final name;
  final phone  ;
  final position  ;
  final age  ;
  final email  ;
  final graduatedFrom  ;
  final militaryStatus;
  final whyHire;
  final whyWorkHere  ;
  final goals  ;
  final salaryExpectations;
  final experience  ;
  final motivation  ;
  final date;

}

class _appViewState extends State<appView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.defultSize! * 2),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
              controller: TextEditingController(text:'${widget.date}'),
              type: TextInputType.name,
              label: 'Applicant’s Date',
              icon: Icon(Icons.date_range),
              text: 'Applicant’s Date',
            ),
              SizedBox(height: SizeConfig.defultSize! * 2),

              CustomTextField(
                controller: TextEditingController(text: widget.name),
                type: TextInputType.name,
                label: 'Applicant’s Name',
                icon: Icon(Icons.person),
                text: 'Applicant’s Name',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller: TextEditingController(text: widget.phone),
                type: TextInputType.phone,
                label: 'Phone',
                icon: Icon(Icons.phone),
                text: 'Phone',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller:TextEditingController(text: widget.position) ,
                type: TextInputType.text,
                label: 'Position applying for',
                icon: Icon(Icons.work),
                text: 'Position applying for',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller:TextEditingController(text: widget.age) ,
                type: TextInputType.number,
                label: 'Age',
                icon: Icon(Icons.calendar_today),
                text: 'Age',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller: TextEditingController(text: widget.email),
                type: TextInputType.emailAddress,
                label: 'E-mail',
                icon: Icon(Icons.email),
                text: 'E-mail',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              SizedBox(height: 16.0),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller: TextEditingController(text: widget.avability),
                type: TextInputType.text,
                label: 'Availability',
                icon: Icon(Icons.school),
                text: 'Availability',
              ),

              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller: TextEditingController(text: widget.graduatedFrom),
                type: TextInputType.text,
                label: 'Graduated from',
                icon: Icon(Icons.school),
                text: 'Graduated from',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller:TextEditingController(text: widget.militaryStatus) ,
                type: TextInputType.text,
                label: 'Military Status',
                icon: Icon(Icons.shield),
                text: 'Military Status',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller: TextEditingController(text: widget.whyHire),
                type: TextInputType.multiline,
                label: 'Why should Eye-cam hire you?',
                icon: Icon(Icons.question_mark),
                text: 'Why should Eye-cam hire you?',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller: TextEditingController(text: widget.whyWorkHere),
                type: TextInputType.multiline,
                label: 'Why do you want to work here?',
                icon: Icon(Icons.question_mark),
                text: 'Why do you want to work here?',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller: TextEditingController(text: widget.goals),
                type: TextInputType.multiline,
                label: 'What are your goals?',
                icon: Icon(Icons.question_mark),
                text: 'What are your goals?',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller:TextEditingController(text: widget.salaryExpectations) ,
                type: TextInputType.text,
                label: 'What are your salary expectations?',
                icon: Icon(Icons.attach_money),
                text: 'What are your salary expectations?',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller: TextEditingController(text: widget.experience),
                type: TextInputType.multiline,
                label:
                'Experience demonstrating empathy and patience with individuals with disabilities',
                icon: Icon(Icons.question_mark),
                text:
                'Experience demonstrating empathy and patience with individuals with disabilities',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller:TextEditingController(text: widget.motivation) ,
                type: TextInputType.multiline,
                label:
                'What motivates you to work with individuals with disabilities?',
                icon: Icon(Icons.question_mark),
                text:
                'What motivates you to work with individuals with disabilities?',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller:TextEditingController(text: widget.workExperienceRating) ,
                type: TextInputType.multiline,
                label:
                'Work Experience',
                icon: Icon(Icons.work_history),
                text:
                'Work Experience',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller:TextEditingController(text: widget.skillsRating) ,
                type: TextInputType.multiline,
                label:
                'Skills',
                icon: Icon(Icons.question_mark),
                text:
                'Skills',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
              CustomTextField(
                controller:TextEditingController(text: widget.educationRating) ,
                type: TextInputType.multiline,
                label:
                'Education',
                icon: Icon(Icons.school),
                text:
                'Education',
              ),
              SizedBox(height: SizeConfig.defultSize! * 2),
            ],
          ),
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
      readOnly: true,
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
