import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jogoforca2/models/database.dart';
import 'package:jogoforca2/models/word.dart';
import '../widgets/responsivity.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  int changes = 0;
  String clue = "";
  late final Word wordChoosed;
  late final List<String> acurretLetters = [];
  late final List<Widget> occultWord;
  late final List<String> incorrectChooseList = [];
  late final List<Widget> incorrectChoose = [];

  @override
  void initState() {
    wordChoosed = Database().getRandomWord;
    occultWord = wordChoosed.word.split("").map((e) => Text(
      '_',
      style: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold
      ),
    )).toList();
    print(wordChoosed.word);
    super.initState();
  }


  bool get finishChances {
    if(incorrectChooseList.length == 6 || acurretLetters.length == wordChoosed.word.length) {
      return false;
    } else {
      return true;
    }
  }

  Widget finalMensage() {
    if(acurretLetters.length == wordChoosed.word.length) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Jogo da Forca"),
        ),
        body: Center(
          child: Text(
            "Parabens você ganhou!!",
            style: TextStyle(
              fontSize: 25
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Jogo da Forca"),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Center(child: Text("Nicson Costa Antunes")),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Placeholder(
                  child: Image.asset("assets/images/forca6.png"),
                  fallbackHeight: 200,
                  fallbackWidth: 200,
                ),
              ),
              Text(
                "Que pena, você perdeu!",
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              Text(
                "Palavra: ${wordChoosed.word}",
                style: TextStyle(
                  fontSize: 25
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  void verifyAndChangeLetter(String letterChoosed) {
    if(!acurretLetters.contains(letterChoosed)){
      for(int i = 0; i < wordChoosed.word.length; i++) {     
        if(wordChoosed.word[i] == letterChoosed) {
          occultWord[i] = Text(letterChoosed, style: TextStyle(fontSize: 40));
          acurretLetters.add(letterChoosed);
        }
      }
    }

    print(incorrectChooseList.length);
    if(!wordChoosed.word.contains(letterChoosed)) {
      if(!incorrectChooseList.contains(letterChoosed)){
        incorrectChooseList.add(letterChoosed);
        incorrectChoose.add(Text(letterChoosed, style: TextStyle(fontSize: 40)));
      }
    }
    if(incorrectChoose.length == 4) {
      clue = wordChoosed.clue;
    }
    setState(() {
      clue;
      occultWord;
    });
  }
  



  

  @override
  Widget build(BuildContext context) {
    return(finishChances) ?Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Jogo da Forca"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 40,
        child: Center(child: Text("Nicson Costa Antunes")),

      ),
      body: Center(
        child: Responsivity(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Placeholder(
                    child: Image.asset("assets/images/forca${incorrectChooseList.length}.png"),
                    fallbackHeight: 200,
                    fallbackWidth: 200,
                  ),
                ),
                Text(
                  clue,
                  style: TextStyle(
                    fontSize: 25
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...occultWord
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("q"), 
                child: Text("Q")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("w"), 
                child: Text("W")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("e"), 
                child: Text("E")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("r"), 
                child: Text("R")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("t"), 
                child: Text("T")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("y"), 
                child: Text("Y")
              ),
            ],
          ),
                          Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("o"), 
                child: Text("O")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("p"), 
                child: Text("P")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("a"), 
                child: Text("A")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("s"), 
                child: Text("S")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("d"), 
                child: Text("D")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("f"), 
                child: Text("F")
              ),
            ],
          ),
Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("j"), 
                child: Text("J")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("k"), 
                child: Text("K")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("l"), 
                child: Text("L")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("z"), 
                child: Text("Z")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("x"), 
                child: Text("X")
              ),
              ElevatedButton(
                onPressed: () => verifyAndChangeLetter("c"), 
                child: Text("C")
              ),
            ],
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => verifyAndChangeLetter("m"), 
              child: Text("M")
            ),
            ElevatedButton(
              onPressed: () => verifyAndChangeLetter("n"), 
              child: Text("N")
            ),
            ElevatedButton(
              onPressed: () => verifyAndChangeLetter("u"), 
              child: Text("U")
            ),
            ElevatedButton(
              onPressed: () => verifyAndChangeLetter("i"), 
              child: Text("I")
            ),
            ElevatedButton(
              onPressed: () => verifyAndChangeLetter("b"), 
              child: Text("B")
            ),
            ElevatedButton(
              onPressed: () => verifyAndChangeLetter("h"), 
              child: Text("H")
            ),
          ],
          ),   
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => verifyAndChangeLetter("v"), 
                  child: Text("V")
                ),
                ElevatedButton(
                  onPressed: () => verifyAndChangeLetter("g"), 
                  child: Text("G")
                ),
              ],
            )         
              ],
            )
          ],
        ),
      )
    ):Scaffold(
      body: finalMensage(),
    );
  }
}

