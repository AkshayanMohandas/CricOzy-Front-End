import 'package:best_flutter_ui_templates/weather/constanst.dart';
import 'package:best_flutter_ui_templates/weather/current_weather.dart';
import 'package:best_flutter_ui_templates/weather/more_info.dart';
import 'package:best_flutter_ui_templates/weather/weather_api_client.dart';
import 'package:best_flutter_ui_templates/weather/weather_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //
  WeatherApiClient weatherapi = WeatherApiClient();
  WeatherModel? data;
  //
  Future<void> getData(String? location) async {
    data = await weatherapi.getCurrentWeather(location);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                  BlendMode.darken),
              filterQuality: FilterQuality.high,
              image: AssetImage("assets/images/weather1.gif"),
              fit: BoxFit.cover,
            ),
          ),
          width: w,
          height: h,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: loadedData(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder<void> loadedData() {
    return FutureBuilder(
      // Zanjan , Toronto, Yakutsk, las vegas, miami
      future: getData("miami"),
      builder: (ctx, snp) {
        if (snp.connectionState == ConnectionState.done) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              currentWeather(
                  onPressed: () {
                    setState(() {
                      loadedData();
                    });
                  },
                  temp: "${data!.temp}",
                  location: "${data!.cityName}",
                  status: "${data!.status}",
                  country: "${data!.country}"),
              moreInfo(
                  wind: "${data!.wind}",
                  humidity: "${data!.humidity}",
                  feelsLike: "${data!.feelsLike}")
            ],
          );
        } else if (snp.connectionState == ConnectionState.waiting) {
          return Center(
            child: CupertinoActivityIndicator(
              radius: 20,
              color: Color.fromARGB(255, 172, 216, 247),
            ),
          );
        }
        return Container();
      },
    );
  }
}
