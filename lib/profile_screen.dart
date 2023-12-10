import 'package:flutter/material.dart';

List<Map<String, dynamic>> listCategory = [
  {
    'title': 'Wallet',
    'backgroundColor': Colors.amberAccent,
    'categoryIcon': Icons.currency_exchange_outlined
  },
  {
    'title': 'Delivery',
    'backgroundColor': Colors.cyan,
    'categoryIcon': Icons.delivery_dining
  },
  {
    'title': 'Chat',
    'backgroundColor': Colors.blueAccent,
    'categoryIcon': Icons.chat
  },
  {
    'title': 'Secury',
    'backgroundColor': Colors.indigoAccent,
    'categoryIcon': Icons.security_rounded
  }
];

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'User Profile',
              style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Playball',
                  fontWeight: FontWeight.bold),
            ),
            profileCard(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    listCategory.length,
                    (index) => categoryMenu(
                        title: listCategory[index]['title'],
                        categoryIcon: listCategory[index]['categoryIcon'],
                        backgroundColor: listCategory[index]
                            ['backgroundColor'])),
              ),
            ),
            menuCard(
                title: 'Address',
                backgroundColor: Colors.blueAccent,
                subTitle: 'Your home address',
                menuIcon: Icons.location_on),
            menuCard(),
            menuCard()
          ],
        ),
      ),
    );
  }

  Widget profileCard() {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          menuCard(
            backgroundCardColor: Colors.blue,
            backgroundImage:
                'https://scontent.fpnh18-2.fna.fbcdn.net/v/t39.30808-6/370041463_1096672014830844_8286648424760776003_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEIKZe5rpk8GZ-691ivhZA6-kgILtlrcUz6SAgu2WtxTGxGjH7RjqkBqEgkWyowGHGg9IIOAm5HPpwcu5kTlAG7&_nc_ohc=l6AA7Jf8Mg8AX-Olhg5&_nc_zt=23&_nc_ht=scontent.fpnh18-2.fna&oh=00_AfCt1JpzcjzFDFr-LgczTo0jvspx38H2sJDQTRRCBrGgIQ&oe=657B02F7',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('4444'),
                    Text('3245'),
                    Text('0803'),
                    Text('90999'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('C Pro'),
                    Text('C++ '),
                    Text('C# Pro'),
                    Text('Java'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryMenu({
    String? title,
    Color? backgroundColor,
    IconData? categoryIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: backgroundColor ?? Colors.brown,
            maxRadius: 30,
            child: Center(
              child: Icon(categoryIcon ?? Icons.favorite),
            ),
          ),
          Text(title ?? 'Favorte ')
        ],
      ),
    );
  }

  Widget menuCard(
      {String? title,
      String? subTitle,
      Color? backgroundColor,
      Color? backgroundCardColor,
      IconData? menuIcon,
      String? backgroundImage}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundCardColor ?? Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: backgroundColor ?? Colors.blueGrey,
                  maxRadius: 30,
                  backgroundImage: backgroundImage != null
                      ? NetworkImage(backgroundImage)
                      : null,
                  child: backgroundImage != null
                      ? const SizedBox()
                      : Center(
                          child: Icon(
                            menuIcon ?? Icons.settings,
                            size: 30,
                          ),
                        ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'Settings',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subTitle ?? 'General setting app',
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
