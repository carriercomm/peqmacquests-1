-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("<SNORT!>  HHUUUUCCCSSH..  Peh!  You speak at Kaglari, High Priestess of Dark Ones.  Children of Hate.  Spawn of Innoruuk.  e.other:GetCleanName() . speak or be gone!  <SNORT!>  You [wish majik power]?");
	elseif (e.message:findi("wish majik power")) then
		e.self:Say("GOOD! <SNORT> Innoruuk needs more childrens.  You show majik skill or I give you to Innoruuk.  You bring two snake scales and two bone chips ..<SNORT>..  from old bones.  I teach you majik.  GO!  <SNORT!!>");
	elseif (e.message:findi("help innoruuk")) then
		e.self:Say("Me hears orcs nearby are trubble. Da werd frum Neriak is dey wants us ta kills dem before dey organize. Dark elf say ta looks for Deathfist Clan. Say dey called cen-tu-ri-ons. Dey try ta gets big orc army. Shows me ya can strike fear and hate inta dem orcs.. dey needs be more scared a us den dem humies. Brings me a Deathfist slashed belt.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 13073, item2 = 13073, item3 = 13070, item4 = 13070})) then -- Majik power
		e.self:Say("Good. Innoruuk get special gift. Not you, dis time. Here. Learning majik wid dis. You more want to [help Innoruuk]?");
		e.other:SummonItem(15093);
		e.other:Ding();
		e.other:Faction(70,5,0);  -- +Dark Ones
		e.other:Faction(292,5,0);  -- +Shadowknights of Night Keep
		e.other:Faction(106,-10,0); -- -Frogloks of Guk
		e.other:AddEXP(100);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13916})) then -- More Help for Innoruuk
		e.self:Say("Good job. Dat help lerns um. Takes dis ta help ya lerns how ta do more hateful tings. Ya gots a good starts fer Him ta be prouds a ya.");
		e.other:SummonItem(15272);
		e.other:Ding();
		e.other:Faction(70,5,0);  -- +Dark Ones
		e.other:Faction(292,5,0);  -- +Shadowknights of Night Keep
		e.other:Faction(106,-10,0); -- -Frogloks of Guk
		e.other:AddEXP(150);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 18791})) then -- Tattered Note
		e.self:Say("Good.. Kaglari need you help.. Kaglari teach you majik now.");
		e.other:SummonItem(13529); -- Muck Stained Tunic
		e.other:Ding();
		e.other:Faction(70,5,0);  -- +Dark Ones
		e.other:Faction(292,5,0);  -- +Shadowknights of Night Keep
		e.other:Faction(106,-10,0); -- -Frogloks of Guk
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end