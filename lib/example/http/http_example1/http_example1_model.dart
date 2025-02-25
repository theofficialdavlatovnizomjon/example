class HttpExample1Model {
  String? title;
  String? code;
  String? cbPrice;
  String? nbuBuyPrice;
  String? nbuCellPrice;
  String? date;

  HttpExample1Model({
    this.title,
    this.code,
    this.cbPrice,
    this.nbuBuyPrice,
    this.nbuCellPrice,
    this.date,
  });

  static HttpExample1Model fromJson(json) => HttpExample1Model(
        title: json['title'],
        code: json['code'],
        cbPrice: json['cb_price'],
        nbuBuyPrice: json['nbu_buy_price'],
        nbuCellPrice: json['nbu_cell_price'],
        date: json['date'],
      );
}
