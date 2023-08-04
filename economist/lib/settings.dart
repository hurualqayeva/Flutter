import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  bool isDarkModeEnabled = false; // Replace with your theme management logic
  String textSize = 'Medium'; // Replace with your text size management logic
  bool downloadNewEditions = true; // Replace with your download management logic
  bool backgroundDownloadsWiFi = true; // Replace with your background download management logic for Wi-Fi
  bool backgroundDownloadsMobile = true; // Replace with your background download management logic for mobile data
  bool enableNotifications = true; // Replace with your notifications management logic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Go back to the previous page
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          ListTile(
            title: Text('Display'),
            trailing: Switch(
              value: isDarkModeEnabled,
              onChanged: (newValue) {
                // Handle switching between light and dark mode here.
                // You can use a state management solution (e.g., Provider, BLoC) to manage the app's theme.
              },
            ),
          ),
          ListTile(
            title: Text('Text Size'),
            trailing: DropdownButton<String>(
              value: textSize,
              onChanged: (newValue) {
                // Handle text size selection change
                // You can use a state management solution to save the user's preference for text size.
              },
              items: <String>['Small', 'Medium', 'Large']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Download New Editions'),
            trailing: Switch(
              value: downloadNewEditions,
              onChanged: (newValue) {
                // Handle toggling download new editions here.
                // You can use a state management solution to manage the download status.
              },
            ),
          ),
          ListTile(
            title: Text('Background Downloads (Wi-Fi)'),
            trailing: Switch(
              value: backgroundDownloadsWiFi,
              onChanged: (newValue) {
                // Handle toggling background downloads (Wi-Fi) here.
                // You can use a state management solution to manage the background download status.
              },
            ),
          ),
          ListTile(
            title: Text('Background Downloads (Mobile Data)'),
            trailing: Switch(
              value: backgroundDownloadsMobile,
              onChanged: (newValue) {
                // Handle toggling background downloads (Mobile Data) here.
                // You can use a state management solution to manage the background download status.
              },
            ),
          ),
          ListTile(
            title: Text('Notifications'),
            trailing: Switch(
              value: enableNotifications,
              onChanged: (newValue) {
                // Handle toggling notifications here.
                // You can use a state management solution to manage the notification status.
              },
            ),
          ),
          Divider(),
          ListTile(
            
            title: Text('About'),
            onTap: () {
              // Handle "About" page navigation here.
            },
          ),
          ListTile(
            title: Text('Terms of Use'),
            onTap: () {
              // Handle "Terms of Use" page navigation here.
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {
              // Handle "Privacy Policy" page navigation here.
            },
          ),
          ListTile(
            title: Text('Contact Us'),
            onTap: () {
              // Handle "Contact Us" page navigation here.
            },
          ),
        ],
      ),
    );
  }
}
