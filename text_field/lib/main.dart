import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(UniversityApplication());
}

class UniversityApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'University Application',
      theme: ThemeData(
        useMaterial3: true
      ),
      home: ApplicationForm(),
    );
  }
}

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String motivationLetter = '';
  String? genderChoice; // Nullable
  bool subscribeNewsletter = false;

  void _showSubmittedMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Application Submitted'),
          content: Text('Thank you, $firstName, for submitting your application!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Application Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        firstName = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'First Name',border: OutlineInputBorder()),
                
                
                    validator: (value) {
                      if (value=='') {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        lastName = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Last Name',border: OutlineInputBorder()),
                    validator: (value) {
                      if (value=='') {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        phoneNumber = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Phone Number',border: OutlineInputBorder(),hintText: '0775148714'),
                     keyboardType: TextInputType.number,
                     
                     inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly

                    ],
                    validator: (value) {
                      if (value=='') {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        motivationLetter = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Motivation Letter',border: OutlineInputBorder(),
                    counterText: '${getWordCount(motivationLetter)}/300'),
                    maxLines: 5,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1000)
                    ],
                    validator: (value) {
                      if (value=='') {
                        return 'Please enter your motivation letter';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Gender:'),
                ),
                RadioListTile(
                  title: Text('Male'),
                  value: 'Male',
                  groupValue: genderChoice,
                  onChanged: (value) {
                    setState(() {
                      genderChoice = value;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Female'),
                  value: 'Female',
                  groupValue: genderChoice,
                  onChanged: (value) {
                    setState(() {
                      genderChoice = value;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Other'),
                  value: 'Other',
                  groupValue: genderChoice,
                  onChanged: (value) {
                    setState(() {
                      genderChoice = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: subscribeNewsletter,
                        onChanged: (value) {
                          setState(() {
                            subscribeNewsletter = true;
                          });
                        },
                      ),
                      Text('Subscribe to Newsletter'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showSubmittedMessage();
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


 int getWordCount(String text) {
    if (text.isEmpty) return 0;
    return text.trim().split(' ').length;
  }
