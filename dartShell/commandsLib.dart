#library('CommandsLib');
#import('dart:builtin');
#source('SocketExample.dart');

Map buildCommandMap() {
  Map m = new Map();
  m["exit"] = ([var args]) {
    exit(0);
  };
  
  m["pinfo"] = ([var args]) {
    Platform p = new Platform();
    print('{"operatingSystem":${p.operatingSystem()},"numberOfProcessors":${p.numberOfProcessors()},"pathSeparator":${p.pathSeparator()}}');
  };
  
  m["ps"] = ([var args]) {
    void _readAll(InputStream input, StringBuffer output) {
      while (input.available() != 0) {
        output.add(new String.fromCharCodes(input.read()));
      }
    }
    
    void _psPrint() {
      Process compiler = new Process.start('ps', []);
      StringBuffer messages = new StringBuffer();
      compiler.exitHandler = (int status) {
        compiler.close();
        //callback(status, messages.toString());
        print(messages.toString());
      };

      compiler.stdout.dataHandler = () => _readAll(compiler.stdout, messages);
      compiler.stderr.dataHandler = () => _readAll(compiler.stderr, messages);
    }
    
    _psPrint();
  };
  
  m['socketexample'] = ([var args]) => new SocketExample().go();

  m['h'] = ([var args]) {
    print("Available commands:");
    m.forEach((var k, var v) {
      print(" ${k}");
    });
  };
  
  m['echo'] = ([var args]) {
    if (args is String) {
      List l = args.split(' ');
      l.removeRange(0,1);
      l.forEach((var s) {
        stdout.write((s + ' ').charCodes());
      });
      stdout.write('\n'.charCodes());
    }
  };
  
  return m;
}

