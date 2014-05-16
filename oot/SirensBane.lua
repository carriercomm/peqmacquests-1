function event_spawn(e)
	e.self:Shout("I've spawned! Name is: " .. e.self:GetName() .. "");
end

function event_waypoint_arrive(e)
	-- Freeport
	if(e.self:GetGrid() == 60 and e.wp == 17) then
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(10,-1853,-748,-80,0);
			end,
			function(ent)
				if(ent:GetBoatID() == 771) then
					return true;
				end
				return false;
			end
		);
	-- Butcher
	elseif(e.self:GetGrid() == 61 and e.wp == 15) then
		-- This grid zones a few seconds after the other.
		eq.spawn_condition("oot",0,1,0);
		eq.spawn_condition("oot",0,2,0);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(68,4591,2090,-15,0);
			end,
			function(ent)
				if(ent:GetBoatID() == 771) then
					return true;
				end
				return false;
			end
		);
	end
end

function event_signal(e)
	e.self:PauseWandering(0);
	if(e.signal == 1) then
		e.self:SetCurrentWP(14);
		e.self:ResumeWandering();
	elseif(e.signal == 2) then
		e.self:SetCurrentWP(15);
		e.self:ResumeWandering();
	end
end