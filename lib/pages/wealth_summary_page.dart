import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_app/bloc/wealth_summary_bloc.dart';
import 'package:graphql_app/components/action_button.dart';
import 'package:graphql_app/components/loading_dialog.dart';
import 'package:graphql_app/models/summary.dart';
import 'package:graphql_app/style.dart';
import 'package:graphql_app/utils/alert_snack_bar.dart';
import 'package:intl/intl.dart';

class WealthSummaryPage extends StatefulWidget {
  @override
  _WealthSummaryPageState createState() => _WealthSummaryPageState();
}

class _WealthSummaryPageState extends State<WealthSummaryPage> {
  WealthSummaryBloc bloc = new WealthSummaryBloc();
  final currency = new NumberFormat("#,##0.00", "pt_BR");
  final rentability = new NumberFormat("#,###0.000", "pt_BR");

  @override
  void initState() {
    super.initState();
    _getSummary();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFE8EBF6),
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 190, right: 20, bottom: 190),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child: StreamBuilder<Summary>(
              stream: bloc.wealthSummaryStream,
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return GestureDetector(
                    onTap: () => _retryConnection(),
                    child: Container(
                      child: Icon(
                        Icons.refresh,
                        size: 180,
                        color: Styles.highLightTextColor,
                      ),
                    ),
                  );
                }
                if(snapshot.hasData){
                  var summary = snapshot.data;
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 40, 20, 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Seu resumo",
                              style: Styles.texts.titleText
                            ),
                            SvgPicture.asset(
                              "assets/images/see_more.svg",
                              semanticsLabel: 'Menu do resumo',
                              height: 30,
                              width: 30,
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                              "Valor investido",
                              style: Styles.texts.bodyText
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Text(
                              currency.format(summary.total),
                              style: Styles.texts.highLightText
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 40, 25, 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Rentabilidade/mês",
                                    style: Styles.texts.bodyText
                                ),
                                Text(
                                    "${rentability.format(summary.profitability)}%",
                                    style: Styles.texts.highLightText
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "CDI",
                                    style: Styles.texts.bodyText
                                ),
                                Text(
                                    "${currency.format(summary.cdi)}%",
                                    style: Styles.texts.highLightText
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Ganho/mês",
                                    style: Styles.texts.bodyText
                                ),
                                Text(
                                    "R\$ ${currency.format(summary.gain)}",
                                    style: Styles.texts.highLightText
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 50,
                        thickness: 1.5,
                        indent: 25,
                        endIndent: 25,
                        color: Color(0xFFE8EBF6),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 25),
                        alignment: Alignment.centerRight,
                        child: ActionButton(
                          title: "VER MAIS",
                        ),
                      )
                    ],
                  );
                }
                return CircularLoading();
              },
            )
          )
        ),
      ),
    );
  }

  void _retryConnection() {
    _getSummary();
    setState(() {});
    AlertSnackBar.show(context, "Reconectando");
  }

  void _getSummary() {
    try{
      bloc.getWealthSummary();
    } on Exception catch(e){
      AlertSnackBar.showError(context, e);
    }
  }

}
