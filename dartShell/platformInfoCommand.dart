#library('pinfoLib');
/** [COMMANDNAME] pinfo provides command for printing platform information */
String COMMANDNAME="pinfo";
/** [COMMAND] function prints the platform information */
COMMAND([var args]) {
     Platform p = new Platform();
     print('{"operatingSystem":${p.operatingSystem()},"numberOfProcessors":${p.numberOfProcessors()},"pathSeparator":${p.pathSeparator()}}');
}
