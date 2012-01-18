#library('binLib');

/** [COMMANDNAME] */
String COMMANDNAME="bindump";
/** [COMMAND]  */
COMMAND([var args]) {
  // Example how to use chunked input stream
  if (args is String) {
    List l = args.split(' ');
    if (l.length < 2) {
      print("Error: ${COMMANDNAME} [filename]");
      return;
    } 
    
    l.removeRange(0,1);
    File f = new File(l[0]);
    if (!f.existsSync()) { 
      print("Error: file does not exist");
      return;
    }
    
    ChunkedInputStream chunkedInputStream = new ChunkedInputStream(f.openInputStream(), 16);
    List<int> c = chunkedInputStream.read();
    while(c!=null) {
      StringBuffer sb = new StringBuffer();
      c.forEach((int b) {
        sb.add("0x");
        
        if (b.toRadixString(16).length == 1) {
          sb.add("0");
        }
        
        sb.add(b.toRadixString(16));
        sb.add(" ");
      });
            
      print(sb.toString());
      c = chunkedInputStream.read();
    }
    
  }
}
