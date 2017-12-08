local MicroWorld = require 'lib.micro_world'

local TurnipTown = class(MicroWorld)

function TurnipTown:__init()
   -- create a tiny world
   self[MicroWorld]:__init(128 * 2)
   self:create_world()

   local player_id = self:get_session().player_id
   local pop = stonehearth.population:get_population(player_id)

   -- create a settlement with a banner and firepit
   local workers = self:create_settlement({ worker = 1, farmer = 3, engineer = 1 }, 0, 0)

   self:place_item('stonehearth:engineer:workbench', 13, 8, player_id, { force_iconic = false })

   -- and a cute little fox.
   for x = -6, 6, 2 do
      for y = -6, 6, 2 do
         self:place_item('stonehearth:red_fox', x, y, player_id)
      end
   end

   self:place_stockpile_cmd(player_id, 15, 3, 10, 10)

   -- give some of the workers some starting items.
   local pop = stonehearth.population:get_population(player_id)

   local function pickup(who, uri)
      local item = pop:create_entity(uri)
      radiant.entities.pickup_item(who, item)
   end


   stonehearth.game_master:start()
end

return TurnipTown
