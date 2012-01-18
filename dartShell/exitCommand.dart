#library('exitLib');
/** [COMMANDNAME] exit is the command to exit the shell */
String COMMANDNAME="exit";
/** [COMMAND] function to exit shell */
COMMAND([var args]) {
  exit(0);
}
