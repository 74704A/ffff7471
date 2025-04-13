import 'package:flutter/material.dart';
import 'settings_page.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, String> userData = {
    "First Name": "Azhar",
    "Last Name": "Bekbussinova",
    "Email": "Azhar@example.com",
    "Phone": "+7 700 777 7777",
    "Address": "Mangilik el, 51"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage()));
              },
              child: Icon(Icons.settings, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Avatar and Name block
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage("https://via.placeholder.com/150"),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "johndoe@example.com",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 30),

          // User Data Section
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: userData.entries.map((entry) => _buildInfoTile(entry.key, entry.value)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        children: [
          Icon(_getIconForLabel(title), color: Colors.blueAccent),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                SizedBox(height: 2),
                Text(value,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          )
        ],
      ),
    );
  }

  IconData _getIconForLabel(String label) {
    switch (label) {
      case "Email":
        return Icons.email;
      case "Phone":
        return Icons.phone;
      case "Address":
        return Icons.home;
      case "First Name":
        return Icons.badge;
      case "Last Name":
        return Icons.badge_outlined;
      default:
        return Icons.info_outline;
    }
  }
}
