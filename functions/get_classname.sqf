/* Name: get_classname.sqf
 * Author: vigil.vindex@gmail.com
 * Last Updated: 2013/08/26
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Description: Displays on screen, logs and copies to the clipboard the classname of the object the player is looking at when the script is called.
 * Example: player addAction["Get Classname","get_classname.sqf"];
 */
private["_class_name"];
_class_name = typeOf cursorTarget;
hintSilent format["Classname: %1",_class_name];
diag_log format["Classname: %1",_class_name];
copytoclipboard str(_class_name);
