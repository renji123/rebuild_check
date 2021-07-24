import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rebuild_check/provider/new_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewProvider(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;
  final GlobalKey _listViewKey =  GlobalKey();

  @override
  Widget build(BuildContext context) {
    print('rebuild ${i++}');
    final provider = Provider.of<NewProvider>(context);
    return Scaffold(
      body: ListView.builder(
        key: _listViewKey,
          itemCount: provider.newModelList.length,
          itemBuilder: (context, i) {
            print('builder rebuild');
            return ChangeNotifierProvider<NewModel>.value(
                value: provider.newModelList[i],
                child: NewItem());
          }),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
          print('isSelected ${provider.newModelList[1].isSelected}');
      },),
    );
  }
}

class NewItem extends StatelessWidget {

  const NewItem({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewModel>(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(model.title.toString()),
          Checkbox(
              value: model.isSelected,
              onChanged: (val) {
              model.checkChanger();
              })
        ],
      ),
    );
  }
}
