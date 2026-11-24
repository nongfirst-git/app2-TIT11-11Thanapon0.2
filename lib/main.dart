
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Social Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFollowing = false;
  int followers = 1500000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TIT1/1_11',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          // ส่วนโปรไฟล์
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // รูปโปรไฟล์
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(
                    'assets/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-vector-illustration_561158-3383.avif',
                  ),
                ),

                const SizedBox(width: 25),

                // จำนวนโพสต์ ผู้ติดตาม กำลังติดตาม
                Expanded(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: [
                      buildStat('3', 'โพสต์'),
                      buildStat('1', 'ผู้ติดตาม'),
                      buildStat('50M', 'กำลังติดตาม'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ชื่อและคำแนะนำตัว
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  'ชื่อ นาย ธนพล ประสูติ ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'นักพัฒนาแอปพลิเคชัน Flutter',
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  'สร้างสรรค์สิ่งใหม่ ๆ ด้วยแชท GPT 55555555  💙',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),

          // ปุ่มติดตามและข้อความ
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFollowing = !isFollowing;
                        followers += isFollowing ? 1 : -1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      isFollowing ? 'กำลังติดตาม' : 'ติดตาม',
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text('ส่งข้อความ'),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('ข้อความ'),
                  ),
                ),
              ],
            ),
          ),

          // แถบไอคอน
          const Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.grid_on,
                  size: 25,
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.person_outline,
                  size: 25,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // รูปภาพผลงาน 3 ภาพ
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 1,
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYF2jXvkfeAo5vasXrfCC9AXgDhn3Ap_zStwqBBDVjYg&s ',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://copacabanagroup.com/wp-content/uploads/2025/06/shutterstock_2245841725.jpg',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://f.ptcdn.info/146/028/000/1423136047-1024655150-o.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget แสดงจำนวนสถิติ
  Widget buildStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}
