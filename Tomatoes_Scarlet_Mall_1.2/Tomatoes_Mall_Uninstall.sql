/* 
uninstalls the mall and revert to pre-install state for item stats, portal positions, gameobject spawns
*/


DROP TABLE IF EXISTS item_template;
CREATE TABLE item_template LIKE item_template_backup;
REPLACE INTO item_template SELECT * FROM item_template_backup;

DROP TABLE IF EXISTS spell_target_position;
CREATE TABLE spell_target_position LIKE spell_target_position_backup;
REPLACE INTO spell_target_position SELECT * FROM spell_target_position_backup;

DROP TABLE IF EXISTS gameobject;
CREATE TABLE gameobject LIKE gameobject_backup;
REPLACE INTO gameobject SELECT * FROM gameobject_backup;

UPDATE creature SET spawnMask=1 WHERE id IN (9448,1198,9451,9450,10828,9452,9447,9449,11898);

DELETE FROM creature_template WHERE entry >= 995000 AND entry <996000;

DELETE FROM creature WHERE id >= 995000 AND id <996000 OR id=10828 OR guid=140473;
DELETE FROM creature WHERE id IN (20272,20273,20271,20362,20269,20274,20276,20384) AND map=0;

DELETE FROM npc_vendor WHERE entry >= 995000 AND entry <996000;

DELETE FROM gameobject_template WHERE entry >= 995000 AND entry <996000;

UPDATE gameobject_template SET flags=0 WHERE entry BETWEEN 147435 AND 147450;

DELETE FROM npc_trainer WHERE spell IN (40120,1066,8946,5487,1515,2641,982,6991,5194,883,5394,3599,58753,71,2458,20252,23161,603,1122,691,712,697,688,28271,28272,23214,34767,7328) OR entry BETWEEN 995000 AND 996000;

DELETE FROM creature_addon WHERE guid IN (140459, 140299, 140298, 140296, 140295, 140293, 140292, 140288, 140287, 140319, 140326, 140328, 140329, 140330, 140349, 140350, 140351, 140363, 140364, 140365, 140421, 140458, 140423, 140422, 140428, 140460,140426, 140430, 140424, 140425, 140434);
