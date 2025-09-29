import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView( // Ensures content is scrollable
          padding: EdgeInsets.all(16.0), // Padding around all content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Picture
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black38,
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5))
                  ],
                ),
                child: ClipOval(
                    child: Image.network(
                      'https://yt3.googleusercontent.com/ytc/AIdro_kQFQKAvUvEKH9qCIpryzJgcPOvD2Sqa8oKy6LZqALHnw=s900-c-k-c0x00ffffff-no-rj',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.person, size: 100, color: Colors.grey); // Placeholder on error
                      },
                    )
                ),
              ),
              SizedBox(height: 20),
              // Name
              Text(
                'Global Reciprocal College',
                textAlign: TextAlign.center, // Center text if it wraps
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              // About Us Section
              SizedBox(height: 30),
              _buildInfoCard(
                title: 'About us:',
                content: 'Touching Hearts, Renewing Minds, Transforming Lives',
              ),

              // Mission Section
              SizedBox(height: 30),
              _buildInfoCard(
                title: 'MISSION',
                content: 'GRC is creating a culture for successful, socially responsible, morally upright skilled workers and highly competent professionals through values-based quality education.',
              ),

              // Vision Section
              SizedBox(height: 30),
              _buildInfoCard(
                title: 'VISION',
                content: 'A global community of excellent individuals with values.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build the info cards to reduce code duplication
  Widget _buildInfoCard({required String title, required String content}) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 10), // Margin for the cards
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 3)
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.redAccent[700],
              height: 1.5,
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );

  }
}

