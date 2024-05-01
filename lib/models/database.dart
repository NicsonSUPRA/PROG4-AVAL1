import 'dart:math';
import './word.dart';

class Database {

  List<Word> wordList = [
    Word(word: "sapato", clue: "Usado nos pés"),
    Word(word: "joelho", clue: "Parte da perna"),
    Word(word: "camisa", clue: "Roupa"),
    Word(word: "blusa", clue: "Roupa"),
    Word(word: "futebol", clue: "Esporte famoso"),
    Word(word: "dedo", clue: "parte da mão"),
    Word(word: "salada", clue: "pode participar de refeição"),
    Word(word: "filho", clue: "normalmente tem em uma familia"),
    Word(word: "janela", clue: "pode clarear um cômodo"),
    Word(word: "toalha", clue: "usado no banho")
  ];

  Word get getRandomWord {
    var randomIndex = Random().nextInt(9);
    return wordList[randomIndex];
  } 


}