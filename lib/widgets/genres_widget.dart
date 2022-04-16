import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class GenresWidget extends StatelessWidget {
  GenresWidget({Key? key, required this.genresList, required this.id}) : super(key: key);

  final List<dynamic> genresList;
  final int id;
  late String text;

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    for(int i = 0; i<genresList.length; i++){
      if(genresList[i].id == id){
        text = genresList[i].name;
        break;
      }
      else{
        text = '';
      }
    }

    return text.isEmpty ? Container() : Container(
      padding: EdgeInsets.only(top: screenHeight * (10 / 781), left: screenWidth * (20 / 393), right: screenWidth * (20 / 393), bottom: screenHeight * (10 / 781)),
      child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontSize: screenWidth * (16 / 393)),)),
      decoration: BoxDecoration(
          color: AppColors.widgetColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                offset: Offset(0, 5),
                color: Colors.black.withOpacity(0.2)
            )
          ],
          borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
