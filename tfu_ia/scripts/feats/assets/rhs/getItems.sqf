#define DEFAULT_SLOT 0
#define MUZZLE_SLOT 101
#define OPTICS_SLOT 201
#define FLASHLIGHT_SLOT 301
#define BIPOD_SLOT 302
#define FIRSTAIDKIT_SLOT 401
#define FINS_SLOT 501
#define BREATHINGBOMB_SLOT 601
#define NVG_SLOT 602
#define GOGGLE_SLOT 603
#define SCUBA_SLOT 604
#define HEADGEAR_SLOT 605
#define FACTOR_SLOT 607
#define RADIO_SLOT 611
#define HMD_SLOT 616
#define BINOCULAR_SLOT 617
#define MEDIKIT_SLOT 619
#define TOOLKIT_SLOT 620 //added
#define VEST_SLOT 701
#define UNIFORM_SLOT 801
#define BACKPACK_SLOT 901

params [["_dlcFilter", 0], ["_kindFilter", ""], ["_extFilters", []]];

private _filters = [];

if ( !(_dlcFilter isEqualto 0) ) then {
	_filters pushback format["getText( _x >> 'dlc' ) isEqualTo '%1'", _dlcFilter];
};

if ( !(_kindFilter isEqualto "") ) then {
	_filters pushback format["(configName _x) isKindOf ['%1', (configFile >> 'CfgWeapons')]", _kindFilter];
};

_filters append _extFilters;

private _itemSlots = [MUZZLE_SLOT, 
                      OPTICS_SLOT, 
                      FLASHLIGHT_SLOT, 
                      BIPOD_SLOT, 
                      FIRSTAIDKIT_SLOT, 
                      FINS_SLOT, 
                      BREATHINGBOMB_SLOT, 
                      NVG_SLOT, 
                      GOGGLE_SLOT, 
                      SCUBA_SLOT, 
                      HEADGEAR_SLOT, 
                      FACTOR_SLOT, 
                      RADIO_SLOT, 
                      HMD_SLOT, 
                      BINOCULAR_SLOT, 
                      MEDIKIT_SLOT, 
                      TOOLKIT_SLOT, 
                      VEST_SLOT, 
                      UNIFORM_SLOT, 
                      BACKPACK_SLOT];

_filters pushback format["getNumber(_x >> 'itemInfo' >> 'type') in %1", _itemSlots]; 

_items = ["CfgWeapons", _filters, "(configName (_this select 0))", []] call rhs_fnc_searchThings;

//an other search
#define WeaponSlotPrimary 1
#define WeaponSlotHandGun 2
#define WeaponSlotSecondary 4
#define WeaponSlotHandGunItem 16
#define WeaponSlotItem 256
#define WeaponSlotBinocular 4096
#define WeaponHardMounted 65536
#define WeaponSlotInventory 131072

private _filters = [];

if ( !(_dlcFilter isEqualto 0) ) then {
	_filters pushback format["getText( _x >> 'dlc' ) isEqualTo '%1'", _dlcFilter];
};

private _weaponSlots = [WeaponSlotBinocular];//, WeaponSlotItem, WeaponSlotHandGunItem, WeaponHardMounted, WeaponSlotInventory];

_filters pushback format["getNumber(_x >> 'type') in %1", _weaponSlots]; 

_items append (["CfgWeapons", _filters, "(configName (_this select 0))", []] call rhs_fnc_searchThings);

/*
diag_log "RHS ITEMS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";
{
	//diag_log _x;
	diag_log format["%1 => %2", _x, ( getText(configFile >> "CfgWeapons" >> _x >> "displayName"))];
} count _secondSearch;
diag_log "RHS ITEMS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
*/

_items