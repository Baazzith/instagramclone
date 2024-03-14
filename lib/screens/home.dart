import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Stories
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFE040FB),
                            Color(0xFF9C27B0),
                          ],
                        ),
                      ),
                      child: ClipOval(
                        child: Container(
                          padding: const EdgeInsets.all(
                              2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors
                                  .transparent,
                              width: 2.0,
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 180, 17, 36),
                                Color.fromARGB(255, 195, 229, 6),
                              ],
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                            NetworkImage('https://via.placeholder.com/150'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 10,
                        backgroundImage: NetworkImage('https://via.placeholder.com/350x150'),
                      ),
                      title: Text('baazzith'),
                    ),

                    Image.network(
                      'data:image/jpeg;base64,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',
                      height: 350,
                      fit: BoxFit.cover,
                    ),

                    const Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.favorite_border),
                              SizedBox(width: 4.0),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.chat_bubble_outline),
                              SizedBox(width: 4.0),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.near_me),
                              SizedBox(width: 4.0),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Awesome Post',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4.0),
                          GestureDetector(
                            onTap: () {
                            },
                            child: const Text(
                              'View all 10 comments',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'reel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation based on the selected index
        },
      ),
    );
  }
}