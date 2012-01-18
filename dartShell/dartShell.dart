#import('dart:builtin');
#import('commandsLib.dart');

bool DEBUG = false;
/** Prints debug string [d] if [DEBUG] is enabled */
void debugPrint(var d) {
  if (DEBUG && d is String) {
    print("DEBUG: " + d.toString());
  }
}

/** Enter the main */
void main() {
  Map commandMap = buildCommandMap();
  // Add a debug toggle
  commandMap["debug"] = ([var args]) {
    DEBUG = !DEBUG;
  };
  
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

    if (commandMap.containsKey(command.split(' ')[0].toLowerCase())) {
      commandMap[command.split(' ')[0].toLowerCase()](command);
    } else {
      print("Command '${command}' not found");
    }
    
    stdout.write("Enter Command: ".charCodes());
  };
}
