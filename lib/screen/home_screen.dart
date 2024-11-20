import 'package:flutter/material.dart';
import '../weather_service.dart';
import '../models/weather.dart';
import 'package:project/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherService weatherService = WeatherService();
  Weather? weather;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    try {
      final weatherData = await weatherService.fetchWeather('Islamabad');
      setState(() {
        weather = Weather.fromJson(weatherData);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftDrawer(),
      appBar: AppBar(
        title: const Text('Layouts', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.cloud_queue), onPressed: () {})
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
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
                  const Divider(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/product-list');
                    },
                    child: const Text('View Products'),
                  ),
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
      image: AssetImage('assets/images/image4.png'),
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
          'It\'s going to be a great birthday. We are going out for dinner at my favorite place...',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildJournalWeather() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (weather != null) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.wb_sunny, color: Colors.orange),
                ],
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${weather!.city}: ${weather!.temperature}°C', style: TextStyle(color: Colors.blue)),
                  Text(weather!.description, style: TextStyle(color: Colors.red)),
                ],
              ),
            ],
          ),
        ] else ...[
          CircularProgressIndicator(),
        ],
      ],
    );
  }

  Wrap _buildJournalTags() {
    return Wrap(
      spacing: 8.0,
      children: List.generate(7, (int index) {
        return Chip(
          label: Text('Gift ${index + 1}', style: const TextStyle(fontSize: 10.0)),
          avatar: Icon(Icons.card_giftcard, color: Colors.blue.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: const BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }

  Row _buildJournalFooterImages() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment .start,
      children: <Widget>[
        CircleAvatar(backgroundImage: AssetImage('assets/images/background.png'), radius: 40.0),
        CircleAvatar(backgroundImage: AssetImage('assets/images/B1.jpg'), radius: 40.0),
        CircleAvatar(backgroundImage: AssetImage('assets/images/B2.jpg'), radius: 40.0),
        SizedBox(
          width: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.cake),
              Icon(Icons.star_border),
              Icon(Icons.music_note),
            ],
          ),
        ),
      ],
    );
  }
}