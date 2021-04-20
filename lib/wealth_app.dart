import 'package:flutter/material.dart';
import 'package:graphql_app/pages/wealth_summary_page.dart';
import 'package:graphql_app/style.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:graphql/client.dart';

GraphQLClient graphQLClient;

class WealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Wealth and GraphQL',
      theme: ThemeData(
        fontFamily: Styles.fonts.defaultFontFamily,
      ),
      home: WealthSummaryPage(),
    );
  }
}

class AppConfig{
  init() async {
    await DotEnv.load(fileName: ".env");
    _configureGraphQL();
  }

  _configureGraphQL() {
    String endpoint = DotEnv.env["API_URL"];
    String secret = DotEnv.env["SECRET"];
    final Map<String, String> headers = {
      "x-hasura-admin-secret": secret,
    };
    final _httpLink = HttpLink(
        endpoint,
        defaultHeaders: headers
    );
    final _authLink = AuthLink(
      getToken: () async => '$secret',
    );
    Link _link = _authLink.concat(_httpLink);
    graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }
}