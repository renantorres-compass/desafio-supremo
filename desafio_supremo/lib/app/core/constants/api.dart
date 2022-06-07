abstract class Api {
  static const baseUrl = "https://bank-statement-bff.herokuapp.com/";

  static const String myBalanceEndpoint = "myBalance";

  static const String myStatementEndpoint = "/myStatement/:limit/:offset";
}
