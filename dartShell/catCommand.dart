#library('catlib');

/** [COMMANDNAME] */
String COMMANDNAME="cat";
/** [COMMAND]  */
COMMAND([var args]) {

  if (args is String) {
    List l = args.split(' ');
    if (l.length < 2) {
      print("Error: cat [filename]");
      return;
    }
    
    l.removeRange(0, 1);
    
    File f = new File(l[0]);
    if (!f.existsSync()) {
      
      print("Error: file does not exist");
      return;
    }
    
    RandomAccessFile r = f.openSync(FileMode.READ);
    int length = r.lengthSync();
    List<int> buffer = new List<int>(length);
    int readLength = r.readListSync(buffer, 0, length);
    r.close();
    String s = new String.fromCharCodes(buffer);
    print(s);
  }
}
