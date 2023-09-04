import 'package:flutter/material.dart';
import 'package:flutter_x_sheet/assets/credential.dart';
import 'package:flutter_x_sheet/model/user.dart';
import 'package:gsheets/gsheets.dart';

class sheetapi {
  static const _credentials = private_keys.cloud_credetails;
  static final _speadsheetId = private_keys.keyId;
  static final _gsheet = GSheets(_credentials);
  static Worksheet? _userSheet;
  static Future init() async {
    try {
      final spreadsheet = await _gsheet.spreadsheet(_speadsheetId);
    _userSheet = await _getWorkSheet(spreadsheet, title: 'test123');
    final firstRow = UserFields.getFields();
    _userSheet!.values.insertRow(1, firstRow);
    _userSheet!.values.insertValue('=SUM(D2,E2)', column: 3, row: 2);
    _userSheet!.values.insertValue('=SUM(B2,0)-SUM(F2:F)+SUM(G2:G)', column: 4, row: 2);
    _userSheet!.values.insertValue('=SUM(A2,0)-SUM(J2:J)+SUM(K2:K)', column: 5, row: 2);

      
    } catch (e) {
      print("\nError Initializing!! $e");
      
    }
  }

  static _getWorkSheet<Worksheet>(Spreadsheet spreadsheet,
      {required String title}) async {
        try {
          return await spreadsheet.addWorksheet(title);
          
        } catch (e) {
          return await spreadsheet.worksheetByTitle(title);
          
        }
    
  }
  static Future insert(cashbalance,bankbanalce) async{

  //  _userSheet!.values.map.appendRows(rowList);
   _userSheet!.values.insertValue(cashbalance, column: 1, row: 2);
    _userSheet!.values.insertValue(bankbanalce, column: 2, row: 2);
  }
  static int currentRow = 2;
  static Future<int> incrementRow()async{
     currentRow++;
     return currentRow;
  }
 static Future<String?> getdata(int row) async{

    var datas = await _userSheet?.values.value(column: 6, row: row);
   return datas;
  }
  static Future<String?> totaldata() async{
    var datas = await _userSheet?.values.value(column: 3, row: 2);
    return datas;
  }  
   static Future<String?> totalcash() async{
    var datas = await _userSheet?.values.value(column: 4, row: 2);
    return datas;
  } 
  static Future<String?> totalbank() async{
    var datas = await _userSheet?.values.value(column: 5, row: 2);
    return datas;
  } 

}
