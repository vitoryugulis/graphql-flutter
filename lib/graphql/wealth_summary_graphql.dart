import 'package:graphql/client.dart';
import 'package:gql/language.dart';
import 'package:graphql_app/wealth_app.dart';

class WealthSummaryGraphQL {

  Future<QueryResult> get() async {
    try{
      var queryOptions = QueryOptions(
          document: parseString(
              r'''
              query GetSummary {
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