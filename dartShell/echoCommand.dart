#library('echoCommand');
/** [COMMANDNAME] echo provides the [Key] to the function for echo string */
String COMMANDNAME="echo";
/** [COMMAND] function takes arguments and echos them to the screen */
COMMAND([var args]) {
  if (args is String) {
    List l = args.split(' ');
    l.removeRange(0,1);
    l.forEach((var s) {
      stdout.write((s + ' ').charCodes());
    });
    stdout.write('\n'.charCodes());
  }
}
