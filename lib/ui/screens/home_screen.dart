import 'package:flutter/material.dart';
import 'package:notnetflix/repositories/data_repository.dart';
import 'package:notnetflix/services/api_service.dart';
import 'package:notnetflix/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notnetflix/models/movie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void getMovies()  async{
   final dataProvider= Provider.of<DataRepository>(context,listen: false);
   await dataProvider.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider= Provider.of<DataRepository>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: Image.asset(
          'assets/images/Netflix.png',
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 15),
          Container(
            height: 500,
            color: Colors.red,
            child: dataProvider.popularMovieList.isEmpty
                ? const Center()
                : Image.network(dataProvider.popularMovieList[0].posterURL(), fit: BoxFit.cover),
          ),
          const SizedBox(height: 15),
          Text('Tendancs actuelles',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 15),
          SizedBox(
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 110,
                    //color: Colors.yellow,
                    child: Center(
                        child:  dataProvider.popularMovieList.isEmpty
                            ? Center(
                                child: Text(index.toString()),
                              )
                            : Image.network(dataProvider.popularMovieList[index].posterURL(),
                             fit: BoxFit.cover
                            ),
                           
                             
                            
                            ),
                           
                  );
                }),
          ),
          SizedBox(height: 15),
          const SizedBox(height: 15),
          Text('Actuellement en cinéma',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 15),
          SizedBox(
            height: 320,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 220,
                    color: Colors.blue,
                    child: Center(
                      child: Text(index.toString()),
                    ),
                  );
                }),
          ),
          SizedBox(height: 15),
          const SizedBox(height: 15),
          Text('Ils arrivent bientôt',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 15),
          SizedBox(
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 110,
                    color: Colors.green,
                    child: Center(
                      child: Text(index.toString()),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
