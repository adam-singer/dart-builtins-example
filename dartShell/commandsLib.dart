#library('CommandsLib');
#import('dart:builtin');
#import('exitCommand.dart', prefix:"exitLib");
#import('platformInfoCommand.dart', prefix:"pinfoLib");
#import('echoCommand.dart', prefix:"echoLib");
#import('processInfoCommand.dart', prefix:"processInfoLib");
#import('socketCommand.dart', prefix:"socketLib");
#import('timerCommand.dart', prefix:"timerLib");
#import('lsCommand.dart', prefix:"lsLib");
#import('catCommand.dart', prefix:"catLib");
#import('binCommand.dart', prefix:"binLib");

/** Build a new command map and return to the caller a 
  * [Map] of commands where the [Key] is the command name
  * and the [Value] is the commands function with the 
  * option to pass in arguments to the function.
  */
Map buildCommandMap() {
  Map m = new Map();

  m[exitLib.COMMANDNAME] = exitLib.COMMAND;
  m[pinfoLib.COMMANDNAME] = pinfoLib.COMMAND;
  m[processInfoLib.COMMANDNAME] = processInfoLib.COMMAND; 
  m[echoLib.COMMANDNAME] = echoLib.COMMAND; 
  m[socketLib.COMMANDNAME] = socketLib.COMMAND; 
  m[timerLib.COMMANDNAME] = timerLib.COMMAND; 
  m[lsLib.COMMANDNAME] = lsLib.COMMAND;
  m[catLib.COMMANDNAME] = catLib.COMMAND;
  m[binLib.COMMANDNAME] = binLib.COMMAND;
  
  m['help'] = ([var args]) {
    print("Available commands:");
    m.forEach((var k, var v) {
      print(" ${k}");
    });
  };
  
  return m;
}

