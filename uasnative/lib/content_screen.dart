import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_screen.dart';

class ContentScreen extends StatelessWidget {
  Future<Map<String, String>> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? email = prefs.getString('email');
    return {
      'username': username ?? 'No Username',
      'email': email ?? 'No Email',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () async {
              Map<String, String> userData = await _getUserData();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    username: userData['username']!,
                    email: userData['email']!,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Welcome to the online bookstore!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Featured Books',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildBookCard(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDRH2qad1VLV3KAK5ghTxoj3HF10VPMnXBLSaSfXdP2vfiT3J7sBwdXI9UIhhDmO0LiEw&usqp=CAU', // Replace with a valid image URL
                      title: 'Men`s Search For Meaning',
                      author: 'Viktor Frankl',
                      price: '\$14.97',
                      year: '1946',
                    ),
                    _buildBookCard(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWEHe7kQdrGzCzLK20FNPJNluKbJlHuyHbq0z5GRyQfSBEHVrHh2npsRY4G4ItI213pLU&usqp=CAU', // Replace with a valid image URL
                      title: 'To Kill A Mockingbird',
                      author: 'Harper Lee',
                      price: '\$15.75',
                      year: '1960',
                    ),
                    _buildBookCard(
                      imageUrl:
                          'https://qph.cf2.quoracdn.net/main-qimg-02449b4b9f86998d8ab9bbe9326d3739-lq', // Replace with a valid image URL
                      title: 'The Subtle Art Of Not Giving AF',
                      author: 'Mark Manson',
                      price: '\$21.10',
                      year: '2016',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookCard({
    required String imageUrl,
    required String title,
    required String author,
    required String price,
    required String year,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 150,
              width: 100,
              fit: BoxFit.cover, // Make the image fit the card
            ),
            SizedBox(height: 10),
            Text(
              'Title: $title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Author: $author',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Price: $price',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Year: $year',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
