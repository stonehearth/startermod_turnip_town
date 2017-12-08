turnip_town_server = {}

-- the 'radiant:new_game' event is triggered whenever a new game starts
radiant.events.listen(turnip_town_server, 'radiant:new_game', function(args)
      _radiant.sim.start_game()
      local script = require 'world.turnip_town_world'
      script() -- call __init on script
   end)

return turnip_town_server
