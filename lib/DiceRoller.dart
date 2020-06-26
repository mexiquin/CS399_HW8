import 'dart:math';

class DiceRoller {
  int dUpLef;
  int dUpRi;
  int dLoLef;
  int dLoRi;
  int dCen;

  DiceRoller() {
    dUpLef = dUpRi = dLoLef = dLoRi = dCen = 1;
  }

// randomize the dice, then report the status
  String randomizeDice() {
    dUpLef = Random().nextInt(6) + 1;
    dUpRi = Random().nextInt(6) + 1;
    dLoLef = Random().nextInt(6) + 1;
    dLoRi = Random().nextInt(6) + 1;
    dCen = Random().nextInt(6) + 1;
    return getStatus();
  }

  /*
  No Particular combination
  b.2 Pairs
  c.3 of a kind
  d.3 of a kind and a pair
  e.4 of a kind
  f.5 of a kind
   */
  String getStatus() {
    List<int> dice = [dUpLef, dUpRi, dLoLef, dLoRi, dCen];
    var map = Map();

    dice.forEach((element) {
      if (!map.containsKey(element)) {
        map[element] = 1;
      } else {
        map[element] += 1;
      }
    });

    print(map);

    if (map.length == 1) {
      return '5 of a kind';
    } else if (map.length == 2) {
      return '3 of a kind and a pair';
    } else if (map.length == 3) {
      var pairs = 0;
      map.forEach((key, value) {
        if(value == 2){
          pairs++;
        }
      });
      if(pairs == 2){
        return '2 pairs';
      }
    }
    for (int key in map.keys) {
      if (map[key] > 1) {
        return '${map[key]} of a kind';
      }
    }

    return 'No particular combination';
  }
}
