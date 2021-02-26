import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wclone/provider/appState.dart';
import '../styles/colors.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

// Future<void> getSelectedValue() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int radioValue = prefs.getInt('radio.value');

// }

enum Themes { light, dark }

class _SettingsState extends State<Settings> {
  ValueNotifier<Themes> _selectedItem = new ValueNotifier<Themes>(Themes.light);
  int _crtIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 5.0,
        title: Text('Chats'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Display',
              style: TextStyle(color: primaryColor),
            ),
            Center(
              child: Switch(
                value: Provider.of<AppStates>(context).theme == ThemeType.DARK,
                onChanged: (value) {
                  Provider.of<AppStates>(context, listen: false).theme =
                      value ? ThemeType.DARK : ThemeType.LIGHT;
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    //barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text('Themes'), content: showAlertDialog());
                    });
              },
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.cloudMoon),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Theme',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showAlertDialog() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  _myRadioButton(
                    title: "Light",
                    value: 0,
                    onChanged: (value) {
                      Provider.of<AppStates>(context, listen: false).theme =
                          value ? ThemeType.DARK : ThemeType.LIGHT;
                      Navigator.of(context).pop();
                    },
                    // onChanged: (newValue) =>
                    //     setState(() => _crtIndex = newValue),
                  ),
                  _myRadioButton(
                    title: "Dark",
                    value: 1,
                    // onChanged: (newValue) =>
                    //     setState(() => _crtIndex = newValue),

                    onChanged: (value) {
                      Provider.of<AppStates>(context, listen: false).theme =
                          value ? ThemeType.DARK : ThemeType.LIGHT;
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
              // FlatButton(
              //     child: Text('Dark'),
              //     onPressed: () async {
              //       SharedPreferences prefs =
              //           await SharedPreferences.getInstance();

              //       // Navigator.of(context).pop();
              //     }),
              // FlatButton(
              //     child: Text('Light'),
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     })
            ])
      ],
    );
  }

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: Provider.of<AppStates>(context).theme == ThemeType.DARK,
      groupValue: _crtIndex,
      onChanged: onChanged,
      title: Text(title),
    );
  }
}
