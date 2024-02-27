import 'package:flutter/material.dart';
import 'package:memeapp/controller/fetchMeme.dart';
import 'package:memeapp/controller/saveMyData.dart';

class MainScreen extends StatefulWidget {      //Mainscreen is class
   MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imgUrl = "";
  int? memeNo;
  int targetMeme = 100;
  bool isLoading = true;


  @override
  void initState(){
    super.initState();

      GetInitMemeNo();

      UpdateImg();
    
  }
  GetInitMemeNo() async{
    memeNo= await SaveMyData.fetchData() ?? 0;
    if(memeNo!>100){
      targetMeme = 500;
    }
    else if(memeNo!>500){
      targetMeme = 1000;
    }
    setState(() {

    });

  }

  void UpdateImg()async{
    String getImgUrl = await FetchMeme.fetchNewMeme();
    setState(() {           // automatically hot reload thr app
      imgUrl= getImgUrl;
      isLoading =  false;
    });

  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(                                     //we used to add widgets on screen
      backgroundColor: Colors.white,
      body: Column(                   //Column is used to add widgets column wise
        mainAxisAlignment: MainAxisAlignment.center,   // to make image positioned at center
        children: [
          SizedBox(           // to make empty space bw two widgets
            height: 140,
          ),
          Text(
            "Meme #${memeNo.toString()}",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 10,  
          ),
          Text(
            "Target ${targetMeme} Memes",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 30,
          ),
          isLoading ?
          Container(
            height: 300,              // making a constant height for the meme
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: SizedBox(
                  height: 60,
                  width: 60,
                  child:  CircularProgressIndicator())
            )
          )
          :

          Image.network(
            height: 300,              // making a constant height for the meme
              width: MediaQuery.of(context).size.width, //this statement is for screen width
              fit: BoxFit.fitHeight,
              imgUrl),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async{
                setState(() {
                  isLoading = true;
                });
                await SaveMyData.saveData(memeNo!+1);
                GetInitMemeNo();
               UpdateImg();
              },
              child: Container(
                  height: 30,
                  width: 70,
                  child: Center(
                      child: Text(
                    "NEXT",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  )))),
          Spacer(),      // add maximum space bw two widget
          Text(
            "APP CREATED BY",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Abhinav Maurya",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
