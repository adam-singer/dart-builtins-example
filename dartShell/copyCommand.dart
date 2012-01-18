#library('copyLib');

/** [COMMANDNAME] */
String COMMANDNAME="copy";
/** [COMMAND]  */
COMMAND([var args]) {

  if (args is String) {
    List arg = args.split(' ');
    if (arg.length != 3) {
      print("Error: ${COMMANDNAME} [src] [dest]");
      return;
    }
   
    if (arg[1].compareTo(arg[2]) == 0) {
      print("Error: ${COMMANDNAME} [src] [dest]");
      return;
    }
    
    File src = new File(arg[1]);
    File dest = new File(arg[2]);
    var srcStream = src.openInputStream();
    var destStream = dest.openOutputStream();
    destStream.write(srcStream.read());
    srcStream.close();
    destStream.close();
    
  }
}