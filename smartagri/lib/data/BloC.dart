import 'package:smartagri/data/datasetField.dart';

import 'data_sheet_api.dart';

class BloC{

  List <DataSet> dataAll = [];
  DataSet? dataLast;



  initAPI() async {
    await DataSheetApi.init();
    print('init API success');


    dataAll= await DataSheetApi.getAll();
    dataLast=dataAll[0];
    print('API: ${dataAll[0].temperature1}');
    // return dataAll;
  }
}