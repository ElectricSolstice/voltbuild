local fuel_spec = "list[current_name;fuel;"..voltbuild.fuel_location.."]"

minetest.register_node("voltbuild:generator", {
	description = "Generator",
	tiles = {"itest_generator_side.png", "itest_generator_side.png", "itest_generator_side.png",
		"itest_generator_side.png", "itest_generator_side.png", "itest_generator_front.png"},
	paramtype2 = "facedir",
	groups = {energy=1, cracky=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	voltbuild = {max_energy=4000,max_tier=1,max_stress=2000,energy_produce=10},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_int("energy",0)
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		meta:set_string("formspec", generators.get_formspec(pos)..
				fuel_spec..
				"image["..voltbuild.image_location.."default_furnace_fire_bg.png]")
		generators.on_construct(pos)
	end,
	can_dig = voltbuild.can_dig,
	allow_metadata_inventory_put = voltbuild.allow_metadata_inventory_put,
	allow_metadata_inventory_move = voltbuild.allow_metadata_inventory_move,
})

minetest.register_node("voltbuild:generator_active", {
	description = "Generator",
	tiles = {"itest_generator_side.png", "itest_generator_side.png", "itest_generator_side.png",
		"itest_generator_side.png", "itest_generator_side.png", "itest_generator_front_active.png"},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "voltbuild:generator",
	groups = {energy=1, cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	voltbuild = {max_energy=4000,max_tier=1,energy_produce=10,max_stress=2000},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_int("energy",0)
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		meta:set_string("formspec", generators.get_formspec(pos)..
				fuel_spec..
				"image["..voltbuild.image_location.."default_furnace_fire_bg.png]")
		generators.on_construct(pos)
	end,
	can_dig = voltbuild.can_dig,
	allow_metadata_inventory_put = voltbuild.allow_metadata_inventory_put,
	allow_metadata_inventory_move = voltbuild.allow_metadata_inventory_move,
})

components.register_abm({
	nodenames = {"voltbuild:generator","voltbuild:generator_active"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local energy_produce = minetest.registered_nodes[node.name]["voltbuild"]["energy_produce"]

		if meta:get_string("stime") == "" then
			meta:set_float("stime", 0.0)
		end
		
		if meta:get_string("fburntime") == "" then
			meta:set_float("fburntime", 0.0)
		end
		
		local state=true
		local fuel = nil
		local afterfuel
		local fuellist = inv:get_list("fuel")
		
		if fuellist then
			fuel, afterfuel = minetest.get_craft_result(
				{method = "fuel", width = 1, items = fuellist})
		end
		
		if meta:get_float("stime") < meta:get_float("fburntime") then
			meta:set_float("stime", meta:get_float("stime") + 1)
			generators.produce(pos,energy_produce)
			local percent = meta:get_float("stime")/meta:get_float("fburntime")*100
			meta:set_string("formspec", generators.get_formspec(pos)..
				"image["..voltbuild.image_location.."default_furnace_fire_bg.png^[lowpart:"..
						(100-percent)..":default_furnace_fire_fg.png]"..
				fuel_spec)
		else
			local energy = meta:get_int("energy")
			local use = math.min(energy,energy_produce)
			meta:set_int("energy",energy-use)
			generators.produce(pos,use)
			if fuellist then
				fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})
			end
	
			while meta:get_float("stime") >= meta:get_float("fburntime") do
				meta:set_float("stime", meta:get_float("stime")-meta:get_float("fburntime"))
				meta:set_float("fburntime", fuel.time)
				inv:set_stack("fuel", 1, afterfuel.items[1])
				fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = afterfuel.items})
				if (not fuel) or fuel.time <= 0 then
					state = false
					break
				end
			end
			meta:set_string("formspec", generators.get_formspec(pos)..
					"image["..voltbuild.image_location.."default_furnace_fire_bg.png]"..
					fuel_spec)
		end
		

		if state then
			voltbuild_hacky_swap_node(pos,"voltbuild:generator_active")
		else
			voltbuild_hacky_swap_node(pos,"voltbuild:generator")
		end
	end,
})
