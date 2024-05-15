import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JobApplicationForm extends StatefulWidget {
  @override
  _JobApplicationFormState createState() => _JobApplicationFormState();
}

class _JobApplicationFormState extends State<JobApplicationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController company=TextEditingController();
  TextEditingController jobdes=TextEditingController();
  TextEditingController jobsal=TextEditingController();
  String?_companyName;
  String ?_jobDescription;
  String ?_jobSalary;
  String?_selectedjobtitle;
  String ?_selectedJobType;
  String ?_selectedJobExperienceLevel;
  String ?_selectedJobLocation;
  String ?_selectedJobSkill;
  List<String> _selectedJobSkills = [];
  List<String>_jobTitle=["Software Engineer"];
  List<String> _jobTypes = ['Full-time'];
  List<String> _jobExperienceLevels = ['Entry Level', 'Mid Level', 'Senior Level'];
  List<String> _jobLocations = ['San Francisco', 'New York'];
  List<String> _jobSkills = ['Java', 'Python', 'JavaScript', 'SQL'];

  void senddata () async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "companyName": _companyName,
      "jobTitle": _selectedjobtitle ,
      "jobType":  _selectedJobType,
      "jobSkills":_selectedJobSkills,


      "jobDescription": _jobDescription,
      "jobExperienceLevel": _selectedJobExperienceLevel,
      "jobLocation":_selectedJobLocation,
      "jobSalary": _jobSalary,
    });
    var dio = Dio();
    var response = await dio.request(
      'https://job-backend-skpz.onrender.com/createJobPost/',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(json.encode(response.data));
      setState(() {
        _companyName = null;
        _selectedjobtitle = null;
        _selectedJobType = null;
        _selectedJobSkills.clear();
        _jobDescription = null;
        _selectedJobExperienceLevel = null;
        _selectedJobLocation = null;
        _jobSalary = null;
        company.clear();
        jobdes.clear();
        jobsal.clear();
      });
    }
    else {
      print(response.statusMessage);
    }

  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height*0.08), // Adjust the height as needed
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/unstop.png",height: size.height*0.08,width: size.width*0.24,fit:BoxFit.contain,),
            ),
          ],),
        ),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(top:50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Company Name',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: company,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: BorderSide(width: 1.0),
                      ),),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter company name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _companyName = value;
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Job Title'),
                    value: _selectedjobtitle,
                    items: _jobTitle.map((jobtitle) {
                      return DropdownMenuItem<String>(
                        value: jobtitle,
                        child: Text(jobtitle),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedjobtitle = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Job Type'),
                    value: _selectedJobType,
                    items: _jobTypes.map((jobType) {
                      return DropdownMenuItem<String>(
                        value: jobType,
                        child: Text(jobType),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedJobType = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Job Experience Level'),
                    value: _selectedJobExperienceLevel,
                    items: _jobExperienceLevels.map((experienceLevel) {
                      return DropdownMenuItem<String>(
                        value: experienceLevel,
                        child: Text(experienceLevel),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedJobExperienceLevel = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Job Location'),
                    value: _selectedJobLocation,
                    items: _jobLocations.map((location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedJobLocation = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Text('Job Description',style: TextStyle(
                      fontSize: 16
                  ),),
                  TextFormField(
                    controller: jobdes,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.black87),
                      ),),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter job description';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _jobDescription = value;
                    },
                  ),
                  SizedBox(height: 20),
                  Text('Job Skills', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _jobSkills.map((skill) {
                      return CheckboxListTile(
                        title: Text(skill),
                        value: _selectedJobSkills.contains(skill),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              _selectedJobSkills.add(skill);
                            } else {
                              _selectedJobSkills.remove(skill);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'JOB SALARY',
                    style: TextStyle(
                      fontSize: 16,
                    ),

                  ),
                  TextFormField(
                    controller: jobsal,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Colors.black87), //<-- SEE HERE
                      ),),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter job salary';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _jobSalary = value;
                    },
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                        onPressed:(){
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            senddata();
                          }
                        }, style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),

                    ),
                        child: Text('SUBMIT',style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),)),
                  )


                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}