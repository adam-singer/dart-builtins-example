#library('timerLib');
/** [COMMANDNAME] runtimer provides the function to run a timer taking an optional second argument in seconds to run the timer for. */
String COMMANDNAME="runtimer";
/** [COMMAND] function takes an optional argument as a string and converts to number in seconds */
COMMAND([var args]) {
  int milliSeconds = 1000;
  Timer timer; 
  if (args is String) {
    List l = args.split(' ');
    if (l.length >= 2) {
      try {
        milliSeconds = (Math.parseInt(l[1]).abs()*milliSeconds);
      } catch (BadNumberFormatException ex) {
        
      }
    }
    
    timer = new Timer((var t) {
      print("\nTime elapsed on Timer");
    }, milliSeconds);
  }
}