import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tifront/widget/articles/models/article_list_block_rfr_btn_model.dart';
import 'package:tifront/widget/stat/models/cells_block_rfr_btn_model.dart';
import 'package:tifront/widget/stat/models/graph_block_rfr_btn_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CellsBlockRfrBtnModel>(
    create: (context) => CellsBlockRfrBtnModel(),
  ),
  ChangeNotifierProvider<ArticleListRfrBtnModel>(
    create: (context) => ArticleListRfrBtnModel(),
  ),
  ChangeNotifierProvider<GraphBlockRfrBtnModel>(
    create: (context) => GraphBlockRfrBtnModel(),
  ),
];
