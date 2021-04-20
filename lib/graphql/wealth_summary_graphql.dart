import 'package:graphql/client.dart';
import 'package:graphql_app/main.dart';
import 'package:gql/language.dart';

class WealthSummaryGraphQL {

  Future<QueryResult> get() async {
    try{
      var queryOptions = QueryOptions(
          document: parseString(
              r'''
              query MyQuery {
                wealthSummary {
                  id
                  profitability
                  total
                  hasHistory
                  gain
                  cdi
                }
              }
        '''
          )
      );
      var result = await graphQLClient.query(queryOptions);
      return result;
    } on Exception catch(e){
      throw e;
    }

  }
}