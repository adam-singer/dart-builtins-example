#import('dart:builtin');
#import('commandsLib.dart');

bool DEBUG = true;
void debugPrint(var d) {
  if (DEBUG && d is String) {
    print("DEBUG: " + d.toString());
  }
}

void main() {
  Map commandMap = buildCommandMap();
  Platform p = new Platform();
  StringInputStream consoleInput = new StringInputStream(stdin);
  print("Welcome to dartshell on ${p.operatingSystem()}");
  stdout.write("Enter Command: ".charCodes());
 
  consoleInput.lineHandler = () {
    String command = consoleInput.readLine();
    debugPrint("CommandEntered ${command}");
    commandMap.forEach((var k, var v) {
      debugPrint('{${k},${v}}');
    });

    //command.split(' ');
    //if (commandMap.containsKey(command.toLowerCase())) {
    if (commandMap.containsKey(command.split(' ')[0].toLowerCase())) {
      commandMap[command.split(' ')[0].toLowerCase()](command);
    } else {
      print("Command '${command}' not found");
    }
    
    stdout.write("Enter Command: ".charCodes());
  };
}
