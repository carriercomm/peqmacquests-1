function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! Spend your time wisely in the city of Qeynos. Do not let your mind wander to thoughts of bravado or crime. My guards can easily put to rest any outbreaks. Good day to you, citizen!");
	elseif(e.message:findi("executioner")) then
		e.self:Say("The executioner is quite an exceptional person.  [Field Marshall Ralem] happened upon her while on a secret operation in Everfrost Peaks.  They fought side by side against some creature the locals named Iceberg.  The creature escaped.  Ralem was grateful and eventually recruited her when she decided to separate from the guards of Halas.");
	elseif(e.message:findi("field marshall ralem")) then
		e.self:Say("Field Marshall Ralem Christof is in charge of a brigade of roving rangers, druids and warriors.  He hails from the Jaggedpine.  He is quite an exceptional ranger.  No one is ever really sure where he is.  His brigade is constantly on the move.");
	end
end

function event_signal(e)
	e.self:Say("Ah.  Good.  You have arrived.  [Executioner], could you please visit McNeal Jocub at Fish's Tavern.  He has violated our laws and the sentence is death.");
	eq.signal(1202);
end

function event_trade(e)
	local fang = 0;
	
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 13915, item3 = 13915, item4 = 13915})) then -- Gnoll Fang
		fang = 4;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 13915, item3 = 13915})) then	
		fang = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 13915})) then
		fang = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13915})) then
		fang = 1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18811})) then
		e.self:Say("I heard you were on your way.  I have called for the state [executioner].  She should be on her way now.  She will deal with our friend, McNeal Jocub.  Thank you for your help, citizen.");
		e.other:Faction(135,40,0); -- Guards of Qeynos
		e.other:Faction(9,6,0); -- Antonius Bayle
		e.other:Faction(53,-6,0); -- Corrupt Qeynos Guards
		e.other:Faction(33,-10,0); -- Circle of Unseen Hands
		e.other:Faction(217,4,0); -- Merchants of Qeynos
		e.other:QuestReward(e.self,math.random(10),math.random(9),math.random(9),math.random(9),13305,500);
		eq.spawn2(1202,62,0,-412,75,-24,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18912})) then
		e.self:Say("So, an assassin has been sent to Qeynos! I shall have my guards keep an eye out for any suspicious looking visitors. As for you... you should speak with the Surefall Glade ambassador. Ambassador Gash is staying at the Lion's Mane Inn here in South Qeynos. Inform him that [an assassin has been sent to kill] him. Do not let the assassin near him!");
		e.other:Faction(135,5,0); -- Guards of Qeynos
		e.other:Faction(9,1,0); -- Antonius Bayle
		e.other:Faction(53,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(33,-1,0); -- Circle of Unseen Hands
		e.other:Faction(217,1,0); -- Merchants of Qeynos
		e.other:QuestReward(e.self,math.random(10),math.random(9),math.random(9),math.random(9),0,500);
	end
	
	if(fang > 0) then
		repeat
			e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
			e.other:Faction(135,3); -- Guards of Qeynos
			e.other:Faction(9,1); -- Antonius Bayle
			e.other:Faction(53,-1); -- Corrupt Qeynos Guards
			e.other:Faction(33,-1); -- Circle of Unseen Hands
			e.other:Faction(217,1); -- Merchants of Qeynos
			e.other:QuestReward(e.self,0,0,0,0,10070,20000);
			fang = fang - 1;
		until fang == 0
	end		
	
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1077 -- Captain_Tillin