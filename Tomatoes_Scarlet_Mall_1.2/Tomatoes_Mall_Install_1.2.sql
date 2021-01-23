/* 
Tomatoes's Scarlet Mall
C Tomatoes 2014

Redistribution is allowed as long as this citiation is not removed.
Modification is allowed if I am still credited ingame; via tier vendors.
Thank you for respecting days of work and not stealing credit.
I hope you get much use out of this.
	-Tomatoes
*/

-- set item quality here: 0=trash, 1=whites, 2=greens, 3=blues, 4=purples
SET @quality=4;
SET @gems=3;
-- set tier here: 115=dungeon 3 set, 120=Tier 4, 133=tier 5, 146=tier 6
SET @tier=120;


-- cleanup
DROP TABLE IF EXISTS item_template_backup;
CREATE TABLE item_template_backup LIKE item_template;
REPLACE INTO item_template_backup SELECT * FROM item_template;

DROP TABLE IF EXISTS spell_target_position_backup;
CREATE TABLE spell_target_position_backup LIKE spell_target_position;
REPLACE INTO spell_target_position_backup SELECT * FROM spell_target_position;

DROP TABLE IF EXISTS gameobject_backup;
CREATE TABLE gameobject_backup LIKE gameobject;
REPLACE INTO gameobject_backup SELECT * FROM gameobject;

UPDATE creature SET spawnMask=0 WHERE id IN (9448,1198,9451,9450,10828,9452,9447,9449,11898);

DELETE FROM creature_template WHERE entry >= 995000 AND entry <996000;

DELETE FROM creature WHERE id >= 995000 AND id <996000 OR id=10828 OR guid=140473;
DELETE FROM creature WHERE id IN (20272,20273,20271,20362,20269,20274,20276,20384) AND map=0;

DELETE FROM npc_vendor WHERE entry >= 995000 AND entry <996000;

DELETE FROM gameobject_template WHERE entry >= 995000 AND entry <996000;

DELETE FROM gameobject WHERE id >= 995000 AND id <996000 OR ((id=186230 OR id=187111 OR id=187112) AND map=0);
DELETE FROM gameobject WHERE id IN (179498,176548,176584,176586,176589,176583,175404,211062);
DELETE FROM gameobject WHERE guid BETWEEN 995136 AND 995178;

DELETE FROM npc_trainer WHERE spell IN (40120,1066,8946,5487,1515,2641,982,6991,5194,883,5394,3599,58753,71,2458,20252,23161,603,1122,691,712,697,688,28271,28272,23214,34767,7328) OR entry BETWEEN 995000 AND 996000;

DELETE FROM creature_addon WHERE guid IN (140459, 140299, 140298, 140296, 140295, 140293, 140292, 140288, 140287, 140319, 140326, 140328, 140329, 140330, 140349, 140350, 140351, 140363, 140364, 140365, 140421, 140458, 140423, 140422, 140428, 140460,140426, 140430, 140424, 140425, 140434);


-- create vendors
REPLACE INTO creature_template (entry, NAME, minlevel, maxlevel, modelid1, faction, creaturetype, npcflags, unitflags, unitclass)
VALUES
(995001, "1H Axes", 70,70,21667,35,7,4224,768,1),
(995002, "2H Axes", 70,70,21668,35,7,4224,768,1),
(995003, "Bows", 70,70,21669,35,7,4224,768,1),
(995004, "Guns", 70,70,21670,35,7,4224,768,1),
(995013, "Thrown", 70,70,21679,35,7,4224,768,1),
(995014, "Crossbows", 70,70,21680,35,7,4224,768,1),
(995005, "1H Maces", 70,70,21671,35,7,4224,768,1),
(995006, "2H Maces", 70,70,21672,35,7,4224,768,1),
(995007, "Polearms", 70,70,21673,35,7,4224,768,1),
(995008, "1H Swords", 70,70,21674,35,7,4224,768,1),
(995009, "2H Swords", 70,70,21675,35,7,4224,768,1),
(995010, "Staves", 70,70,21676,35,7,4224,768,1),
(995011, "Fist Weapons", 70,70,21677,35,7,4224,768,1),
(995012, "Daggers", 70,70,21678,35,7,4224,768,1),
(995015, "Red Gems", 70,70,21681,35,7,4224,768,1),
(995016, "Blue Gems", 70,70,21682,35,7,4224,768,1),
(995017, "Yellow Gems", 70,70,21683,35,7,4224,768,1),
(995018, "Purple Gems", 70,70,21684,35,7,4224,768,1),
(995019, "Green Gems", 70,70,21680,35,7,4224,768,1),
(995020, "Orange Gems", 70,70,21679,35,7,4224,768,1),
(995021, "Necks", 70,70,13,35,7,4224,768,1),
(995022, "Rings", 70,70,14,35,7,4224,768,1),
(995023, "Trinkets", 70,70,15,35,7,4224,768,1),
(995032, "Capes", 70,70,16,35,7,4224,768,1),
(995024, "Cloth Heads", 70,70,93,35,7,4224,768,1),
(995025, "Cloth Shoulders", 70,70,94,35,7,4224,768,1),
(995026, "Cloth Chests", 70,70,95,35,7,4224,768,1),
(995027, "Cloth Waists", 70,70,2043,35,7,4224,768,1),
(995028, "Cloth Legs", 70,70,97,35,7,4224,768,1),
(995029, "Cloth Feet", 70,70,98,35,7,4224,768,1),
(995030, "Cloth Wrists", 70,70,99,35,7,4224,768,1),
(995031, "Cloth Hands", 70,70,100,35,7,4224,768,1),
(995033, "Cloth Robes", 70,70,10339,35,7,4224,768,1),
(995034, "Leather Heads", 70,70,104,35,7,4224,768,1),
(995035, "Leather Shoulders",70,70,105,35,7,4224,768,1),
(995036, "Leather Chests", 70,70,19156,35,7,4224,768,1),
(995037, "Leather Waists", 70,70,19087,35,7,4224,768,1),
(995038, "Leather Legs", 70,70,109,35,7,4224,768,1),
(995039, "Leather Feet", 70,70,89,35,7,4224,768,1),
(995040, "Leather Wrists", 70,70,79,35,7,4224,768,1),
(995041, "Leather Hands", 70,70,80,35,7,4224,768,1),
(995042, "Leather Robes", 70,70,137,35,7,4224,768,1),
(995043, "Mail Heads", 70,70,125,35,7,4224,768,1),
(995044, "Mail Shoulders", 70,70,126,35,7,4224,768,1),
(995045, "Mail Chests", 70,70,127,35,7,4224,768,1),
(995046, "Mail Waists", 70,70,128,35,7,4224,768,1),
(995047, "Mail Legs", 70,70,129,35,7,4224,768,1),
(995048, "Mail Feet", 70,70,149,35,7,4224,768,1),
(995049, "Mail Wrists", 70,70,158,35,7,4224,768,1),
(995050, "Mail Hands", 70,70,162,35,7,4224,768,1),
(995051, "Mail Robes", 70,70,164,35,7,4224,768,1),
(995052, "Plate Heads", 70,70,166,35,7,4224,768,1),
(995053, "Plate Shoulders", 70,70,173,35,7,4224,768,1),
(995054, "Plate Chests", 70,70,176,35,7,4224,768,1),
(995055, "Plate Waists", 70,70,186,35,7,4224,768,1),
(995056, "Plate Legs", 70,70,16100,35,7,4224,768,1),
(995057, "Plate Feet", 70,70,10545,35,7,4224,768,1),
(995058, "Plate Wrists", 70,70,19545,35,7,4224,768,1),
(995059, "Plate Hands", 70,70,198,35,7,4224,768,1),
(995060, "Shields", 70,70,200,35,7,4224,768,1),
(995061, "Librams", 70,70,282,35,7,4224,768,1),
(995062, "Idols", 70,70,467,35,7,4224,768,1),
(995063, "Totems", 70,70,314,35,7,4224,768,1),
(995064, "Ammo", 70,70,308,35,7,4224,768,1),
(995065, "Quivers", 70,70,22919,35,7,4224,768,1),
(995066, "Bag Vendor", 70,70,23591,35,7,4224,768,1),
(995067, "Reagents", 70,70,21891,35,7,4224,768,1),
(995068, "Food Vendor", 70,70,22920,35,7,4224,768,1),
(995089, "Poison Vendor", 70,70,22910,35,7,4224,768,1),
(995069, "Potions Vendor", 70,70,22918,35,7,4224,768,1),
(995086, "Keymaster", 70,70,19957,35,7,4224,768,1),
(995087, "Demon Trainer", 70,70,25219,35,7,131,4864,1),
(995000, "Mount Vendor", 70,70,471,35,7,4224,768,1),
(995085, "Enchants", 70,70,197,35,7,4224,768,1),

(995088, "Innkeeper", 70,70,25219,35,7,65536,768,1),
(995090, "Bank", 70,70,24013,35,7,131072,768,1),
(995091, "Arena Teams", 70,70,25219,35,7,262144,768,1),

(995093, "Auction House", 70,70,24013,35,7,2097152,768,1),
(995094, "Stable Master", 70,70,24013,35,7,4194304,768,1),
(995096, "Meta Gems", 70,70,106,35,7,4224,768,1),
(995097, "Bandages", 70,70,96,35,7,4224,768,1),
(995099, "Off-Hands", 70,70,197,35,7,4224,768,1),
(995098, "Scrolls", 70,70,19957,35,7,4224,768,1),
(995199, "Wands", 70,70,19957,35,7,4224,768,1);

REPLACE INTO creature_template (entry, NAME, subname, minlevel, maxlevel, modelid1, faction, creaturetype, npcflags, unitflags, unitclass)
VALUES
(995101, "Azuryx", "Rogue Tier", 70,70,16026,35,7,4224,768,1),
(995102, "Tomatoes", "Paladin Tier", 70,70,16015,35,7,4224,768,1),
(995103, "Eric", "Warlock Tier", 70,70,16028,35,7,4224,768,1),
(995104, "Moocifer", "Druid Tier", 70,70,16030,35,7,4224,768,1),
(995105, "Azarath", "Mage Tier", 70,70,16016,35,7,4224,768,1),
(995106, "Tom", "Shaman Tier", 70,70,16029,35,7,4224,768,1),
(995107, "Doomcow", "Warrior Tier", 70,70,16012,35,7,4224,768,1),
(995108, "Tombomb", "Priest Tier", 70,70,16013,35,7,4224,768,1),
(995109, "Ravenshadow", "Hunter Tier", 70,70,16027,35,7,4224,768,1);


REPLACE INTO creature_template (entry, NAME, minlevel, maxlevel, modelid1, faction, creaturetype, npcflags, unitflags, extraflags, unitclass, trainertype, TrainerClass, trainertemplateid, vendortemplateid)
VALUES
(995070, "Mining Trainer", 70,70,23593,35,7,145,37376,2,1,2,0,1011,0),
(995071, "Blacksmithing Trainer", 70,70,23648,35,7,145,32768,2,1,2,0,1063,0),
(995072, "Engineering Trainer", 70,70,24761,35,7,145,0,2,1,2,0,1001,0),
(995073, "Jewelcrafting Trainer", 70,70,24731,35,7,145,4608,2,1,2,0,1091,0),
(995074, "Tailoring Trainer", 70,70,22910,35,7,145,4608,2,1,2,0,1081,0),
(995075, "Enchanting Trainer", 70,70,22917,35,7,145,512,2,1,2,0,1041,0),
(995076, "Skinning Trainer", 70,70,22909,35,7,17,145,2,1,2,0,1021,0),
(995077, "Leatherworking Trainer", 70,70,22911,35,7,145,4608,2,1,2,0,1071,0),
(995078, "Herbalism Trainer", 70,70,22916,35,7,17,512,2,1,2,0,1031,0),
(995079, "Alchemy Trainer", 70,70,22912,35,7,145,0,2,1,2,0,1054,0),
(995080, "First Aid Trainer", 70,70,22908,35,7,145,4608,2,1,2,0,1100,0),
(995081, "Fishing Trainer", 70,70,23548,35,7,145,0,2,1,2,0,1120,0),
(995082, "Cooking Trainer", 70,70,22913,35,7,145,4608,2,1,2,0,1110,0),
(995083, "Weapon Master", 70,70,22915,35,7,19,37376,2,1,2,0,1201,0),
(995084, "Riding Trainer", 70,70,22907,35,7,18,4608,2,1,1,0,1131,0),
(995095, "Pet Trainer", 70,70,22907,35,7,19,4608,2,1,3,3,100,0);

-- skinning mobs
REPLACE INTO creature_template (entry, NAME, minlevel, maxlevel, modelid1, faction, scale, family, creaturetype,minlevelhealth, maxlevelhealth,skinninglootid )
VALUES
(995201, "Skinning 1 to 50", 10,10,1141,7,1.5,6,1,1,1,20797),
(995202, "Skinning 50 to 100", 15,15,1141,7,2.5,6,1,1,1,14357),
(995203, "Skinning 100 to 150", 20,20,1141,7,3.5,6,1,1,1,5934),
(995204, "Skinning 150 to 200", 30,30,23519,7,0.5,6,1,1,1,742),
(995205, "Skinning 200 to 250", 40,40,23519,7,1,6,1,1,1,5420),
(995206, "Skinning 250 to 300", 50,50,23519,7,1.5,6,1,1,1,10220);


-- add items to trainers
REPLACE INTO npc_vendor (entry, item) VALUES
(995070, 2901),
(995071, 3857),(995071, 3466),(995071, 5956),(995071, 2880),
(995072, 2880),(995072, 3857),(995072, 3466),(995072, 5956),
(995073, 20815),(995073, 20824),
(995074, 2589),(995074, 2592),(995074, 4306),(995074, 4338),(995074, 14047),(995074, 2320),(995074, 2321),(995074, 4291),(995074, 8343),(995074, 14341),(995074, 2325),(995074, 2604),(995074, 2605),(995074, 4340),(995074, 4341),(995074, 4342),(995074, 6260),(995074, 6261),(995074, 10290),
(995075, 5500),(995075, 13926),(995075, 7971),(995075, 6217),(995075, 6338),(995075, 11128),(995075, 11144),(995075, 16206),(995075, 16243),(995075, 4470),(995075, 11291),(995075, 10938),(995075, 10940),(995075, 10978),(995075, 10998),(995075, 11082),(995075, 11083),(995075, 11084),(995075, 11138),(995075, 11139),(995075, 11134),(995075, 11135),(995075, 11137),(995075, 11174),(995075, 11175),(995075, 11177),(995075, 11178),(995075, 11176),(995075, 16202),(995075, 16203),(995075, 16204),(995075, 14343),(995075, 14344),(995075, 6338),
(995076, 7005),
(995077, 7005),(995077, 2589),(995077, 2592),(995077, 4306),(995077, 4338),(995077, 14047),(995077, 2320),(995077, 2321),(995077, 4291),(995077, 8343),(995077, 14341),(995077, 2325),(995077, 2604),(995077, 2605),(995077, 4340),(995077, 4341),(995077, 4342),(995077, 6260),(995077, 6261),(995077, 10290),
(995079, 3371),(995079, 3372),(995079, 8925),(995079, 18256),(995079, 9303),(995079, 9262),(995079, 9304),(995079, 9305),(995079, 12958),
(995080, 21992),(995080, 21993),(995080, 22012),(995080, 16084),(995080, 2589),(995080, 2592),(995080, 4306),(995080, 4338),(995080, 14047),
(995081, 6256),(995081, 27532),(995081, 16083),(995081, 34109),
(995082, 30817),(995082,2678);


-- add items to vendors
REPLACE INTO npc_vendor (entry, item)
(SELECT 995001, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=0 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- 1h axe
REPLACE INTO npc_vendor (entry, item)
(SELECT 995002, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=1 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- 2h axe
REPLACE INTO npc_vendor (entry, item)
(SELECT 995003, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=2 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- bow
REPLACE INTO npc_vendor (entry, item)
(SELECT 995004, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=3 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- gun
REPLACE INTO npc_vendor (entry, item)
(SELECT 995005, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=4 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- 1h mace
REPLACE INTO npc_vendor (entry, item)
(SELECT 995006, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=5 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- 2h mace
REPLACE INTO npc_vendor (entry, item)
(SELECT 995007, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=6 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- polearm
REPLACE INTO npc_vendor (entry, item)
(SELECT 995008, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=7 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- 1h sword
REPLACE INTO npc_vendor (entry, item)
(SELECT 995009, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=8 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- 2h sword
REPLACE INTO npc_vendor (entry, item)
(SELECT 995010, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=10 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- staff
REPLACE INTO npc_vendor (entry, item)
(SELECT 995011, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=13 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- fist
REPLACE INTO npc_vendor (entry, item)
(SELECT 995012, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=15 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- dagger
REPLACE INTO npc_vendor (entry, item)
(SELECT 995013, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=16 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- thrown
REPLACE INTO npc_vendor (entry, item)
(SELECT 995014, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =2 AND subclass=18 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- crossbow

REPLACE INTO npc_vendor (entry, item)
(SELECT 995015, entry FROM item_template WHERE quality <= @gems AND class =3 AND subclass=0); -- red gems
REPLACE INTO npc_vendor (entry, item)
(SELECT 995016, entry FROM item_template WHERE quality <= @gems AND class =3 AND subclass=1); -- blue gems
REPLACE INTO npc_vendor (entry, item)
(SELECT 995017, entry FROM item_template WHERE quality <= @gems AND class =3 AND subclass=2); -- yellow gems
REPLACE INTO npc_vendor (entry, item)
(SELECT 995018, entry FROM item_template WHERE quality <= @gems AND class =3 AND subclass=3); -- purple gems
REPLACE INTO npc_vendor (entry, item)
(SELECT 995019, entry FROM item_template WHERE quality <= @gems AND class =3 AND subclass=4); -- green gems
REPLACE INTO npc_vendor (entry, item)
(SELECT 995020, entry FROM item_template WHERE quality <= @gems AND class =3 AND subclass=5); -- orange gems
REPLACE INTO npc_vendor (entry, item)
(SELECT 995096, entry FROM item_template WHERE class =3 AND subclass=6); -- meta gems

REPLACE INTO npc_vendor (entry, item)
(SELECT 995068, entry FROM item_template WHERE class =0 AND subclass=5 AND itemlevel >= 70); -- food
REPLACE INTO npc_vendor (entry, item)
(SELECT 995069, entry FROM item_template WHERE entry IN (22840,22835,22834,32068,22831,32067,22833,22827,28104,22825,28103,22861,22851,22853,22866,22854,33208,22850,22849,22839,22838,22837,22832,22829)); -- potions
REPLACE INTO npc_vendor (entry, item)
(SELECT 995089, entry FROM item_template WHERE class =0 AND subclass=8 AND AllowableClass=8 AND RequiredLevel >= 60); -- poisons
REPLACE INTO npc_vendor (entry, item)
(SELECT 995066, entry FROM item_template WHERE class =1 AND (subclass=0 OR subclass=1) AND ContainerSlots >= 21); -- bags
REPLACE INTO npc_vendor (entry, item)
(SELECT 995097, entry FROM item_template WHERE entry IN (21990,21991,19440)); -- bandages
REPLACE INTO npc_vendor (entry, item)
(SELECT 995098, entry FROM item_template WHERE (entry BETWEEN 10305 AND 10310)); -- Scrolls
REPLACE INTO npc_vendor (entry, item)
(SELECT 995067, entry FROM item_template WHERE (entry BETWEEN 17019 AND 17021) OR (entry BETWEEN 17026 AND 17038) OR (entry IN (17056, 17057, 17058, 21177, 6265))); -- reagents
REPLACE INTO npc_vendor (entry, item)
(SELECT 995000, entry FROM item_template WHERE entry IN (33977,37676,30480,33809,13335,19872,19902,35226)); -- mounts
REPLACE INTO npc_vendor (entry, item)
(SELECT 995085, entry FROM item_template WHERE (entry BETWEEN 35396 AND 35462) OR (entry IN(29190,30846,29192,29191,29193,29186,29536,29535,24274,24276)) AND (class !=4)); -- enchants


REPLACE INTO npc_vendor (entry, item)
(SELECT 995021, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=0 AND inventorytype=2 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- neck
REPLACE INTO npc_vendor (entry, item)
(SELECT 995022, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=0 AND inventorytype=11 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- rings
REPLACE INTO npc_vendor (entry, item)
(SELECT 995023, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=0 AND inventorytype=12 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- trinket
REPLACE INTO npc_vendor (entry, item)
(SELECT 995099, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=0 AND inventorytype=23 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- offhand

-- CLOTH
REPLACE INTO npc_vendor (entry, item)
(SELECT 995024, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=1 AND inventorytype=1 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- head
REPLACE INTO npc_vendor (entry, item)
(SELECT 995025, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=1 AND inventorytype=3 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- shoulders
REPLACE INTO npc_vendor (entry, item)
(SELECT 995026, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=1 AND inventorytype=5 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- chest
REPLACE INTO npc_vendor (entry, item)
(SELECT 995027, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=1 AND inventorytype=6 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- waist
REPLACE INTO npc_vendor (entry, item)
(SELECT 995028, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=1 AND inventorytype=7 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- legs
REPLACE INTO npc_vendor (entry, item)
(SELECT 995029, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=1 AND inventorytype=8 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- feet
REPLACE INTO npc_vendor (entry, item)
(SELECT 995030, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=1 AND inventorytype=9 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- wrists
REPLACE INTO npc_vendor (entry, item)
(SELECT 995031, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=1 AND inventorytype=10 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- hands
REPLACE INTO npc_vendor (entry, item)
(SELECT 995032, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=1 AND inventorytype=16 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- cape
REPLACE INTO npc_vendor (entry, item)
(SELECT 995033, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=1 AND inventorytype=20 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- robe

-- LEATHER
REPLACE INTO npc_vendor (entry, item)
(SELECT 995034, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=2 AND inventorytype=1 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- head
REPLACE INTO npc_vendor (entry, item)
(SELECT 995035, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=2 AND inventorytype=3 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- shoulders
REPLACE INTO npc_vendor (entry, item)
(SELECT 995036, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=2 AND inventorytype=5 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- chest
REPLACE INTO npc_vendor (entry, item)
(SELECT 995037, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=2 AND inventorytype=6 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- waist
REPLACE INTO npc_vendor (entry, item)
(SELECT 995038, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=2 AND inventorytype=7 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- legs
REPLACE INTO npc_vendor (entry, item)
(SELECT 995039, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=2 AND inventorytype=8 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- feet
REPLACE INTO npc_vendor (entry, item)
(SELECT 995040, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=2 AND inventorytype=9 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- wrists
REPLACE INTO npc_vendor (entry, item)
(SELECT 995041, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=2 AND inventorytype=10 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- hands
REPLACE INTO npc_vendor (entry, item)
(SELECT 995042, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=2 AND inventorytype=20 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- robe

-- MAIL
REPLACE INTO npc_vendor (entry, item)
(SELECT 995043, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=3 AND inventorytype=1 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- head
REPLACE INTO npc_vendor (entry, item)
(SELECT 995044, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=3 AND inventorytype=3 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- shoulders
REPLACE INTO npc_vendor (entry, item)
(SELECT 995045, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=3 AND inventorytype=5 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- chest
REPLACE INTO npc_vendor (entry, item)
(SELECT 995046, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=3 AND inventorytype=6 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- waist
REPLACE INTO npc_vendor (entry, item)
(SELECT 995047, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=3 AND inventorytype=7 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- legs
REPLACE INTO npc_vendor (entry, item)
(SELECT 995048, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=3 AND inventorytype=8 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- feet
REPLACE INTO npc_vendor (entry, item)
(SELECT 995049, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=3 AND inventorytype=9 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- wrists
REPLACE INTO npc_vendor (entry, item)
(SELECT 995050, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=3 AND inventorytype=10 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- hands
REPLACE INTO npc_vendor (entry, item)
(SELECT 995051, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=3 AND inventorytype=20 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- robe

-- PLATE
REPLACE INTO npc_vendor (entry, item)
(SELECT 995052, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=4 AND inventorytype=1 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- head
REPLACE INTO npc_vendor (entry, item)
(SELECT 995053, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=4 AND inventorytype=3 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- shoulders
REPLACE INTO npc_vendor (entry, item)
(SELECT 995054, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=4 AND inventorytype=5 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- chest
REPLACE INTO npc_vendor (entry, item)
(SELECT 995055, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=4 AND inventorytype=6 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- waist
REPLACE INTO npc_vendor (entry, item)
(SELECT 995056, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=4 AND inventorytype=7 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- legs
REPLACE INTO npc_vendor (entry, item)
(SELECT 995057, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=4 AND inventorytype=8 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- feet
REPLACE INTO npc_vendor (entry, item)
(SELECT 995058, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=4 AND inventorytype=9 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- wrists
REPLACE INTO npc_vendor (entry, item)
(SELECT 995059, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=4 AND inventorytype=10 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- hands

REPLACE INTO npc_vendor (entry, item)
(SELECT 995060, entry FROM item_template WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=6 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- shield
REPLACE INTO npc_vendor (entry, item)
(SELECT 995061, entry FROM item_template WHERE quality <= @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=7 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- libram
REPLACE INTO npc_vendor (entry, item)
(SELECT 995062, entry FROM item_template WHERE quality <= @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=8 AND disenchantid NOT IN (48, 49) AND flags != 32768); -- idol
REPLACE INTO npc_vendor (entry, item)
(SELECT 995063, entry FROM item_template WHERE quality <= @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =4 AND subclass=9 AND disenchantid NOT IN (48, 49) AND flags != 32768 OR entry IN (5175,5178,5176,5177)); -- totem

REPLACE INTO npc_vendor (entry, item)
(SELECT 995064, entry FROM item_template WHERE quality <= @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =6 AND subclass<4); -- arrows and bullets
REPLACE INTO npc_vendor (entry, item)
(SELECT 995065, entry FROM item_template WHERE quality <= @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class =11); -- quivers
REPLACE INTO npc_vendor (entry, item)
(SELECT 995086, entry FROM item_template WHERE entry IN(30623,30622,30635,30633,30634,30637,31704,31084,28395,27991,24490,15872)); -- keys
REPLACE INTO npc_vendor (entry, item)
(SELECT 995199, entry FROM item_template WHERE quality <= @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND subclass =19); -- wands


-- tier items
REPLACE INTO npc_vendor (entry, item)
(SELECT 995101, entry FROM item_template WHERE (itemlevel=@tier OR itemlevel=(@tier+8)) AND itemset IN (659,620,621,622,668)); -- rogue
REPLACE INTO npc_vendor (entry, item)
(SELECT 995109, entry FROM item_template WHERE (itemlevel=@tier OR itemlevel=(@tier+8)) AND itemset IN (650,660,651,652,669)); -- hunter
REPLACE INTO npc_vendor (entry, item)
(SELECT 995107, entry FROM item_template WHERE (itemlevel=@tier OR itemlevel=(@tier+8)) AND itemset IN (653,661,654,655,656,657,672,673)); -- warrior
REPLACE INTO npc_vendor (entry, item)
(SELECT 995106, entry FROM item_template WHERE (itemlevel=@tier OR itemlevel=(@tier+8)) AND itemset IN (660,630,631,632,633,634,635,636,682,683,684)); -- shaman
REPLACE INTO npc_vendor (entry, item)
(SELECT 995102, entry FROM item_template WHERE (itemlevel=@tier OR itemlevel=(@tier+8)) AND itemset IN (661,623,624,625,626,627,628,629,679,680,681)); -- paladin
REPLACE INTO npc_vendor (entry, item)
(SELECT 995108, entry FROM item_template WHERE (itemlevel=@tier OR itemlevel=(@tier+8)) AND itemset IN (662,658,663,664,665,666,674,675)); -- priest
REPLACE INTO npc_vendor (entry, item)
(SELECT 995105, entry FROM item_template WHERE (itemlevel=@tier OR itemlevel=(@tier+8)) AND itemset IN (647,658,648,649,671)); -- mage
REPLACE INTO npc_vendor (entry, item)
(SELECT 995103, entry FROM item_template WHERE (itemlevel=@tier OR itemlevel=(@tier+8)) AND itemset IN (658,644,645,646,670)); -- warlock
REPLACE INTO npc_vendor (entry, item)
(SELECT 995104, entry FROM item_template WHERE (itemlevel=@tier OR itemlevel=(@tier+8)) AND itemset IN (637,659,638,639,640,641,642,643,676,677,678)); -- druid


-- remove item reqs
UPDATE item_template SET requiredhonorrank=0, requiredcityrank=0, requiredreputationfaction=0, requiredreputationrank=0
WHERE quality = @quality AND (itemlevel >= 93 OR requiredlevel >= 58) AND class IN(2,3,4,6,11);
UPDATE item_template SET requiredhonorrank=0, requiredcityrank=0, requiredreputationfaction=0, requiredreputationrank=0
WHERE entry IN (30623,30622,30635,30633,30634,30637,31704,31084,28395,27991,24490,15872);

-- trainer spells
REPLACE INTO npc_trainer VALUES (26327,7328,0,0,0,12,0); -- redemption
REPLACE INTO npc_trainer VALUES (26327,34767,0,0,0,60,0); -- charger
REPLACE INTO npc_trainer VALUES (26327,23214,0,0,0,60,0); -- charger

REPLACE INTO npc_trainer VALUES (26326,28272,0,0,0,60,0); -- pig
REPLACE INTO npc_trainer VALUES (26326,28271,0,0,0,60,0); -- turtle

REPLACE INTO npc_trainer VALUES (26331,688,0,0,0,5,0); -- imp
REPLACE INTO npc_trainer VALUES (26331,697,0,0,0,10,0); -- void
REPLACE INTO npc_trainer VALUES (26331,712,0,0,0,20,0); -- bus
REPLACE INTO npc_trainer VALUES (26331,691,0,0,0,29,0); -- felhunter
REPLACE INTO npc_trainer VALUES (26331,1122,0,0,0,50,0); -- infernal
REPLACE INTO npc_trainer VALUES (26331,603,0,0,0,60,0); -- doom
REPLACE INTO npc_trainer VALUES (26331,23161,0,0,0,60,0); -- dreadsteed

REPLACE INTO npc_trainer VALUES (26332,20252,0,0,0,30,0); -- berserker
REPLACE INTO npc_trainer VALUES (26332,2458,0,0,0,30,0); -- intercept
REPLACE INTO npc_trainer VALUES (26332,71,0,0,0,10,0); -- defense

REPLACE INTO npc_trainer VALUES (26330,58753,0,0,0,10,0); -- earth totem
REPLACE INTO npc_trainer VALUES (26330,3599,0,0,0,16,0); -- fire totem
REPLACE INTO npc_trainer VALUES (26330,5394,0,0,0,30,0); -- water totem

REPLACE INTO npc_trainer VALUES (26325,883,0,0,0,10,0); -- call pet
REPLACE INTO npc_trainer VALUES (26325,5149,0,0,0,10,0); -- train pet
REPLACE INTO npc_trainer VALUES (26325,6991,0,0,0,10,0); -- feed pet
REPLACE INTO npc_trainer VALUES (26325,982,0,0,0,10,0); -- revive pet
REPLACE INTO npc_trainer VALUES (26325,2641,0,0,0,10,0); -- dismiss pet
REPLACE INTO npc_trainer VALUES (26325,1515,0,0,0,10,0); -- tame beast

REPLACE INTO npc_trainer VALUES (26324,5487,0,0,0,10,0); -- bear form
REPLACE INTO npc_trainer VALUES (26324,8946,0,0,0,14,0); -- poison
REPLACE INTO npc_trainer VALUES (26324,1066,0,0,0,18,0); -- aquatic form
REPLACE INTO npc_trainer VALUES (26324,40120,0,0,0,70,0); -- flight form

REPLACE INTO npc_trainer VALUES (995083,196,0,0,0,1,0); -- 1h axes
REPLACE INTO npc_trainer VALUES (995083,197,0,0,0,1,0); -- 2h axes
REPLACE INTO npc_trainer VALUES (995083,198,0,0,0,1,0); -- 1h maces
REPLACE INTO npc_trainer VALUES (995083,199,0,0,0,1,0); -- 2h maces
REPLACE INTO npc_trainer VALUES (995083,266,0,0,0,1,0); -- guns
REPLACE INTO npc_trainer VALUES (995083,227,0,0,0,1,0); -- staves
REPLACE INTO npc_trainer VALUES (995083,264,0,0,0,1,0); -- bows
REPLACE INTO npc_trainer VALUES (995083,2567,0,0,0,1,0); -- thrown
REPLACE INTO npc_trainer VALUES (995083,201,0,0,0,1,0); -- one hand swords
REPLACE INTO npc_trainer VALUES (995083,202,0,0,0,1,0); -- two hand swords
REPLACE INTO npc_trainer VALUES (995083,15590,0,0,0,1,0); -- fists
REPLACE INTO npc_trainer VALUES (995083,1180,0,0,0,1,0); -- daggers
REPLACE INTO npc_trainer VALUES (995083,5011,0,0,0,1,0); -- crossbows

REPLACE INTO npc_trainer VALUES (995081, 18248,0,356,225,35,0); -- fishing
REPLACE INTO npc_trainer VALUES (995080, 10846,0,129,225,35,0); -- first aid
REPLACE INTO npc_trainer VALUES (995082, 18260,0,185,225,35,0); -- cooking


-- add portals 
-- mall
REPLACE INTO gameobject_template (entry, TYPE, displayid, NAME, data0) VALUES (995000, 22, 7146, "Mall", 34673);
REPLACE INTO spell_target_position VALUES (34673, 0, 1612.45, -5524.11, 112.25, 4.23);

-- Hellfire Citadel
REPLACE INTO gameobject_template (entry, TYPE, displayid, NAME, data0) VALUES (995001, 22, 7146, "Hellfire Citadel", 30211);
REPLACE INTO spell_target_position VALUES (30211, 530, -170.34, 2979.37, 2.05, 1.78);

-- Coilfang reservoir
REPLACE INTO gameobject_template (entry, TYPE, displayid, NAME, data0) VALUES (995002, 22, 7146, "Coilfang Reservoir", 46615);
REPLACE INTO spell_target_position VALUES (46615, 530, 732.47, 6865.65, -70.1, 6.25);

-- Auchindoun
REPLACE INTO gameobject_template (entry, TYPE, displayid, NAME, data0) VALUES (995003, 22, 7146, "Auchindoun", 23460);
REPLACE INTO spell_target_position VALUES (23460, 530, -3323, 4942.16, -101.25, 3.81);

-- caverns of time
REPLACE INTO gameobject_template (entry, TYPE, displayid, NAME, data0) VALUES (995004, 22, 7146, "Caverns of Time", 25139);
REPLACE INTO spell_target_position VALUES (25139, 1, -8190.86, -4701.98, 18.13, 4.36);

-- tempest keep
REPLACE INTO gameobject_template (entry, TYPE, displayid, NAME, data0) VALUES (995005, 22, 7146, "Tempest Keep", 46616);
REPLACE INTO spell_target_position VALUES (46616, 530, 3033.80, 1797.09, 142.84, 4.12);

-- iqd
REPLACE INTO gameobject_template (entry, TYPE, displayid, NAME, data0) VALUES (995006, 22, 7146, "Isle of Quel'Danas", 41255);
REPLACE INTO spell_target_position VALUES (41255, 530, 12888.93, -7301.29, 65.39, 0.26);

-- kara
REPLACE INTO gameobject_template (entry, TYPE, displayid, NAME, data0) VALUES (995007, 22, 7146, "Karazhan", 29295);
REPLACE INTO spell_target_position VALUES (29295, 0, -11129.74, -2000.58, 48.25, 1.51);

-- blades edge
REPLACE INTO gameobject_template (entry, TYPE, displayid, NAME, data0) VALUES (995008, 22, 7146, "Gruul's Lair", 41256);
REPLACE INTO spell_target_position VALUES (41256, 530, 3552.73, 5178.5, -4.52, 5.9);

-- bt
REPLACE INTO gameobject_template (entry, TYPE, displayid, NAME, data0) VALUES (995009, 22, 7146, "Black Temple", 29273);
REPLACE INTO spell_target_position VALUES (29273, 530, -3656.6, 680.78, 1.54, 4.05);

-- za
REPLACE INTO gameobject_template (entry, TYPE, displayid, NAME, data0) VALUES (995010, 22, 7146, "Zul'Aman", 46618);
REPLACE INTO spell_target_position VALUES (46618, 530, 6825.41, -7770.72, 128.64, 4.25);


-- spawn portals
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995128','995000','530','1','-3656.51','670.659','1.56129','1.04192','0','0','0.497712','0.867343','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995127','995000','530','1','3559.72','5167.22','-5.21669','2.43247','0','0','0.937798','0.347181','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995126','995000','1','1','-8187.63','-4713.59','21.9539','0.959232','0','0','0.461438','0.887172','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995125','995000','0','1','-11123.3','-1993.86','47.4177','3.88583','0','0','0.931558','-0.363591','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995123','995000','1','1','-8361.66','-4249.35','-203.685','3.64695','0','0','0.968246','-0.249998','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995122','995000','530','1','-315.876','3039.07','-15.8489','1.41479','0','0','0.649856','0.760058','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995121','995000','530','1','-3320','4922.7','-101.01','2.19642','0','0','0.890395','0.455189','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995120','995000','530','1','12898','-7312.39','65.6651','2.486','0','0','0.946754','0.321957','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995119','995000','530','1','731.444','6842.09','-65.3993','2.34958','0','0','0.922608','0.385739','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995118','995000','530','1','6815.6','-7775.11','128.222','0.460452','0','0','0.228197','0.973615','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995117','995000','530','1','-3976.82','-13919.1','100.045','5.50486','0','0','0.379415','-0.925227','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995116','995000','1','1','10322.3','816.883','1326.52','2.01135','0','0','0.844524','0.535517','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995115','995000','0','1','-6236.74','327.487','382.62','0.134611','0','0','0.0672547','0.997736','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995114','995000','0','1','-8926.41','-141.06','81.5756','1.74079','0','0','0.764583','0.644525','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995111','995000','530','1','10338.9','-6375.29','35.4692','0.254183','0','0','0.12675','0.991935','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995112','995000','0','1','1660.5','1668.71','141.85','4.72277','0','0','0.703427','-0.710767','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995113','995000','1','1','-600.892','-4244.55','38.9561','3.18554','0','0','0.999759','-0.0219705','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995101','995001','0','1','1621.35','-5493.09','100.729','1.31386','0','0','0.61069','0.791869','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995102','995002','0','1','1633.99','-5500.18','100.729','3.86642','0','0','0.935044','-0.354531','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995103','995003','0','1','1613.54','-5491.95','100.792','4.58898','0','0','0.749366','-0.662156','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995104','995004','0','1','1640.42','-5506.86','100.729','3.34806','0','0','0.994676','-0.103049','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995105','995005','0','1','1603.57','-5492.33','100.849','5.02095','0','0','0.590048','-0.807368','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995106','995006','0','1','1643.32','-5514.15','100.729','3.52478','0','0','0.981702','-0.190422','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995107','995007','0','1','1596.39','-5494.33','100.794','5.24086','0','0','0.497891','-0.86724','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995108','995008','0','1','1646.02','-5520.78','100.729','2.942','0','0','0.995024','0.0996321','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995109','995009','0','1','1643.41','-5528.05','100.729','2.88309','0','0','0.991659','0.128891','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995110','995010','0','1','1591.25','-5500.92','100.729','5.86446','0','0','0.207835','-0.978164','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995279','187111','0','1','1575.89','-5488.35','100.965','0.291237','0','0','0.145104','0.989416','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995280','187112','0','1','1573.71','-5481.56','100.876','5.03111','0','0','0.585939','-0.810355','120','100','1');

-- mailbox
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995135','186230','0','1','1564.58','-5603.58','114.17','1','0','0','0.497712','0.867343','120','100','1');

-- spawn npcs
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140386','995199','0','1','0','0','1608.37','-5570.3','111.171','3.91792','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140287','995001','0','1','0','0','1609.58','-5573.04','111.703','2.75527','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140288','995002','0','1','0','0','1608.64','-5574.49','111.703','2.66102','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140289','995003','0','1','0','0','1581.46','-5604.84','111.172','5.84917','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140290','995004','0','1','0','0','1580.93','-5606.01','111.172','5.86095','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140292','995005','0','1','0','0','1605.64','-5580.52','111.702','2.75391','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140293','995006','0','1','0','0','1604.7','-5582.02','111.702','2.72093','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140294','995007','0','1','0','0','1594.69','-5602.05','111.17','2.71229','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140295','995008','0','1','0','0','1597.79','-5595.13','111.703','2.70915','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140296','995009','0','1','0','0','1596.94','-5596.84','111.703','2.72093','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140297','995010','0','1','0','0','1593.21','-5605','111.171','2.69266','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140298','995011','0','1','0','0','1590.03','-5610.05','111.702','2.61804','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140299','995012','0','1','0','0','1589.28','-5611.65','111.702','2.67302','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140301','995013','0','1','0','0','1580.26','-5607.47','111.171','5.84289','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140302','995014','0','1','0','0','1582.12','-5610.76','111.171','1.16977','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140304','995015','0','1','0','0','1594.57','-5571.07','111.171','2.72014','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140305','995016','0','1','0','0','1590.59','-5578.18','111.171','2.66516','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140306','995017','0','1','0','0','1586.63','-5585.86','111.171','2.66516','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140307','995018','0','1','0','0','1582.8','-5593.34','111.171','2.66909','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140308','995019','0','1','0','0','1579.08','-5600.62','111.171','2.66909','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140310','995020','0','1','0','0','1598.6','-5564.47','111.171','3.62099','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140312','995021','0','1','0','0','1602.29','-5587.48','111.171','2.58975','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140313','995022','0','1','0','0','1601.67','-5588.6','111.171','2.63687','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140314','995023','0','1','0','0','1601.04','-5589.84','111.171','2.67222','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140316','995024','0','1','0','0','1575.66','-5553.29','111.172','5.1215','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140317','995025','0','1','0','0','1582.47','-5556.95','111.172','3.32922','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140318','995026','0','1','0','0','1573.04','-5558.07','111.172','0.146753','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140319','995027','0','1','0','0','1574.37','-5554.75','111.704','5.71839','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140320','995028','0','1','0','0','1577.03','-5553.25','111.172','4.32276','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140321','995029','0','1','0','0','1578.3','-5553.84','111.172','4.27956','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140322','995030','0','1','0','0','1579.55','-5554.51','111.172','4.24814','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140323','995031','0','1','0','0','1580.9','-5555.19','111.172','4.24029','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140325','995032','0','1','0','0','1599.45','-5590.61','111.172','1.97047','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140326','995033','0','1','0','0','1573.73','-5556.34','111.703','5.87154','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140327','995034','0','1','0','0','1571.87','-5560.72','111.171','5.10028','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140328','995035','0','1','0','0','1570.61','-5562.1','111.703','5.90767','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140329','995036','0','1','0','0','1570.12','-5562.89','111.703','5.81341','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140330','995037','0','1','0','0','1569.64','-5563.92','111.703','5.89588','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140331','995038','0','1','0','0','1569.28','-5565.48','111.172','0.331336','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140332','995039','0','1','0','0','1576.08','-5568.79','111.172','2.05922','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140333','995040','0','1','0','0','1578.47','-5564.3','111.172','3.27108','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140334','995041','0','1','0','0','1579.45','-5565.92','111.172','2.75193','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140335','995042','0','1','0','0','1578.2','-5568.55','111.172','2.69696','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140336','995043','0','1','0','0','1568.08','-5568.13','111.176','5.13168','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140337','995044','0','1','0','0','1565.55','-5572.84','111.172','0.341537','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140338','995045','0','1','0','0','1572.27','-5576.29','111.172','2.06941','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140339','995046','0','1','0','0','1574.54','-5571.86','111.172','3.34568','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140340','995047','0','1','0','0','1566.53','-5568.71','111.172','5.83697','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140341','995048','0','1','0','0','1565.96','-5569.86','111.172','5.82126','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140342','995049','0','1','0','0','1565.36','-5570.99','111.172','5.79377','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140343','995050','0','1','0','0','1573.17','-5575.5','111.172','2.69145','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140344','995051','0','1','0','0','1574.09','-5573.37','111.172','2.83282','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140345','995052','0','1','0','0','1564.2','-5575.66','111.171','5.22985','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140346','995053','0','1','0','0','1561.78','-5580.14','111.171','0.242575','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140347','995054','0','1','0','0','1568.25','-5583.73','111.171','1.98538','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140348','995055','0','1','0','0','1570.82','-5579.08','111.171','3.32055','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140349','995056','0','1','0','0','1562.75','-5576.9','111.703','5.77492','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140350','995057','0','1','0','0','1562.41','-5577.76','111.703','5.90844','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140351','995058','0','1','0','0','1561.93','-5578.97','111.703','5.89273','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140352','995059','0','1','0','0','1569.93','-5581.65','111.172','2.69616','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140353','995060','0','1','0','0','1560.37','-5583.21','111.172','5.22592','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140354','995061','0','1','0','0','1557.59','-5587.82','111.173','0.250423','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140355','995062','0','1','0','0','1564.53','-5591.36','111.172','1.89583','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140356','995063','0','1','0','0','1566.92','-5586.45','111.172','3.24671','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140358','995064','0','1','0','0','1557.2','-5586.29','111.174','5.78512','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140359','995065','0','1','0','0','1558.74','-5583.55','111.174','5.71051','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140360','995066','0','1','0','0','1557.99','-5585.11','111.174','5.8401','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140362','995067','0','1','0','0','1554.19','-5593.42','111.704','5.93435','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140363','995068','0','1','0','0','1554.86','-5591.93','111.704','5.89509','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140364','995069','0','1','0','0','1556.23','-5590.34','111.171','5.16152','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140374','995070','0','1','0','0','1590.97','-5559.77','111.171','4.94394','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140375','995071','0','1','0','0','1587.9','-5558.12','111.172','4.65177','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140376','995072','0','1','0','0','1585.52','-5558.68','111.173','4.92844','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140377','995073','0','1','0','0','1583.07','-5563.12','111.171','5.91175','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140378','995074','0','1','0','0','1583.92','-5565.4','111.171','5.8175','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140379','995075','0','1','0','0','1581.53','-5565.97','111.171','5.89997','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140380','995076','0','1','0','0','1580.16','-5572.75','111.171','5.82536','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140381','995077','0','1','0','0','1579.11','-5570.54','111.171','5.84499','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140383','995078','0','1','0','0','1576.45','-5580.4','111.171','5.79236','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140384','995079','0','1','0','0','1575.51','-5577.85','111.171','5.93373','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140385','995080','0','1','0','0','1572.34','-5587.73','111.171','5.90232','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140421','26331','0','1','0','0','1597.78','-5550.78','111.705','4.3333','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140422','26324','0','1','0','0','1601.36','-5560.93','111.705','1.0637','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140423','26325','0','1','0','0','1587.93','-5553.97','111.705','1.15402','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140424','26326','0','1','0','0','1596.52','-5544','111.705','2.5913','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140425','26327','0','1','0','0','1598.89','-5530.81','111.705','4.49071','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140426','26328','0','1','0','0','1613.44','-5538.3','111.705','4.33801','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140428','26329','0','1','0','0','1604.56','-5548.75','111.705','5.78707','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140430','26330','0','1','0','0','1603.4','-5541.54','111.706','1.00043','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140434','26332','0','1','0','0','1600.67','-5531.41','111.705','4.20247','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140435','26016','0','1','0','0','1652.61','-5582.53','100.952','0.19167','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140436','26017','0','1','0','0','1654.33','-5587.78','100.992','0.678617','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140437','26019','0','1','0','0','1657.46','-5592.76','101.044','0.7925','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140438','26020','0','1','0','0','1661.1','-5595.66','101.011','1.12237','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140439','26021','0','1','0','0','1664.51','-5597.17','100.983','1.21269','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140440','26024','0','1','0','0','1667.12','-5598.71','100.92','1.33442','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140441','26027','0','1','0','0','1672.43','-5599.16','100.838','1.74283','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140442','26028','0','1','0','0','1677.69','-5597.33','100.826','2.0727','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140443','26029','0','1','0','0','1681.81','-5594.74','100.843','2.33188','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140444','26030','0','1','0','0','1684.71','-5591.38','100.867','2.53608','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140445','26031','0','1','0','0','1686.15','-5587.44','100.931','3.01518','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140446','26032','0','1','0','0','1686.68','-5583.65','100.93','3.12906','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140447','26033','0','1','0','0','1686.16','-5577.61','100.892','3.2508','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140448','26037','0','1','0','0','1684.26','-5571.4','100.836','3.67098','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140449','26038','0','1','0','0','1681.4','-5567.74','100.805','3.96551','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140451','995081','0','1','0','0','1571.45','-5585.49','111.171','5.81267','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140452','995082','0','1','0','0','1570.1','-5588.01','111.171','5.82053','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140453','995083','0','1','0','0','1568.62','-5595.09','111.171','5.9085','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140454','995084','0','1','0','0','1562.26','-5597.89','111.171','2.66088','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140456','995085','0','1','0','0','1556.83','-5597.92','111.171','1.09323','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140458','995087','0','1','0','0','1598.86','-5551.41','111.705','4.25054','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140459','995088','0','1','0','0','1568.17','-5608.93','115.398','1.10502','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140460','995089','0','1','0','0','1605.14','-5547.68','111.705','5.85276','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140461','995090','0','1','0','0','1569.62','-5613.23','114.184','1.53698','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140462','995091','0','1','0','0','1576.68','-5609.67','114.152','1.13878','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140464','995093','0','1','0','0','1564.02','-5610.26','114.184','0.698957','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140466','995094','0','1','0','0','1659.84','-5561.56','100.754','1.44666','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140467','995095','0','1','0','0','1657.33','-5561.99','100.854','1.58411','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140468','995096','0','1','0','0','1595.64','-5562.14','111.171','3.74946','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140469','995097','0','1','0','0','1558.99','-5599.03','111.171','1.02569','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140470','995098','0','1','0','0','1554.43','-5596.52','111.171','1.12387','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140472','995099','0','1','0','0','1606.7','-5568.21','111.171','4.28667','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140473','19915','0','1','0','0','1575.09','-5608.64','114.169','1.05475','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140474','995000','0','1','0','0','1563.57','-5596.65','111.17','2.74','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140471','995086','0','1','0','0','1562.84','-5593.67','111.17','3.36','120','0','0','1','0','0','0');

REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140478','20269','0','1','0','1429','1602.42','-5526.96','111.167','1.11702','120','0','0','6500','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140480','20271','0','1','0','5090','1620.91','-5530.71','111.167','2.80328','120','0','0','6400','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140482','20272','0','1','0','5507','1615.01','-5533.53','111.168','1.15081','120','0','0','7400','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140481','20273','0','1','0','1477','1619.81','-5533.41','111.156','2.61086','120','0','0','6300','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140477','20274','0','1','0','1301','1600.45','-5523.21','111.159','5.89223','120','5','0','6300','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140476','20276','0','1','0','1385','1601.79','-5520.88','111.169','5.76657','120','0','0','6300','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140479','20362','0','1','0','1542','1622.12','-5528.6','111.17','2.73887','120','0','0','6300','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140475','20384','0','1','0','1550','1603.11','-5518.26','111.168','5.83804','120','0','0','6400','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140535','995101','0','1','0','0','1603.75','-5550.51','111.172','5.95403','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140532','995102','0','1','0','0','1598.12','-5530.12','111.192','4.2288','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140537','995103','0','1','0','0','1596.43','-5549.95','111.172','4.16445','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140536','995104','0','1','0','0','1599.67','-5560.3','111.185','1.09397','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140539','995105','0','1','0','0','1597.62','-5542.2','111.172','2.71389','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140531','995106','0','1','0','0','1601.39','-5540.46','111.172','0.996047','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140533','995107','0','1','0','0','1601.59','-5531.89','111.172','4.35054','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140534','995108','0','1','0','0','1611.64','-5537.19','111.172','4.24911','120','0','0','1','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140538','995109','0','1','0','0','1589.51','-5555.26','111.172','1.01863','120','0','0','1','0','0','0');

-- insert skinning mob spawns
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140489','995201','0','1','0','0','1672.16','-5500.28','99.9179','5.00271','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140488','995201','0','1','0','0','1672.16','-5500.28','99.9179','5.00271','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140487','995201','0','1','0','0','1672.16','-5500.28','99.9179','5.00271','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140486','995201','0','1','0','0','1672.16','-5500.28','99.9179','5.00271','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140485','995201','0','1','0','0','1672.16','-5500.28','99.9179','5.00271','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140484','995201','0','1','0','0','1672.16','-5500.28','99.9179','5.00271','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140483','995201','0','1','0','0','1672.16','-5500.28','99.9179','5.00271','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140490','995201','0','1','0','0','1672.16','-5500.28','99.9179','5.00271','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140491','995202','0','1','0','0','1680.6','-5512.48','98.3529','4.14427','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140492','995202','0','1','0','0','1680.6','-5512.48','98.3529','4.14427','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140493','995202','0','1','0','0','1680.6','-5512.48','98.3529','4.14427','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140494','995202','0','1','0','0','1680.6','-5512.48','98.3529','4.14427','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140495','995202','0','1','0','0','1680.6','-5512.48','98.3529','4.14427','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140496','995202','0','1','0','0','1680.6','-5512.48','98.3529','4.14427','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140497','995202','0','1','0','0','1680.6','-5512.48','98.3529','4.14427','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140498','995202','0','1','0','0','1680.6','-5512.48','98.3529','4.14427','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140499','995203','0','1','0','0','1690.77','-5526.01','98.6342','5.25561','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140500','995203','0','1','0','0','1690.77','-5526.01','98.6342','5.25561','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140501','995203','0','1','0','0','1690.77','-5526.01','98.6342','5.25561','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140502','995203','0','1','0','0','1690.77','-5526.01','98.6342','5.25561','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140503','995203','0','1','0','0','1690.77','-5526.01','98.6342','5.25561','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140504','995203','0','1','0','0','1690.77','-5526.01','98.6342','5.25561','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140505','995203','0','1','0','0','1690.77','-5526.01','98.6342','5.25561','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140506','995203','0','1','0','0','1690.77','-5526.01','98.6342','5.25561','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140507','995204','0','1','0','0','1703.34','-5542.21','103.121','2.90334','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140508','995204','0','1','0','0','1703.34','-5542.21','103.121','2.90334','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140509','995204','0','1','0','0','1703.34','-5542.21','103.121','2.90334','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140510','995204','0','1','0','0','1703.34','-5542.21','103.121','2.90334','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140511','995204','0','1','0','0','1702.54','-5542.02','103.022','2.90334','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140512','995204','0','1','0','0','1701.75','-5541.82','102.922','2.90334','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140513','995204','0','1','0','0','1701.75','-5541.82','102.922','2.90334','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140514','995204','0','1','0','0','1701.75','-5541.82','102.922','2.90334','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140515','995205','0','1','0','0','1698.5','-5556.22','102.306','2.70306','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140516','995205','0','1','0','0','1698.5','-5556.22','102.306','2.70306','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140517','995205','0','1','0','0','1698.5','-5556.22','102.306','2.70306','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140518','995205','0','1','0','0','1698.5','-5556.22','102.306','2.70306','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140519','995205','0','1','0','0','1698.5','-5556.22','102.306','2.70306','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140520','995205','0','1','0','0','1698.5','-5556.22','102.306','2.70306','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140521','995205','0','1','0','0','1698.5','-5556.22','102.306','2.70306','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140522','995205','0','1','0','0','1698.5','-5556.22','102.306','2.70306','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140523','995206','0','1','0','0','1699.97','-5573.91','102.894','2.73526','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140524','995206','0','1','0','0','1699.97','-5573.91','102.894','2.73526','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140525','995206','0','1','0','0','1699.97','-5573.91','102.894','2.73526','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140526','995206','0','1','0','0','1699.97','-5573.91','102.894','2.73526','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140527','995206','0','1','0','0','1699.97','-5573.91','102.894','2.73526','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140528','995206','0','1','0','0','1699.97','-5573.91','102.894','2.73526','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140529','995206','0','1','0','0','1699.97','-5573.91','102.894','2.73526','120','5','0','1','0','0','1');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES('140530','995206','0','1','0','0','1699.97','-5573.91','102.894','2.73526','120','5','0','1','0','0','1');


-- fix pets
UPDATE creature_template SET minlevel = 70 WHERE entry BETWEEN 26016 AND 26038;
UPDATE creature_template SET maxlevel = 70 WHERE entry BETWEEN 26016 AND 26038;
UPDATE creature_template SET faction = 7 WHERE entry BETWEEN 26016 AND 26038;
UPDATE creature_template SET meleebaseattacktime = 2000 WHERE entry BETWEEN 26016 AND 26038;
UPDATE creature_template SET minlevelhealth = 20000 WHERE entry BETWEEN 26016 AND 26038;
UPDATE creature_template SET maxlevelhealth = 20000 WHERE entry BETWEEN 26016 AND 26038;


-- sitting
REPLACE INTO creature_addon (guid, bytes1) VALUES
(140459,1),(140299,1),(140298,1),(140296,1),(140295,1),(140293,1),(140292,1),(140288,1),(140287,1),(140319,1),(140326,1),(140328,1),(140329,1),
(140330,1),(140349,1),(140350,1),(140351,1),(140363,1),(140362,1),(140365,1),(140421,1),(140458,1),(140423,1),(140422,1),(140428,1),(140460,1),(140426,1),(140430,1),(140424,1),(140425,1),(140434,1);


-- fix benches
UPDATE gameobject_template SET flags=4 WHERE entry BETWEEN 147435 AND 147450;


-- add mining and herb objects
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995136','1731','0','1','1569.82','-5490.47','101.291','1.94482','0','0','0.826245','0.563311','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995137','1732','0','1','1567.65','-5491.75','101.267','2.19615','0','0','0.890332','0.455313','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995138','1733','0','1','1565.82','-5493.26','101.264','2.25897','0','0','0.904193','0.427124','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995139','1735','0','1','1564.03','-5495.05','101.204','2.40034','0','0','0.932101','0.362199','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995140','1734','0','1','1562.16','-5496.77','101.103','2.35008','0','0','0.922705','0.385507','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995141','2040','0','1','1560.78','-5498.68','101.007','2.59198','0','0','0.962478','0.27136','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995142','2047','0','1','1558.97','-5500.61','100.971','2.44354','0','0','0.939707','0.341982','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995143','165658','0','1','1557.31','-5502.45','100.884','2.5535','0','0','0.957079','0.289827','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995144','324','0','1','1556','-5504.46','100.835','2.54565','0','0','0.955933','0.293584','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995145','175404','0','1','1554.28','-5506.56','100.81','2.62419','0','0','0.966722','0.255827','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995150','1618','0','1','1567.14','-5483.87','101.318','5.19716','0','0','0.516716','-0.856157','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995151','1617','0','1','1565.36','-5484.99','101.439','5.27178','0','0','0.484424','-0.874833','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995152','181166','0','1','1563.6','-5485.47','101.511','5.27178','0','0','0.484424','-0.874833','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995153','1619','0','1','1561.38','-5486.96','101.371','5.31104','0','0','0.467155','-0.884175','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995154','1620','0','1','1559.84','-5488.01','101.191','5.31104','0','0','0.467155','-0.884175','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995155','1621','0','1','1558.22','-5489.16','101.12','5.42885','0','0','0.414295','-0.910143','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995156','2045','0','1','1556.63','-5490.71','101.003','5.50346','0','0','0.380061','-0.924961','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995157','1622','0','1','1555.36','-5492.23','100.974','5.58593','0','0','0.341611','-0.939842','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995158','1623','0','1','1554.2','-5493.7','100.968','5.63697','0','0','0.317513','-0.948254','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995159','1628','0','1','1552.82','-5495.58','100.861','5.68409','0','0','0.295086','-0.955471','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995160','1624','0','1','1551.57','-5497.27','100.816','5.70373','0','0','0.285691','-0.958322','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995161','2041','0','1','1550.48','-5499.05','100.8','5.77049','0','0','0.253551','-0.967322','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995162','2042','0','1','1549.25','-5501.04','100.795','5.74692','0','0','0.26493','-0.964268','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995163','2046','0','1','1548.25','-5502.89','100.806','5.8019','0','0','0.238327','-0.971185','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995164','2043','0','1','1547.34','-5504.78','100.825','5.88044','0','0','0.200016','-0.979793','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995165','2044','0','1','1546.7','-5507.14','100.801','6.02966','0','0','0.126424','-0.991976','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995166','2866','0','1','1546.01','-5509.02','100.811','6.02652','0','0','0.127983','-0.991776','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995167','142140','0','1','1545.53','-5510.83','100.817','6.02652','0','0','0.127983','-0.991776','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995168','142141','0','1','1544.96','-5513.08','100.834','6.03437','0','0','0.124088','-0.992271','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995169','142142','0','1','1544.59','-5515.39','100.903','6.14432','0','0','0.0693752','-0.997591','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995170','142143','0','1','1544.3','-5517.47','100.995','6.14432','0','0','0.0693752','-0.997591','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995171','142144','0','1','1544.06','-5519.68','101.155','6.22679','0','0','0.0281956','-0.999602','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995172','142145','0','1','1543.96','-5521.78','101.232','0.00250435','0','0','0.00125217','0.999999','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995173','176583','0','1','1544.08','-5523.88','101.217','0.0849712','0','0','0.0424728','0.999098','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995174','176584','0','1','1544.22','-5525.5','101.188','0.0849712','0','0','0.0424728','0.999098','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995175','176586','0','1','1544.22','-5527.5','101.201','0.116387','0','0','0.0581607','0.998307','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995176','176587','0','1','1544.3','-5529.85','101.331','0.139949','0','0','0.0699174','0.997553','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995177','176588','0','1','1544.41','-5531.85','101.449','0.167438','0','0','0.0836212','0.996498','1','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995178','176589','0','1','1544.31','-5533.34','101.426','0.206708','0','0','0.10317','0.994664','1','100','1');

-- make fences for skinning mobs
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995192','211062','0','1','1531.96','-5491.98','101.465','1.20184','0','0','0.565402','0.824815','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995193','211062','0','1','1530.32','-5496.56','102.135','2.81191','0','0','0.986444','0.164096','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995194','211062','0','1','1532.45','-5491.85','101.369','1.36678','0','0','0.631423','0.775438','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995195','211062','0','1','1532.45','-5491.85','103.009','2.83547','0','0','0.988309','0.152465','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995196','211062','0','1','1709.87','-5537.72','103.207','5.7642','0','0','0.256589','-0.966521','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995197','211062','0','1','1705.81','-5535.44','102.84','5.84274','0','0','0.218445','-0.975849','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995198','211062','0','1','1701.65','-5533.72','101.857','0.0307957','0','0','0.0153973','0.999881','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995199','211062','0','1','1709.87','-5538.22','103.21','1.81758','0','0','0.78876','0.614702','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995200','211062','0','1','1705.45','-5551.29','103.294','5.96056','0','0','0.160615','-0.987017','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995201','211062','0','1','1701.16','-5549.85','102.874','5.95662','0','0','0.162556','-0.986699','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995202','211062','0','1','1696.89','-5548.28','102.276','5.54823','0','0','0.359265','-0.933236','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995203','211062','0','1','1693.67','-5545.09','102.128','4.99452','0','0','0.600667','-0.799499','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995204','211062','0','1','1697.3','-5534.29','101.246','0.973278','0','0','0.467658','0.88391','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995205','211062','0','1','1701.4','-5533.2','101.659','5.12019','0','0','0.549276','-0.835641','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995206','211062','0','1','1699.6','-5528.97','100.334','5.24036','0','0','0.498107','-0.867116','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995207','211062','0','1','1697.22','-5525.04','98.5716','5.55844','0','0','0.354496','-0.935058','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995208','211062','0','1','1693.72','-5521.92','96.8515','5.57807','0','0','0.3453','-0.938492','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995209','211062','0','1','1690.15','-5519.31','96.2201','6.20245','0','0','0.0403546','-0.999185','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995210','211062','0','1','1685.62','-5519.11','97.6738','6.26136','0','0','0.0109138','-0.99994','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995211','211062','0','1','1682','-5520.09','99.281','1.72569','0','0','0.759694','0.650281','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995212','211062','0','1','1682.75','-5524.51','100.266','1.71783','0','0','0.757135','0.653259','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995213','211062','0','1','1683.59','-5528.98','101.306','2.52522','0','0','0.952885','0.303331','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995214','211062','0','1','1687.33','-5531.63','101.14','2.52522','0','0','0.952885','0.303331','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995215','211062','0','1','1681.94','-5519.08','99.2021','3.12998','0','0','0.999983','0.00580625','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995216','211062','0','1','1686.4','-5519.14','97.7489','3.15354','0','0','0.999982','-0.00597382','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995217','211062','0','1','1691.16','-5519.73','98.3796','2.42704','0','0','0.936853','0.349723','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995218','211062','0','1','1697.06','-5524.86','100.235','5.51758','0','0','0.37352','-0.927622','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995219','211062','0','1','1682.73','-5524.04','100.809','4.95603','0','0','0.615941','-0.787793','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995220','211062','0','1','1683.56','-5528.48','101.657','4.87749','0','0','0.646393','-0.763004','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995221','211062','0','1','1690.56','-5519.36','99.032','6.07522','0','0','0.103795','-0.994599','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995222','211062','0','1','1693.73','-5521.7','99.8377','5.58043','0','0','0.344194','-0.938899','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995223','211062','0','1','1689.83','-5518.45','95.9971','5.1681','0','0','0.529101','-0.848559','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995224','211062','0','1','1689.83','-5518.45','97.6373','5.15632','0','0','0.53409','-0.845428','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995225','211062','0','1','1689.83','-5518.45','99.2776','5.15632','0','0','0.53409','-0.845428','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995226','211062','0','1','1687.88','-5514.34','95.5936','5.15632','0','0','0.53409','-0.845428','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995228','211062','0','1','1687.88','-5514.34','98.874','5.15632','0','0','0.53409','-0.845428','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995229','211062','0','1','1686.01','-5510.22','96.2367','5.14062','0','0','0.540713','-0.841207','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995230','211062','0','1','1686.01','-5510.22','97.8769','5.14062','0','0','0.540713','-0.841207','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995231','211062','0','1','1686.01','-5510.22','99.5171','5.14062','0','0','0.540713','-0.841207','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995232','211062','0','1','1683.85','-5506.21','96.988','5.7768','0','0','0.250498','-0.968117','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995233','211062','0','1','1683.85','-5506.21','98.6282','5.7768','0','0','0.250498','-0.968117','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995234','211062','0','1','1683.85','-5506.21','100.268','5.7768','0','0','0.250498','-0.968117','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995235','211062','0','1','1681.49','-5519.01','99.2155','0.00804184','0','0','0.00402091','0.999992','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995236','211062','0','1','1681.34','-5519.01','100.856','0.00804184','0','0','0.00402091','0.999992','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995238','211062','0','1','1679.84','-5504.34','98.3864','0.350774','0','0','0.174489','0.984659','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995239','211062','0','1','1679.84','-5504.34','100.027','0.350774','0','0','0.174489','0.984659','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995240','211062','0','1','1675.57','-5506.42','100.679','1.20686','0','0','0.567469','0.823394','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995241','211062','0','1','1674.16','-5510.86','101.303','1.49353','0','0','0.679268','0.733891','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995242','211062','0','1','1674.36','-5510.12','102.151','4.47019','0','0','0.78735','-0.616506','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995244','211062','0','1','1673.68','-5515.32','100.997','1.47783','0','0','0.673485','0.739201','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995245','211062','0','1','1673.68','-5515.32','102.637','1.47783','0','0','0.673485','0.739201','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995246','211062','0','1','1673.7','-5514.87','102.791','4.62178','0','0','0.738405','-0.674358','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995247','211062','0','1','1695','-5547.43','102.148','1.11498','0','0','0.529056','0.848587','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995249','211062','0','1','1690.37','-5559.64','101.295','2.10457','0','0','0.868559','0.495586','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995250','211062','0','1','1692.88','-5563.61','101.352','2.98029','0','0','0.99675','0.0805619','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995251','211062','0','1','1697.52','-5563.99','101.95','3.35729','0','0','0.99419','-0.107637','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995252','211062','0','1','1704.04','-5566.56','103.41','1.94357','0','0','0.825893','0.563828','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995253','211062','0','1','1705.48','-5571.01','104.017','1.70402','0','0','0.752605','0.658472','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995254','211062','0','1','1706.08','-5575.46','104.503','1.60585','0','0','0.719389','0.694607','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995255','211062','0','1','1706.02','-5580.04','104.854','0.844009','0','0','0.40959','0.91227','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995256','211062','0','1','1702.82','-5583.27','104.122','0.325646','0','0','0.162104','0.986774','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995257','211062','0','1','1698.51','-5584.33','102.551','5.92554','0','0','0.177872','-0.984054','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995258','211062','0','1','1694.57','-5582.44','101.353','5.28151','0','0','0.480159','-0.877182','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995259','211062','0','1','1692.08','-5578.6','100.89','5.24225','0','0','0.497288','-0.867586','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995260','211062','0','1','1690.16','-5574.64','100.961','4.54324','0','0','0.764311','-0.644848','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995261','211062','0','1','1690.91','-5570.21','101.342','4.54324','0','0','0.764311','-0.644848','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995262','211062','0','1','1679.99','-5503.77','98.29','5.13229','0','0','0.544209','-0.838949','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995263','211062','0','1','1679.99','-5503.77','99.9303','5.13229','0','0','0.544209','-0.838949','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995264','211062','0','1','1678.13','-5499.6','98.2157','5.13229','0','0','0.544209','-0.838949','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995265','211062','0','1','1678.13','-5499.6','99.8559','5.13229','0','0','0.544209','-0.838949','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995266','211062','0','1','1676.27','-5495.45','98.1009','5.13229','0','0','0.544209','-0.838949','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995267','211062','0','1','1676.27','-5495.45','99.7411','5.13229','0','0','0.544209','-0.838949','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995268','211062','0','1','1674.14','-5491.74','98.0842','0.36885','0','0','0.183381','0.983042','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995269','211062','0','1','1674.14','-5491.74','99.7244','0.427755','0','0','0.212251','0.977215','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995270','211062','0','1','1670','-5493.63','99.4048','0.427755','0','0','0.212251','0.977215','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995271','211062','0','1','1670','-5493.63','101.045','0.427755','0','0','0.212251','0.977215','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995272','211062','0','1','1666.26','-5495.79','100.553','1.64434','0','0','0.732624','0.680634','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995273','211062','0','1','1666.58','-5500.25','100.698','1.64434','0','0','0.732624','0.680634','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995274','211062','0','1','1673.66','-5510.06','101.47','5.67343','0','0','0.300175','-0.953884','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995275','211062','0','1','1673.66','-5510.06','103.11','5.67343','0','0','0.300175','-0.953884','120','100','1');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmax`, `animprogress`, `state`) VALUES('995278','211062','0','1','1690.5','-5559.15','101.304','4.37673','0','0','0.815288','-0.579056','120','100','1');

