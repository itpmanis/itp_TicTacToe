import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  //__________________________________________________LINK IMAGE
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage cross = AssetImage('images/cross.png');
  AssetImage edit = AssetImage('images/edit.png');
  //__________________________________________________VARIABLE DECLARE
  bool isCross = true;
  String message;
  List<String> gameState;
  //__________________________________________________Initial state empty
  @override
  void initState() {
    super.initState();
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  //____________________________________________________Play Game method
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross =
            !this.isCross; //flip garxa, circle then cross, cross then circle
        this.checkWin();
      });
    }
  }

  //____________________________________________________Get image method
  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  //____________________________________________________Win logic
  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      //0 win msg
      setState(() {
        this.message = "${this.gameState[0]} win";
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      //3 win msg
      setState(() {
        this.message = "${this.gameState[3]} win";
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      //6 win msg
      setState(() {
        this.message = "${this.gameState[6]} win";
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      //0 win msg
      setState(() {
        this.message = "${this.gameState[0]} win";
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      //1 win msg
      setState(() {
        this.message = "${this.gameState[1]} win";
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      //2 win msg
      setState(() {
        this.message = "${this.gameState[2]} win";
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      //2 win msg
      setState(() {
        this.message = "${this.gameState[2]} win";
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      //0 win msg
      setState(() {
        this.message = "${this.gameState[0]} win";
      });
    }
  }

  //____________________________________________________Reset game
  resetGame() {
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: gameState.length,
                itemBuilder: (context, i) => SizedBox(
                  height: 100,
                  width: 100,
                  child: MaterialButton(
                    onPressed: () {
                      this.playGame(i);
                    },
                    child: Image(
                      image: this.getImage(this.gameState[i]),
                    ),
                  ),
                ),
              ),
            ),
            //__________________________________________________win msg show garxa
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Text(this.message),
            ),
            SizedBox(
              height: 50,
            ),
            //_____________________________________________________reset game
            MaterialButton(
              onPressed: resetGame,
              color: Colors.yellow,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text("Reset Game"),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
