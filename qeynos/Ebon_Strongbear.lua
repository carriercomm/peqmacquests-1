function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome. I am the champion of the Steel Warriors. There are none who can challenge me. I guide this brotherhood of Steel Warriors. From Qeynos to the trade city of Freeport, the ways of the Steel Warriors are taught. I welcome all [young Steel Warriors].");
	elseif(e.message:findi("young steel warrior")) then
		e.self:Say("Then listen well to the words of the trainers of this arena. Learn to aid our friends such as the Knights of Thunder, the Priests of Life, the rangers and druids of Surefall Glade, the monks of the Silent Fist Clan and always support the Qeynos Guards for many of our brothers have entered their ranks. Oh yes.. You can also trust the bards of this city, after all, they do perform at all of our major events. If you are a [new recruit] I have some tasks for you to complete.");
	elseif(e.message:findi("I am a new recruit")) then
		e.self:Say("I am always pleased to see new blood ready to serve the Steel Warriors. All new recruits are asked to go through training that I personally oversee. These training exercises will test both your mind body and spirit because they are not easily completed. If you are [ready to begin] I will explain to you how the tests work and present you with your Steel Warriors Assembly Kit.");
	elseif(e.message:findi("ready to begin")) then
		e.other:SummonItem(17268);
		e.self:Say("Here is your Steel Warriors Assembly Kit. In this kit you will combine numerous [magical items] that can be infused in certain quantities to create an armor material. These armor materials can then be placed in a forge along with the correct mold to fashion a piece of Battlemasters Platemail Armor.");
	elseif(e.message:findi("What magical items")) then
		e.self:Say("The items you will need for your armor materials will be collected throughout the Qeynos area. You will find items that you need by hunting and by talking to local merchants. Once you are ready to begin collecting the items for an armor material you must simply tell me what piece you [want] to craft. I can provide you with the recipes and armor molds for Battlemasters Platemail [Helm], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplate].");
	elseif(e.message:findi("helm")) then
		e.other:SummonItem(22610); -- creates Item ID: 27460, final combine produces Item ID 27358
		e.self:Say("To create your helm material you will need to combine 2 Bricks of Crude Iron, 1 Giant Whiskered Bat Eye, 1 Snake Scales and 1 Brandy in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Helm of the Battlemaster.");
	elseif(e.message:findi("bracer")) then
		e.other:SummonItem(22611); -- creates item ID: 27461, final combine produces Item ID 27359
		e.self:Say("To create your bracer material you will need to combine 1 Brick of Crude Iron, 1 King Snake Poison Sac, 1 Gray Wolf Fang and 1 Rat Eye in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Battlemaster.");
	elseif(e.message:findi("armguard")) then
		e.other:SummonItem(22613); -- creates item ID: 27460, final combine produces Item ID 27360
		e.self:Say("To create your armguards material you will need to combine 2 Bricks of Crude Iron, 2 Rabid Grizzly Skins, 1 Giant Bat Wing and 1 Mistletoe in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Armguards of the Battlemaster.");
	elseif(e.message:findi("boot")) then
		e.other:SummonItem(22612); -- creates item ID: 27463, final combine produces Item ID 27361
		e.self:Say("To create your boot material you will need to combine 3 Bricks of Crude Iron, 1 Gnoll Backbone and 2 Ruined Blackburrow Gnoll Pelt in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boots of the Battlemaster.");
	elseif(e.message:findi("greave")) then
		e.other:SummonItem(22614); -- creates item ID: 27464, final combine produces Item ID 27362
		e.self:Say("To create your greaves material you will need to combine 4 Bricks of Crude Iron, 1 Giant Fire Beetle Brain, 1 Lion Tail, 1 Bottle and 1 Young Plains Cat Scalp in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Greaves of the Battlemaster.");
	elseif(e.message:findi("gauntlet")) then
		e.other:SummonItem(22615); -- creates item ID: 27465, final combine produces Item ID 27363
		e.self:Say("To create your gauntlet material you will need to combine 3 Bricks of Crude Iron, 1 Spider Legs, 1 Brown Bear Paw, and 2 Mist Wolf Pelts in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Battlemaster.");
	elseif(e.message:findi("breastplate")) then
		e.other:SummonItem(22616); -- creates item ID: 27466, final combine produces Item ID 27364
		e.self:Say("To create your breastplate material you will need to combine 5 Bricks of Crude Iron, 1 Thick Grizzly Bear Skin, 1 Woven Spider Silk, 1 Burned Out Lightstone, 1 Matted Lion Pelt and 1 Golden Bandit Tooth in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Breastplate of the Battlemaster. Once you have completed your breastplate and finished your armor please return to me for I have an [important mission] that I can only trust one of my finest warriors such as yourself with.");
	elseif(e.message:findi("important mission")) then
		e.self:Say("I have heard word that the corrupt guards are up to it again and this time one has gone too far. Guard Beris has stolen my sisters coinpurse by claiming it was due for city tax. This is not true because my family is held in high regard here and we always pay our taxes promptly. This was simply a ploy to steal money and I do not take kindly to that. I must ask that you retrieve my sisters coinpurse from Beris, he can usually be found in the hills fishing on his off-duty time. Bring me whatever you can from him along with 3 perfect gnoll skins and I will reward you with a finely refined blade for your trouble.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18707})) then -- Recruitment Flyer
		e.self:Say("Welcome to the Hall of Steel, our swords are strong, and our warriors stronger. Here is our guild tunic. Brin Stolunger is in charge of our new recruits. Go see him, and he'll teach the basics. You look like you'll make a fine addition to our guild.");
		e.other:SummonItem(13572); -- Dirty Training Tunic*
		e.other:Ding();
		e.other:Faction(311,100,0); -- Steel Warriors
		e.other:Faction(135,20,0); -- Guard of Qeynos
		e.other:Faction(53,-15,0); -- Corrupted Qeynos Guard
		e.other:Faction(105,-15,0); -- The Freeport Militia
		e.other:Faction(184,20,0); -- Knight of Truth
		e.other:AddEXP(100);
		e.other:GiveCash(0,0,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 27421,item2 = 27421, item3 = 27421,item4 = 27422})) then
		e.self:Say("I salute you young warrior! Take this reward with pride.");
		e.other:SummonItem(27492);
		e.other:Ding();
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1138 -- Ebon_Strongbear