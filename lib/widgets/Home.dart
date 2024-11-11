import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Layouts',
          style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.cloud_queue), onPressed: () {})
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildJournalHeaderImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildJournalEntry(),
                  const Divider(),
                  _buildJournalWeather(),
                  const Divider(),
                  _buildJournalTags(),
                  const Divider(),
                  _buildJournalFooterImages(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Image buildJournalHeaderImage() {
    return const Image(
      image: AssetImage('assets/images/images4.png'),
      fit: BoxFit.cover,
    );
  }

  Column _buildJournalEntry() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'My Birthday',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Text(
          'Its going to be a great birthday. We are going out for dinner at my favorite place then watch a movie after we go to the gelateria for ice cream and espresso.',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Row _buildJournalWeather() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.wb_sunny,
              color: Colors.orange,
            ),
          ],
        ),
        SizedBox(width: 16.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '81° Clear',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '4500 San Alpho Drive, Dallas, TX United States',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
  Wrap _buildJournalTags() {
    return Wrap ( spacing: 8.0,
      children: List.generate (7, (int index) {
        return Chip(
            label: Text ( 'Gift ${index + 1}',
              style: const TextStyle (fontSize: 10.0), ),
            avatar: Icon( Icons.card_giftcard,
              color: Colors.blue.shade300, ),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0), side: const BorderSide (color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
        );
      }
      ),
    );
  }
  Row _buildJournalFooterImages() {
    return const Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
    CircleAvatar (
    backgroundImage: AssetImage('assets/images/background.png'),
    radius: 40.0,
    ),
    CircleAvatar (
    backgroundImage: AssetImage('assets/images/B1.jpg'), radius: 40.0,
    ),
    CircleAvatar (
    backgroundImage: AssetImage('assets/images/B2.jpg'),
    radius: 40.0,
    ),
    SizedBox(
    width: 100.0,
    child: Column (
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget> [
    Icon(Icons.cake),
    Icon (Icons.star_border),
    Icon (Icons.music_note),
    //Icon(Icons.movie),
],
    ),
    ),
    ],
    );
}
}