minetest.register_node("voltbuild:electric_furnace", {
	description = "Electric furnace",
	tiles = {"itest_electric_furnace_side.png", "itest_electric_furnace_side.png", "itest_electric_furnace_side.png", "itest_electric_furnace_side.png", "itest_electric_furnace_side.png", "itest_electric_furnace_front.png"},
	paramtype2 = "facedir",
	groups = {energy=1, energy_consumer=1, cracky=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	voltbuild = {max_tier=1,energy_cost=2,max_stress=2000},
	tube={insert_object=function(pos,node,stack,direction)
			local meta=minetest.env:get_meta(pos)
			local inv=meta:get_inventory()
			return inv:add_item("src",stack)
		end,
		can_insert=function(pos,node,stack,direction)
			local meta=minetest.env:get_meta(pos)
			local inv=meta:get_inventory()
			return inv:room_for_item("src",stack)

		end,
		input_inventory="dst"},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_int("energy",0)
		meta:set_int("max_energy",416)
		meta:set_int("max_psize",32)
		local inv = meta:get_inventory()
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
		meta:set_string("formspec", consumers.get_formspec(pos)..
				voltbuild.production_spec)
		consumers.on_construct(pos)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("src") and inv:is_empty("dst") and
			consumers.can_dig(pos,player)
	end,
	allow_metadata_inventory_put = voltbuild.allow_metadata_inventory_put,
	allow_metadata_inventory_move = voltbuild.allow_metadata_inventory_move,
})

minetest.register_node("voltbuild:electric_furnace_active", {
	description = "Electric furnace",
	tiles = {"itest_electric_furnace_side.png", "itest_electric_furnace_side.png", "itest_electric_furnace_side.png", "itest_electric_furnace_side.png", "itest_electric_furnace_side.png", "itest_electric_furnace_front_active.png"},
	paramtype2 = "facedir",
	drop = "voltbuild:generator",
	groups = {energy=1, energy_consumer=1, cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	voltbuild = {max_tier=1,energy_cost=2,max_stress=2000},
	tube={insert_object=function(pos,node,stack,direction)
			local meta=minetest.env:get_meta(pos)
			local inv=meta:get_inventory()
			return inv:add_item("src",stack)
		end,
		can_insert=function(pos,node,stack,direction)
			local meta=minetest.env:get_meta(pos)
			local inv=meta:get_inventory()
			return inv:room_for_item("src",stack)

		end,
		input_inventory="dst"},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_int("energy",0)
		meta:set_int("max_energy",416)
		meta:set_int("max_psize",32)
		local inv = meta:get_inventory()
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
		meta:set_string("formspec", consumers.get_formspec(pos)..
				voltbuild.production_spec)
		consumers.on_construct(pos)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("src") and inv:is_empty("dst") and
			consumers.can_dig(pos,player)
	end,
	allow_metadata_inventory_put = voltbuild.allow_metadata_inventory_put,
	allow_metadata_inventory_move = voltbuild.allow_metadata_inventory_move,
})

components.register_abm({
	nodenames = {"voltbuild:electric_furnace","voltbuild:electric_furnace_active"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		
		local speed = 0.65
		
		if meta:get_string("stime") == "" then
			meta:set_float("stime", 0.0)
		end
		
		local state = false
		
		for i = 1,20 do
			local srclist = inv:get_list("src")
			local cooked = nil
			local aftercooked
		
			if srclist then
				cooked, aftercooked = minetest.get_craft_result({method = "cooking",
					width = 1, items = srclist})
			end
			
			if cooked.item:is_empty() then
				state = false
				break
			end
		
			local energy = meta:get_int("energy")
			if energy >= 3 then
				if cooked and cooked.item then
					state = true
					meta:set_int("energy",energy-3)
					meta:set_float("stime", meta:get_float("stime") + 1)
					if meta:get_float("stime")>=20*speed*cooked.time then
						meta:set_float("stime",0)
						if inv:room_for_item("dst",cooked.item) then
							inv:add_item("dst", cooked.item)
							inv:set_stack("src", 1, aftercooked.items[1])
						else
							meta:set_int("energy",energy) -- Don't waste energy
							meta:set_float("stime",20*speed*cooked.time)
							state = false
						end
					end
				else
					state = false
				end
			end
			consumers.discharge(pos)
		end
		if inv:is_empty("src") then state = false end
		if state then
			hacky_swap_node(pos,"voltbuild:electric_furnace_active")
		else
			hacky_swap_node(pos,"voltbuild:electric_furnace")
		end
		meta:set_string("formspec", consumers.get_formspec(pos)..
				voltbuild.production_spec)
		end
})
