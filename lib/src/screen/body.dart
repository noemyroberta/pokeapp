import 'package:flutter/material.dart';
import '../service/fetch_pokes.dart';
import '../model/poke_model.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: fetchPokes(),
        builder: (context, AsyncSnapshot<List<Poke?>?> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildItem(snapshot.data);
        },
      ),
    );
  }

  _buildItem(List<Poke?>? pokes) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: pokes!.length,
      itemBuilder: (context, int index) {
        return FittedBox(
          child: Container(
            color: Colors.white24,
            child: Column(
              children: <Widget>[
                Image.network('${pokes[index]!.imgUrl}'),
                const SizedBox(height: 12.0),
                Text('Id: ${pokes[index]!.id}'),
                Text('${pokes[index]!.name}'),
                Text('Tipo: ${pokes[index]!.type}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
