/**
 * Retourne le chargement actuel et la capacit� maximale d'un v�hicule
 * 
 * @param 0 le transporteur pour lequel calculer le chargement
 * 
 * @return tableau content le chargement actuel et la capacit� d'un v�hicule
 * 
 * Copyright (C) 2014 Team ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private ["_transporteur", "_objets_charges", "_chargement_actuel", "_chargement_maxi", "_objet_parcouru"];

_transporteur = _this select 0;

_objets_charges = _transporteur getVariable ["R3F_LOG_objets_charges", []];

// Calcul du chargement actuel
_chargement_actuel = 0;
{
	_objet_parcouru = _x;
	
	{
		if (_objet_parcouru isKindOf _x) exitWith
		{
			_chargement_actuel = _chargement_actuel + (R3F_LOG_CFG_can_be_transported_cargo select _forEachIndex select 1);
		};
	} forEach R3F_LOG_classes_objets_transportables;
} forEach _objets_charges;

// Recherche de la capacit� maximale du transporteur
_chargement_maxi = 0;
{
	if (_transporteur isKindOf _x) exitWith
	{
		_chargement_maxi = R3F_LOG_CFG_can_transport_cargo select _forEachIndex select 1;
	};
} forEach R3F_LOG_classes_transporteurs;

[_chargement_actuel, _chargement_maxi]