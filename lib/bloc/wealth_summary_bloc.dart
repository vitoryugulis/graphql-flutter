import 'dart:async';

import 'package:graphql_app/graphql/wealth_summary_graphql.dart';
import 'package:graphql_app/models/summary.dart';

class WealthSummaryBloc {
  WealthSummaryGraphQL graphql = new WealthSummaryGraphQL();
  String resource = "wealthSummary";
  final _wealthSummaryController = StreamController<Summary>.broadcast();
  Stream<Summary> get wealthSummaryStream => _wealthSummaryController.stream;

  Future<Summary> getWealthSummary() async {
    try{
      var result = await graphql.get();
      if(result.isConcrete){
        if(result.data == null)
          throw new Exception("could not retrieve data");
        List<Object> data = result.data[resource];
        var summary = Summary.fromJson(data[0]);
        _wealthSummaryController.sink.add(summary);
        return summary;
      }
      var exception = new Exception("could not retrieve data");
      _wealthSummaryController.sink.addError(exception);
      throw exception;
    } on Exception catch(e) {
      _wealthSummaryController.sink.addError(e);
      throw e;
    }
  }

  dispose(){
    _wealthSummaryController.close();
  }
}
