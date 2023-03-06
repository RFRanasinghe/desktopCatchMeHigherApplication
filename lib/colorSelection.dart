import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorSelection extends StatefulWidget {
  const ColorSelection({Key? key}) : super(key: key);

  @override
  _ColorSelectionState createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Color Selection Activity"),
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/galaxy.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: InkWell(
              onTap: () => print("ciao"),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 900,
                    height: 600,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: Image.asset(
                        'images/blackCar.png',
                        width: 300,
                        height: 150,
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Select color of given picture'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text('Blue'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text('Black'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text('Green'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text('Yellow'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
