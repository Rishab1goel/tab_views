import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';


class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var temp;
  var description;
  var humidity;
  var windSpeed;

  var name;
  var age;
  var country;
  var city;
  var phno;
  var email;



  Future getBiodata() async{
    http.Response bio  = await http.get(Uri.parse("https://randomuser.me/api/"));
    var result= jsonDecode(bio.body);

    setState(() {


      this.name=result['results'][0]['name']['first'];
      this.age=result['results'][0]['dob']['age'];
      this.country=result['results'][0]['location']['country'];
     this.city=result['results'][0]['location']['city'];
      this.phno=result['results'][0]['phone'];
      this.email=result['results'][0]['email'];
    });

  }
  Future getWeather() async{
    http.Response response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Delhi&units=imperial&appid=fa72b1ea76727f58b97eea2232da4058"));
    var res= jsonDecode(response.body);
    setState(() {
      this.temp=res['main']['temp'];
      this.description=res['weather'][0]['description'];
      this.humidity=res['main']['humidity'];
      this.windSpeed=res['wind']['speed'];
    });

  }

  @override
  void initState(){

    super.initState();
    this.getWeather();
    this.getBiodata();


  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.window)),
            ],
          ),
          title: Text('Tabs View'),
        ),
        body:  TabBarView(
          children: [
            Tab(
              child:
              ListView(
                children: [
                  ListTile(
                    leading: Image.network("https://image.shutterstock.com/image-photo/name-word-made-building-blocks-260nw-516222844.jpg"),
                    title: Text(name!=null?name.toString(): "Loading..."),
                  ),
                  ListTile(
                    leading: Image.network("https://thumbs.dreamstime.com/b/circular-line-word-age-outline-icon-signs-symbols-can-be-used-web-logo-mobile-app-ui-ux-white-background-139398726.jpg"),
                    title: Text(age!=null?age.toString(): "Loading..."),
                  ),
                  ListTile(
                    leading: Image.network("https://thumbs.dreamstime.com/z/country-symbols-flags-sticker-designs-17249971.jpg"),
                    title: Text(country!=null?country.toString(): "Loading..."),
                  ),
                  ListTile(
                    leading: Image.network("https://image.shutterstock.com/image-vector/phone-number-vector-icon-flat-260nw-606092714.jpg"),
                    title: Text(phno!=null?phno.toString(): "Loading..."),
                  ),
                  ListTile(
                    leading: Image.network("https://media.istockphoto.com/vectors/city-symbol-vector-flat-icon-black-and-white-vector-id870258032"),
                    title: Text(city!=null?city.toString(): "Loading..."),
                  ),
                  ListTile(
                    leading: Image.network("https://image.shutterstock.com/image-vector/mail-icon-260nw-582940258.jpg"),
                    title: Text(email!=null?email.toString(): "Loading..."),
                  ),


      ],
              ),
            ),
            Tab(
              child: ListView(
                children: [
                  ListTile(
                    leading: Image.network("https://image.shutterstock.com/image-photo/heat-thermometer-shows-temperature-hot-260nw-691981369.jpg"),
                    title: Text(temp!=null?temp.toString(): "Loading..."),
                  ),
                  ListTile(
                    leading: Image.network("https://image.shutterstock.com/image-photo/blue-sky-clouds-background-material-260nw-1336029653.jpg"),
                    title: Text(description!=null?description.toString(): "Loading..."),
                  ),
                  ListTile(
                    leading: Image.network("https://cdn.hswstatic.com/gif/humidity-2.jpg",width: 65,),
                    title: Text(humidity!=null?humidity.toString(): "Loading..."),
                  ),
                  ListTile(
                    leading: Image.network("https://images.unsplash.com/photo-1505672678657-cc7037095e60?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8d2luZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",width: 65,),
                    title: Text(windSpeed!=null?windSpeed.toString(): "Loading..."),
                  ),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
