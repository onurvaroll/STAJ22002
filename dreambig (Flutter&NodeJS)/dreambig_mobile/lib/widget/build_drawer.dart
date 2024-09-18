import 'package:flutter/material.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/dreambig_logo.png',
                  width: 150,
                  height: 150,
                ),
                const Text(
                  "Gelecek\nDream\nBig'de",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.business,color: Colors.indigo),
            title: const Text('Kurumsal',style: TextStyle(color: Colors.indigo,fontSize: 20),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.school,color: Colors.indigo),
            title: const Text('Yurt Dışında Üniversite Bul',style: TextStyle(color: Colors.indigo,fontSize: 20)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.school,color: Colors.indigo),

            title: const Text('Türkiye Üniversiteleri',style: TextStyle(color: Colors.indigo,fontSize: 20)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.document_scanner_rounded,color: Colors.indigo,),

            title: const Text('Tüm Bloglar',style: TextStyle(color: Colors.indigo,fontSize: 20)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone_in_talk,color: Colors.indigo),
            title: const Text('Dream Big Talks',style: TextStyle(color: Colors.indigo,fontSize: 20)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone_outlined,color: Colors.indigo),
            title: const Text('İletişim',style: TextStyle(color: Colors.indigo,fontSize: 20)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
