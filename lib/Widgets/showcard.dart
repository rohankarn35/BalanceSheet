import 'package:flutter/material.dart';
import 'package:flutter_x_sheet/API/sheetapi.dart';

class ShowCard extends StatefulWidget {
  const ShowCard({super.key});

  @override
  State<ShowCard> createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard> {
   String? totalbalance;
   String? totalcash;
    String? totalAmount;
    bool isLoading = true;
  void displaydata() async{
    totalbalance = await sheetapi.totalbank();
    totalAmount = await sheetapi.totaldata();
    totalcash = await sheetapi.totalcash();
    setState(() {
      sheetapi.totalbank();
      sheetapi.totaldata();
      sheetapi.totalcash();
      isLoading=false;

    });
    
  }
  @override
  void initState() {
    displaydata();
    // TODO: implement initState
    super.initState();
  }

  @override
 @override
Widget build(BuildContext context) {
  

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 170,
        width: MediaQuery.of(context).size.width,
       
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        child: InkWell(
          onTap: () async{
            setState(() {
              isLoading= true;
            });
            displaydata();
            
          },
          child: isLoading?Center(child: CircularProgressIndicator(),):Column(
            children: [
              Text('Total Balance ${totalAmount??0}'),
               Text('Balance $totalbalance'),
                Text(' Cash $totalcash'),
        
            ],
          ),
        ),
      ),
    ],
  );
}

}