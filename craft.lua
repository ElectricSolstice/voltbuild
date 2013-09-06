local function reverse_recipe(r)
	return {{r[1][1],r[2][1],r[3][1]},{r[1][2],r[2][2],r[3][2]},{r[1][3],r[2][3],r[3][3]}}
end

local function register_craft2(t)
	minetest.register_craft(t)
	t.recipe = reverse_recipe(t.recipe)
	minetest.register_craft(t)
end

minetest.register_craftitem( "voltbuild:refined_iron_ingot", {
	description = "Refined iron ingot",
	inventory_image = "itest_refined_iron_ingot.png",
})

minetest.register_craftitem( "voltbuild:iron_dust", {
	description = "Iron dust",
	inventory_image = "itest_iron_dust.png",
})

minetest.register_craftitem( "voltbuild:coal_dust", {
	description = "Coal dust",
	inventory_image = "itest_coal_dust.png",
})

minetest.register_craftitem( "voltbuild:gold_dust", {
	description = "Gold dust",
	inventory_image = "itest_gold_dust.png",
})

minetest.register_craftitem( "voltbuild:bronze_dust", {
	description = "Bronze dust",
	inventory_image = "itest_bronze_dust.png",
})

minetest.register_craftitem( "voltbuild:tin_dust", {
	description = "Tin dust",
	inventory_image = "itest_tin_dust.png",
})

minetest.register_craftitem( "voltbuild:copper_dust", {
	description = "Copper dust",
	inventory_image = "itest_copper_dust.png",
})

minetest.register_node("voltbuild:machine",{description="Machine",
	groups={cracky=2},
	tiles={"itest_machine.png"},
})

minetest.register_node("voltbuild:advanced_machine",{description="Advanced machine",
	groups={cracky=2},
	tiles={"itest_advanced_machine.png"},
})

minetest.register_craftitem( "voltbuild:rubber", {
	description = "Rubber",
	inventory_image = "itest_rubber.png",
})

minetest.register_craftitem( "voltbuild:circuit", {
	description = "Electronic circuit",
	inventory_image = "itest_circuit.png",
})

minetest.register_craftitem( "voltbuild:advanced_circuit", {
	description = "Advanced circuit",
	inventory_image = "itest_advanced_circuit.png",
})

minetest.register_craftitem( "voltbuild:scrap", {
	description = "Scrap",
	inventory_image = "itest_scrap.png",
})

minetest.register_craftitem( "voltbuild:silicon_mesecon", {
	description = "Silicon-doped mesecon",
	inventory_image = "itest_silicon_mesecon.png",
})

minetest.register_node("voltbuild:silicon_mese_block",{description="Silicon-doped mese block",
	groups={cracky=2},
	tiles={"itest_silicon_mese_block.png"},
})

minetest.register_craftitem( "voltbuild:mixed_metal_ingot", {
	description = "Mixed metal ingot",
	inventory_image = "itest_mixed_metal_ingot.png",
})

minetest.register_craftitem( "voltbuild:advanced_alloy", {
	description = "Advanced alloy",
	inventory_image = "itest_advanced_alloy.png",
})

minetest.register_craftitem( "voltbuild:carbon_fibers", {
	description = "Carbon fibers",
	inventory_image = "itest_carbon_fibers.png",
})

minetest.register_craftitem( "voltbuild:combined_carbon_fibers", {
	description = "Combined carbon fibers",
	inventory_image = "itest_combined_carbon_fibers.png",
})

minetest.register_craftitem( "voltbuild:carbon_plate", {
	description = "Carbon plate",
	inventory_image = "itest_carbon_plate.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:silicon_mesecon",
	recipe = {"mesecons:mesecon","mesecons_resources:silicon","voltbuild:copper_dust"}
})

minetest.register_craft({
	output = "voltbuild:silicon_mesecon 9",
	recipe = {{"voltbuild:silicon_mese_block"}}
})

minetest.register_craft({
	output = "voltbuild:silicon_mese_block",
	recipe = 	{{"voltbuild:silicon_mesecon","voltbuild:silicon_mesecon","voltbuild:silicon_mesecon"},
	{"voltbuild:silicon_mesecon","voltbuild:silicon_mesecon","voltbuild:silicon_mesecon"},
	{"voltbuild:silicon_mesecon","voltbuild:silicon_mesecon","voltbuild:silicon_mesecon"}}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:bronze_dust 2",
	recipe = {"voltbuild:copper_dust","voltbuild:copper_dust",
		"voltbuild:copper_dust","voltbuild:tin_dust"}
})

minetest.register_craft({
	output = "voltbuild:treetap",
	recipe = {{"","default:wood",""},
		{"default:wood","default:wood","default:wood"},
		{"","","default:wood"}}
})

minetest.register_craft({
	output = "default:wood 3",
	recipe = {{"voltbuild:rubber_tree"}}
})

minetest.register_craft({
	output = "voltbuild:copper_cable0_000000 6",
	recipe = {{"default:copper_ingot","default:copper_ingot","default:copper_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:copper_cable1_000000 6",
	recipe = {{"voltbuild:rubber","voltbuild:rubber","voltbuild:rubber"},
		{"default:copper_ingot","default:copper_ingot","default:copper_ingot"},
		{"voltbuild:rubber","voltbuild:rubber","voltbuild:rubber"}}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:copper_cable1_000000",
	recipe = {"voltbuild:copper_cable0_000000","voltbuild:rubber"}
})

minetest.register_craft({
	output = "voltbuild:gold_cable0_000000 12",
	recipe = {{"default:gold_ingot","default:gold_ingot","default:gold_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:gold_cable1_000000 4",
	recipe = {{"","voltbuild:rubber",""},
		{"voltbuild:rubber","default:gold_ingot","voltbuild:rubber"},
		{"","voltbuild:rubber",""}}
})

minetest.register_craft({
	output = "voltbuild:gold_cable2_000000 4",
	recipe = {{"voltbuild:rubber","voltbuild:rubber","voltbuild:rubber"},
		{"voltbuild:rubber","default:gold_ingot","voltbuild:rubber"},
		{"voltbuild:rubber","voltbuild:rubber","voltbuild:rubber"}}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:gold_cable1_000000",
	recipe = {"voltbuild:gold_cable0_000000","voltbuild:rubber"}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:gold_cable2_000000",
	recipe = {"voltbuild:gold_cable1_000000","voltbuild:rubber"}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:gold_cable2_000000",
	recipe = {"voltbuild:gold_cable0_000000","voltbuild:rubber","voltbuild:rubber"}
})

minetest.register_craft({
	output = "voltbuild:tin_cable0_000000 9",
	recipe = {{"voltbuild:tin_ingot","voltbuild:tin_ingot","voltbuild:tin_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:hv_cable0_000000 12",
	recipe = {{"voltbuild:refined_iron_ingot","voltbuild:refined_iron_ingot","voltbuild:refined_iron_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:hv_cable1_000000 4",
	recipe = {{"","voltbuild:rubber",""},
		{"voltbuild:rubber","voltbuild:refined_iron_ingot","voltbuild:rubber"},
		{"","voltbuild:rubber",""}}
})

minetest.register_craft({
	output = "voltbuild:hv_cable2_000000 4",
	recipe = {{"voltbuild:rubber","voltbuild:rubber","voltbuild:rubber"},
		{"voltbuild:rubber","voltbuild:refined_iron_ingot","voltbuild:rubber"},
		{"voltbuild:rubber","voltbuild:rubber","voltbuild:rubber"}}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:hv_cable1_000000",
	recipe = {"voltbuild:hv_cable0_000000","voltbuild:rubber"}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:hv_cable2_000000",
	recipe = {"voltbuild:hv_cable1_000000","voltbuild:rubber"}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:hv_cable3_000000",
	recipe = {"voltbuild:hv_cable2_000000","voltbuild:rubber"}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:hv_cable2_000000",
	recipe = {"voltbuild:hv_cable0_000000","voltbuild:rubber","voltbuild:rubber"}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:hv_cable3_000000",
	recipe = {"voltbuild:hv_cable1_000000","voltbuild:rubber","voltbuild:rubber"}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:hv_cable3_000000",
	recipe = {"voltbuild:hv_cable0_000000","voltbuild:rubber","voltbuild:rubber","voltbuild:rubber"}
})

register_craft2({
	output = "voltbuild:glass_fiber_cable_000000 4",
	recipe = {{"default:glass","default:glass","default:glass"},
		{"mesecons:wire_00000000_off","default:diamond","mesecons:wire_00000000_off"},
		{"default:glass","default:glass","default:glass"}}
})

minetest.register_craft({
	output = "voltbuild:detector_cable_off_000000",
	recipe = {{"","voltbuild:circuit",""},
		{"mesecon:mesecon","voltbuild:hv_cable3_000000","mesecons:wire_00000000_off"},
		{"","mesecons:wire_00000000_off",""}}
})

minetest.register_craft({
	output = "voltbuild:splitter_cable_000000",
	recipe = {{"","mesecons:wire_00000000_off",""},
		{"voltbuild:hv_cable3_000000","mesecons_walllever:wall_lever_off","voltbuild:hv_cable3_000000"},
		{"","mesecons:wire_00000000_off",""}}
})

minetest.register_craft({
	output = "voltbuild:re_battery",
	recipe = {{"","voltbuild:copper_cable1_000000",""},
		{"voltbuild:tin_ingot","mesecons:wire_00000000_off","voltbuild:tin_ingot"},
		{"voltbuild:tin_ingot","mesecons:wire_00000000_off","voltbuild:tin_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:energy_crystal",
	recipe = {{"mesecons:wire_00000000_off","mesecons:wire_00000000_off","mesecons:wire_00000000_off"},
		{"mesecons:wire_00000000_off","default:diamond","mesecons:wire_00000000_off"},
		{"mesecons:wire_00000000_off","mesecons:wire_00000000_off","mesecons:wire_00000000_off"}}
})

minetest.register_craft({
	output = "voltbuild:lapotron_crystal",
	recipe = {{"voltbuild:silicon_mesecon","voltbuild:circuit","voltbuild:silicon_mesecon"},
		{"voltbuild:silicon_mesecon","voltbuild:energy_crystal","voltbuild:silicon_mesecon"},
		{"voltbuild:silicon_mesecon","voltbuild:circuit","voltbuild:silicon_mesecon"}}
})

minetest.register_craft({
	output = "voltbuild:batbox",
	recipe = {{"default:wood","voltbuild:copper_cable1_000000","default:wood"},
		{"voltbuild:re_battery","voltbuild:re_battery","voltbuild:re_battery"},
		{"default:wood","default:wood","default:wood"}}
})

minetest.register_craft({
	output = "voltbuild:mfe_unit",
	recipe = {{"voltbuild:gold_cable2_000000","voltbuild:energy_crystal","voltbuild:gold_cable2_000000"},
		{"voltbuild:energy_crystal","voltbuild:machine","voltbuild:energy_crystal"},
		{"voltbuild:gold_cable2_000000","voltbuild:energy_crystal","voltbuild:gold_cable2_000000"}}
})

minetest.register_craft({
	output = "voltbuild:mfs_unit",
	recipe = {{"voltbuild:lapotron_crystal","voltbuild:advanced_circuit","voltbuild:lapotron_crystal"},
		{"voltbuild:lapotron_crystal","voltbuild:mfe_unit","voltbuild:lapotron_crystal"},
		{"voltbuild:lapotron_crystal","voltbuild:advanced_machine","voltbuild:lapotron_crystal"}}
})

minetest.register_craft({
	output = "voltbuild:iron_furnace",
	recipe = {{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
		{"default:steel_ingot","","default:steel_ingot"},
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:iron_furnace",
	recipe = {{"","default:steel_ingot",""},
		{"default:steel_ingot","","default:steel_ingot"},
		{"default:steel_ingot","default:furnace","default:steel_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:machine",
	recipe = {{"voltbuild:refined_iron_ingot","voltbuild:refined_iron_ingot","voltbuild:refined_iron_ingot"},
		{"voltbuild:refined_iron_ingot","","voltbuild:refined_iron_ingot"},
		{"voltbuild:refined_iron_ingot","voltbuild:refined_iron_ingot","voltbuild:refined_iron_ingot"}}
})

register_craft2({
	output = "voltbuild:advanced_machine",
	recipe = {{"","voltbuild:advanced_alloy",""},
		{"voltbuild:carbon_plate","voltbuild:machine","voltbuild:carbon_plate"},
		{"","voltbuild:advanced_alloy",""}}
})

minetest.register_craft({
	output = "voltbuild:mixed_metal_ingot 2",
	recipe = {{"voltbuild:refined_iron_ingot","voltbuild:refined_iron_ingot","voltbuild:refined_iron_ingot"},
		{"default:bronze_ingot","default:bronze_ingot","default:bronze_ingot"},
		{"voltbuild:tin_ingot","voltbuild:tin_ingot","voltbuild:tin_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:carbon_fibers",
	recipe = {{"voltbuild:coal_dust","voltbuild:coal_dust"},
		{"voltbuild:coal_dust","voltbuild:coal_dust"}}
})

minetest.register_craft({
	type = "shapeless",
	output = "voltbuild:combined_carbon_fibers",
	recipe = {"voltbuild:carbon_fibers","voltbuild:carbon_fibers"}
})

minetest.register_craft({
	output = "voltbuild:generator",
	recipe = {{"","voltbuild:re_battery",""},
		{"voltbuild:refined_iron_ingot","voltbuild:refined_iron_ingot","voltbuild:refined_iron_ingot"},
		{"","voltbuild:iron_furnace",""}}
})

minetest.register_craft({
	output = "voltbuild:generator",
	recipe = {{"voltbuild:re_battery"},
		{"voltbuild:machine"},
		{"default:furnace"}}
})

register_craft2({
	output = "voltbuild:circuit",
	recipe = {{"voltbuild:copper_cable1_000000","voltbuild:copper_cable1_000000","voltbuild:copper_cable1_000000"},
		{"mesecons:wire_00000000_off","voltbuild:refined_iron_ingot","mesecons:wire_00000000_off"},
		{"voltbuild:copper_cable1_000000","voltbuild:copper_cable1_000000","voltbuild:copper_cable1_000000"}}
})

register_craft2({
	output = "voltbuild:advanced_circuit",
	recipe = {{"mesecons:wire_00000000_off","voltbuild:gold_dust","mesecons:wire_00000000_off"},
		{"voltbuild:silicon_mesecon","voltbuild:circuit","voltbuild:silicon_mesecon"},
		{"mesecons:wire_00000000_off","voltbuild:gold_dust","mesecons:wire_00000000_off"}}
})

minetest.register_craft({
	output = "voltbuild:lv_transformer",
	recipe = {{"default:wood","voltbuild:copper_cable1_000000","default:wood"},
		{"default:copper_ingot","default:copper_ingot","default:copper_ingot"},
		{"default:wood","voltbuild:copper_cable1_000000","default:wood"}}
})

minetest.register_craft({
	output = "voltbuild:mv_transformer",
	recipe = {{"voltbuild:gold_cable2_000000"},
		{"voltbuild:machine"},
		{"voltbuild:gold_cable2_000000"}}
})

minetest.register_craft({
	output = "voltbuild:hv_transformer",
	recipe = {{"","voltbuild:hv_cable3_000000",""},
		{"voltbuild:circuit","voltbuild:mv_transformer","voltbuild:energy_crystal"},
		{"","voltbuild:hv_cable3_000000",""}}
})

minetest.register_craft({
	output = "voltbuild:electric_furnace",
	recipe = {{"","voltbuild:circuit",""},
		{"mesecons:wire_00000000_off","voltbuild:iron_furnace","mesecons:wire_00000000_off"}}
})

minetest.register_craft({
	output = "voltbuild:extractor",
	recipe = {{"voltbuild:treetap","voltbuild:machine","voltbuild:treetap"},
		{"voltbuild:treetap","voltbuild:circuit","voltbuild:treetap"}}
})

minetest.register_craft({
	output = "voltbuild:macerator",
	recipe = {{"default:desert_stone","default:desert_stone","default:desert_stone"},
		{"default:cobble","voltbuild:machine","default:cobble"},
		{"","voltbuild:circuit",""}}
})

minetest.register_craft({
	output = "voltbuild:compressor",
	recipe = {{"default:stone","","default:stone"},
		{"default:stone","voltbuild:machine","default:stone"},
		{"default:stone","voltbuild:circuit","default:stone"}}
})

minetest.register_craft({
	output = "voltbuild:recycler",
	recipe = {{"","voltbuild:gold_dust",""},
		{"default:dirt","voltbuild:compressor","default:dirt"},
		{"voltbuild:refined_iron_ingot","default:dirt","voltbuild:refined_iron_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:mining_pipe 8",
	recipe = {{"voltbuild:refined_iron_ingot","","voltbuild:refined_iron_ingot"},
		{"voltbuild:refined_iron_ingot","","voltbuild:refined_iron_ingot"},
		{"voltbuild:refined_iron_ingot","voltbuild:treetap","voltbuild:refined_iron_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:miner",
	recipe = {{"voltbuild:circuit","voltbuild:machine","voltbuild:circuit"},
		{"","voltbuild:mining_pipe",""},
		{"","voltbuild:mining_pipe",""}}
})

minetest.register_craft({
	output = "voltbuild:solar_panel",
	recipe = {{"voltbuild:coal_dust","default:glass","voltbuild:coal_dust"},
		{"default:glass","voltbuild:coal_dust","default:glass"},
		{"voltbuild:circuit","voltbuild:generator","voltbuild:circuit"}}
})

minetest.register_craft({
	output = "voltbuild:watermill 2",
	recipe = {{"default:stick","default:wood","default:stick"},
		{"default:wood","voltbuild:generator","default:wood"},
		{"default:stick","default:wood","default:stick"}}
})

minetest.register_craft({
	output = "voltbuild:windmill",
	recipe = {{"default:steel_ingot","","default:steel_ingot"},
		{"","voltbuild:generator",""},
		{"default:steel_ingot","","default:steel_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:mining_drill_discharged",
	recipe = {{"","voltbuild:refined_iron_ingot",""},
		{"voltbuild:refined_iron_ingot","voltbuild:circuit","voltbuild:refined_iron_ingot"},
		{"voltbuild:refined_iron_ingot","voltbuild:re_battery","voltbuild:refined_iron_ingot"}}
})

minetest.register_craft({
	output = "voltbuild:diamond_drill_discharged",
	recipe = {{"","default:diamond",""},
		{"default:diamond","voltbuild:mining_drill","default:diamond"}}
})

minetest.register_craft({
	output = "voltbuild:diamond_drill_discharged",
	recipe = {{"","default:diamond",""},
		{"default:diamond","voltbuild:mining_drill_discharged","default:diamond"}}
})

minetest.register_craft({
	output = "voltbuild:od_scanner",
	recipe = {{"","voltbuild:gold_dust",""},
		{"voltbuild:circuit","voltbuild:re_battery","voltbuild:circuit"},
		{"voltbuild:copper_cable1_000000","voltbuild:copper_cable1_000000","voltbuild:copper_cable1_000000"}}
})

minetest.register_craft({
	output = "voltbuild:ov_scanner",
	recipe = {{"","voltbuild:gold_dust",""},
		{"voltbuild:gold_dust","voltbuild:advanced_circuit","voltbuild:gold_dust"},
		{"voltbuild:gold_cable2_000000","voltbuild:re_battery","voltbuild:gold_cable2_000000"}}
})

minetest.register_craft({
	output = "voltbuild:ov_scanner",
	recipe = {{"","voltbuild:gold_dust",""},
		{"voltbuild:gold_dust","voltbuild:advanced_circuit","voltbuild:gold_dust"},
		{"voltbuild:gold_cable2_000000","voltbuild:od_scanner","voltbuild:gold_cable2_000000"}}
})

minetest.register_craft({
	output = "voltbuild:refined_iron_ingot 8",
	recipe = {{"voltbuild:machine"}}
})

minetest.register_craft({
	type = "cooking",
	output = "voltbuild:rubber",
	recipe = "voltbuild:sticky_resin"
})

minetest.register_craft({
	type = "cooking",
	output = "voltbuild:refined_iron_ingot",
	recipe = "default:steel_ingot"
})

minetest.register_craft({
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "voltbuild:iron_dust"
})

minetest.register_craft({
	type = "cooking",
	output = "default:copper_ingot",
	recipe = "voltbuild:copper_dust"
})

minetest.register_craft({
	type = "cooking",
	output = "default:bronze_ingot",
	recipe = "voltbuild:bronze_dust"
})

minetest.register_craft({
	type = "cooking",
	output = "voltbuild:tin_ingot",
	recipe = "voltbuild:tin_dust"
})

minetest.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "voltbuild:gold_dust"
})

macerator.register_macerator_recipe("default:iron_lump","voltbuild:iron_dust 2")
macerator.register_macerator_recipe("default:gold_lump","voltbuild:gold_dust 2")
macerator.register_macerator_recipe("default:coal_lump","voltbuild:coal_dust")
macerator.register_macerator_recipe("default:copper_lump","voltbuild:copper_dust 2")
macerator.register_macerator_recipe("voltbuild:tin_lump","voltbuild:tin_dust 2")
macerator.register_macerator_recipe("voltbuild:tin_ingot","voltbuild:tin_dust")
macerator.register_macerator_recipe("default:steel_ingot","voltbuild:iron_dust")
macerator.register_macerator_recipe("voltbuild:refined_iron_ingot","voltbuild:iron_dust")
macerator.register_macerator_recipe("default:gold_ingot","voltbuild:gold_dust")
macerator.register_macerator_recipe("default:copper_ingot","voltbuild:copper_dust")
macerator.register_macerator_recipe("default:bronze_ingot","voltbuild:bronze_dust")

macerator.register_macerator_recipe("moreores:bronze_ingot","voltbuild:bronze_dust")
macerator.register_macerator_recipe("moreores:copper_ingot","voltbuild:copper_dust")
macerator.register_macerator_recipe("moreores:tin_ingot","voltbuild:tin_dust")
macerator.register_macerator_recipe("moreores:tin_lump","voltbuild:tin_dust 2")
macerator.register_macerator_recipe("moreores:gold_ingot","voltbuild:gold_dust")
macerator.register_macerator_recipe("moreores:gold_lump","voltbuild:gold_dust 2")
macerator.register_macerator_recipe("moreores:copper_lump","voltbuild:copper_dust 2")

extractor.register_extractor_recipe("voltbuild:sticky_resin","voltbuild:rubber 3")
extractor.register_extractor_recipe("voltbuild:rubber_tree","voltbuild:rubber")
extractor.register_extractor_recipe("voltbuild:rubber_sapling","voltbuild:rubber")
extractor.register_extractor_recipe("default:mese_crystal","mesecons:wire_00000000_off 32")
extractor.register_extractor_recipe("default:sand","mesecons_resources:silicon")

compressor.register_compressor_recipe("voltbuild:mixed_metal_ingot","voltbuild:advanced_alloy")
compressor.register_compressor_recipe("voltbuild:combined_carbon_fibers","voltbuild:carbon_plate")

