#library('processInfoLib');
/** [COMMANDNAME] ps provides the [Key] to the function for displaying
  * system processes.
  */
String COMMANDNAME="ps";
/** [COMMAND] function prints system processes to the screen */
COMMAND([var args]) {
  void _readAll(InputStream input, StringBuffer output) {
    while (input.available() != 0) {
      output.add(new String.fromCharCodes(input.read()));
    }
  }
  
  void _psPrint() {
    Process ps = new Process.start('ps', []);
    StringBuffer messages = new StringBuffer();
    ps.exitHandler = (int status) {
      ps.close();
      print(messages.toString());
    };
    ps.stdout.dataHandler = () => _readAll(ps.stdout, messages);
    ps.stderr.dataHandler = () => _readAll(ps.stderr, messages);
  }
  
  _psPrint();
}
