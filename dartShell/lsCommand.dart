#library('lslib');
/** [COMMANDNAME] */
String COMMANDNAME="ls";
/** [COMMAND]  */
COMMAND([var args]) {
  if (args is String) {
    List l = args.split(' ');
    Directory d;
    if (l.length >= 2) {
      d = new Directory(l[1]);
    } else {
      d = new Directory(".");
    }
    
    d.dirHandler = (var dir) {
      print("${dir}");
    };
    
    d.fileHandler = (var file) {
      print("${file}");
    };
    
    d.list(true);
  }
}
