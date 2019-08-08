import 'package:flutter/material.dart';

import 'SelectionScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Returning Data Demo'),
      ),
      body: Center(child: SelectionButton()),
    );
  }
}

class SelectionButton extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return RaisedButton(
      onPressed: (){
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option,any option!'),
    );
  }


  // Amethod that launches the Selection Screen ans awaits the result from
  // NAvigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> SelectionScreen()),
    );

    // After the Selection Screen returns a result , hide any previous snakebars
    // and show the new result
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }

}
