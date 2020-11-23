import 'dart:math';

class CellsDataModel {
  /// Internal, private state of the cart.
  List<CellData> dataCellsList = [];
  Random random = Random();

  CellsDataModel() {
    dataCellsList.clear();
    for (int i = 0; i < 6; i++) {
      dataCellsList
          .add(CellData(title: "今日采集量", number: '${random.nextInt(1000000)}'));
    }
  }


  void getDataFromServer() {
    dataCellsList.clear();
    for (int i = 0; i < 6; i++) {
      dataCellsList
          .add(CellData(title: "今日采集量", number: '${random.nextInt(1000000)}'));
    }
  }

  /// 从服务器拉取数据
  Future updateData() async {
    print("从服务器拉取数据...");
    dataCellsList.clear();
    getDataFromServer();
  }

  CellData getCellData(int index) => this.dataCellsList[index];
}

class CellData {
  final String title;
  final String number;

  CellData({this.title, this.number});
}
