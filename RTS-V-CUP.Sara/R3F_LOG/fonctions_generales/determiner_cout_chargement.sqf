/**
 * Retourne le co�t de chargement d'un objet
 * 
 * @param 0 l'objet pour lequel d�terminer le co�t de chargement
 * 
 * @return le co�t de chargement de l'objet
 * 
 * Copyright (C) 2014 Team ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private ["_objet", "_cout_chargement"];

_objet = _this select 0;

// Recherche du co�t de chargement de l'objet
_cout_chargement = 1E6;
{
	if (_objet isKindOf _x) exitWith
	{
		_cout_chargement = R3F_LOG_CFG_can_be_transported_cargo select _forEachIndex select 1;
	};
} forEach R3F_LOG_classes_objets_transportables;

_cout_chargement