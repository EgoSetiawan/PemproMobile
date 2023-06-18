import 'package:flutter/material.dart';
import 'package:pariwisata_flutter/view/screen/map_screen.dart';
import '../../model/home/home_model.dart';
import '../../theme/theme.app.dart';

class DetailScreen extends StatelessWidget {
  final TouristSite touristSite;

  const DetailScreen({Key? key, required this.touristSite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(touristSite.touristSitesName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              touristSite.touristSitesName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 16),
            // Text(
            //   'Location: ${touristSite.lan}',
            //   style: TextStyle(
            //     fontSize: 16,
            //   ),
            // ),
            SizedBox(height: 16),
            Image.network(
              touristSite.photoUrl,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(touristSite.touristSitesDescription),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapScreen(
                                locationLatitude: touristSite.lan,
                                locationLongtitude: touristSite.lon,
                              )));
                },
                style: ElevatedButton.styleFrom(
                  primary: greenColor,
                  onPrimary: Colors.white,
                ),
                child: Container(
                    width: double
                        .infinity, // Mengatur lebar Container agar mengisi seluruh parent
                    child: Center(
                      child: Text("GET LOCATION"),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
