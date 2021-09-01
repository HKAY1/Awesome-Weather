// import 'package:awesomeweather/WeatherModals/locations.dart';
// import 'package:awesomeweather/controller/helper.dart';
// import 'package:awesomeweather/Bloc/bloc.dart';
// import 'package:awesomeweather/Bloc/weather_bloc.dart';
// import 'package:awesomeweather/WeatherModals/forcast.dart';
// import 'package:awesomeweather/WeatherModals/locations.dart';
import 'package:awesomeweather/exception.dart';
// import 'package:awesomeweather/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/src/provider.dart';

class Controller{
  

  static Widget handleError({required Object error,required BuildContext context}){
    print('inside controller');
    if(error is BadException){
    String message = error.message.toString();
    return showAlertDialog(context: context,description :message);
    // Future.delayed(Duration(milliseconds: 400)); 
    }
    else if(error is FtechException){
      String message = error.message.toString();
    return showAlertDialog(context: context,description:message);
    }
    else if(error is ApiException){
      
    return showAlertDialog(context: context,description:'Oops it took longer to respond');
    }
    return showAlertDialog(context: context,description:'Something went wrong');
  }
}

 Widget showAlertDialog({required BuildContext context, required String description}){
   return Dialog(child: Container(height: 250,
    
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Error',
          ),
          Text(description,
          ),
          ElevatedButton(onPressed: () {
             Navigator.of(context).pop();
            //  context.read<WeatherBloc>().add(GetWeather());
            
          }, child: Text('okay')),
        ],
      ),
    ),
   );
    
   

  //  showDialog(context: context, builder: (BuildContext context){
  //    return AlertDialog();
  //  },);
}

// ,required Forecast forecast,required Location location