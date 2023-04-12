crates = {
	[GetHashKey('prop_mil_crate_01')] = {
		name = 'Storage Chest',
		hash = 'prop_mil_crate_01',
		offset = 0.0,
		health = 1000,
		capacity = 2000,
		renderDist = 100,
		onGround = false,
		crateType = 'storage',
		requirements = {
			{item = 'nails', amount = 10},
			{item = 'scrap_metal', amount = 20},
		}
	},
	[GetHashKey('xm_prop_rsply_crate04b')] = {
		name = 'Storage Crate Big Locked',
		hash = 'xm_prop_rsply_crate04b',
		offset = 0.0,
		health = 5000,
		capacity = 10000,
		renderDist = 100,
		onGround = false,
		crateType = 'storage_locked',
		requirements = {
			{item = 'nails', amount = 20},
			{item = 'scrap_metal', amount = 100},
		}
	},
	[GetHashKey('xm_prop_rsply_crate04a')] = {
		name = 'Storage Crate Small Locked',
		hash = 'xm_prop_rsply_crate04a',
		offset = 0.0,
		health = 2500,
		capacity = 5000,
		renderDist = 100,
		onGround = false,
		crateType = 'storage_locked',
		requirements = {
			{item = 'nails', amount = 10},
			{item = 'scrap_metal', amount = 50},
		}
	},
}

doors = {
	{
		name = 'Barn Door',
		hash = 'prop_barn_door_l',
		offset = 2.0,
		health = 2500,
		renderDist = 250,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 25},
			{item = 'scrap_metal', amount = 5},
			{item = 'wood_plank', amount = 50},
		}
	},
	{
		name = 'Metal Farm Gate',
		hash = 'prop_gate_farm_03',
		offset = 0.0,
		health = 5000,
		renderDist = 250,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 15},
			{item = 'scrap_metal', amount = 40},
			{item = 'wood_plank', amount = 5},
		}
	},
	{
		name = 'Wooden Door 1',
		hash = 'hei_prop_hei_shack_door',
		offset = 1.0,
		health = 2500,
		renderDist = 250,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 25},
			{item = 'scrap_metal', amount = 5},
			{item = 'wood_plank', amount = 50},
		}
	},
	{
		name = 'Wooden Gate',
		hash = 'prop_gate_cult_01_l',
		offset = 1.75,
		health = 7500,
		renderDist = 250,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 40},
			{item = 'scrap_metal', amount = 15},
			{item = 'wood_plank', amount = 75},
		}
	},
}

structures = {
	{
		name = 'Advanced Lookout Tower',
		hash = 'zsr_tower_02',
		offset = 7.5,
		health = 5000,
		renderDist = 500,
		onGround = true,
		requirements = {
			{item = 'nails', amount = 100},
			{item = 'wood_plank', amount = 200},
		}
	},
	{
		name = 'Beer Crate',
		hash = 'ba_prop_battle_crate_beer_03',
		offset = 0.0,
		health = 2500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'beer', amount = 20},
			{item = 'nails', amount = 20},
			{item = 'scrap_metal', amount = 30},
			{item = 'wood_plank', amount = 40},
		}
	},
	{
		name = 'Bulletin Board',
		hash = 'vw_prop_vw_board_01a',
		offset = 0.0,
		health = 500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 10},
			{item = 'wood_plank', amount = 20},
		}
	},
	{
		name = 'Campfire',
		hash = 'prop_beach_fire',
		offset = 0.0,
		health = 500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'wood_logs', amount = 3},
		}
	},
	{
		name = 'Clothing Box',
		hash = 'ex_prop_crate_clothing_sc',
		offset = 0.0,
		health = 2500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 20},
			{item = 'scrap_cloth', amount = 30},
			{item = 'wood_plank', amount = 40},
		}
	},
	{
		name = 'Couch 2 Seat',
		hash = 'prop_couch_sm_06',
		offset = 0.0,
		health = 5000,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 20},
			{item = 'scrap_cloth', amount = 100},
			{item = 'wood_plank', amount = 20},
		}
	},
	{
		name = 'Couch 3 Seat',
		hash = 'prop_couch_lg_06',
		offset = 0.0,
		health = 5000,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 30},
			{item = 'scrap_cloth', amount = 150},
			{item = 'wood_plank', amount = 30},
		}
	},
	{
		name = 'Couch Basic',
		hash = 'v_res_tt_sofa',
		offset = 0.6,
		health = 3000,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 20},
			{item = 'scrap_cloth', amount = 50},
			{item = 'wood_plank', amount = 20},
		}
	},
	{
		name = 'Empty Weapon Crate',
		hash = 'ch_prop_ch_crate_empty_01a',
		offset = 0.0,
		health = 2500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 20},
			{item = 'scrap_metal', amount = 30},
			{item = 'wood_plank', amount = 10},
		}
	},
	{
		name = 'Log Cabin',
		hash = 'cabin_log_01',
		offset = 4.0,
		health = 25000,
		renderDist = 500,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 50},
			{item = 'wood_logs', amount = 400},
			{item = 'wood_plank', amount = 50},
		}
	},
	{
		name = 'Log Wall',
		hash = 'misc_logwall3',
		offset = 5.0,
		health = 5000,
		renderDist = 500,
		onGround = true,
		requirements = {
			{item = 'nails', amount = 20},
			{item = 'wood_logs', amount = 50},
			{item = 'wood_plank', amount = 10},
		}
	},
	{
		name = 'Mattress',
		hash = 'prop_rub_matress_03',
		offset = 0.0,
		health = 750,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'scrap_cloth', amount = 25},
		}
	},
	{
		name = 'Makeshift Lookout Tower',
		hash = 'zsr_tower_01',
		offset = 0.0,
		health = 2500,
		renderDist = 500,
		onGround = true,
		requirements = {
			{item = 'nails', amount = 50},
			{item = 'wood_plank', amount = 100},
		}
	},
	{
		name = 'Medical Crate',
		hash = 'ba_prop_battle_crate_med_bc',
		offset = 0.0,
		health = 2500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 16},
			{item = 'scrap_metal', amount = 24},
			{item = 'wood_plank', amount = 10},
		}
	},
	{
		name = 'Metal Wall Small',
		hash = 'xs_prop_arena_wall_01c',
		offset = 0.0,
		health = 10000,
		renderDist = 500,
		onGround = true,
		requirements = {
			{item = 'nails', amount = 100},
			{item = 'scrap_metal', amount = 200},
		}
	},
	{
		name = 'Metal Wall Medium',
		hash = 'xs_prop_arena_wall_01b',
		offset = 0.0,
		health = 10000,
		renderDist = 500,
		onGround = true,
		requirements = {
			{item = 'nails', amount = 150},
			{item = 'scrap_metal', amount = 250},
		}
	},
	{
		name = 'Metal Wall Large',
		hash = 'xs_prop_arena_wall_01a',
		offset = 0.0,
		health = 10000,
		renderDist = 500,
		onGround = true,
		requirements = {
			{item = 'nails', amount = 200},
			{item = 'scrap_metal', amount = 300},
		}
	},
	{
		name = 'Plank Big',
		hash = 'prop_rub_planks_03',
		offset = 0.0,
		health = 500,
		renderDist = 100,
		onGround = true,
		requirements = {
			{item = 'nails', amount = 8},
			{item = 'wood_plank', amount = 8},
		}
	},
	{
		name = 'Plank Long',
		hash = 'prop_rub_planks_01',
		offset = 0.0,
		health = 250,
		renderDist = 100,
		onGround = true,
		requirements = {
			{item = 'nails', amount = 8},
			{item = 'wood_plank', amount = 4},
		}
	},
	{
		name = 'Plank Short',
		hash = 'prop_rub_planks_02',
		offset = 0.0,
		health = 200,
		renderDist = 100,
		onGround = true,
		requirements = {
			{item = 'nails', amount = 8},
			{item = 'wood_plank', amount = 4},
		}
	},
	{
		name = 'Plastic Chair',
		hash = 'bkr_prop_clubhouse_chair_03',
		offset = 0.0,
		health = 500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 10},
			{item = 'plastic', amount = 20},
		}
	},
	{
		name = 'Simple Locker',
		hash = 'bkr_prop_biker_garage_locker_01',
		offset = 0.0,
		health = 3000,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 20},
			{item = 'scrap_metal', amount = 40},
		}
	},
	{
		name = 'Sleeping Cot',
		hash = 'bkr_prop_biker_campbed_01',
		offset = 0.0,
		health = 2500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 20},
			{item = 'scrap_cloth', amount = 30},
			{item = 'wood_plank', amount = 20},
		}
	},
	{
		name = 'Small Army Crate',
		hash = 'ch_prop_crate_stack_01a',
		offset = 0.0,
		health = 2500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 20},
			{item = 'scrap_metal', amount = 10},
			{item = 'wood_plank', amount = 10},
		}
	},
	{
		name = 'Small Box',
		hash = 'sm_prop_smug_crate_m_01a',
		offset = 0.0,
		health = 2500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 20},
			{item = 'scrap_metal', amount = 8},
			{item = 'wood_plank', amount = 30},
		}
	},
	{
		name = 'Still',
		hash = 'prop_still',
		offset = 0.0,
		health = 1000,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 10},
			{item = 'scrap_metal', amount = 10},
			{item = 'wood_plank', amount = 20},
		}
	},
	{
		name = 'Stove',
		hash = 'prop_hobo_stove_01',
		offset = 0.4,
		health = 1000,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'scrap_metal', amount = 20},
			{item = 'wood_logs', amount = 6},
			{item = 'wood_plank', amount = 4},
		}
	},
	{
		name = 'Weapon Stash Crate',
		hash = 'ba_prop_battle_crates_rifles_01a',
		offset = 0.0,
		health = 2500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 30},
			{item = 'scrap_metal', amount = 50},
			{item = 'wood_plank', amount = 20},
		}
	},
	{
		name = 'Wooden Barn',
		hash = 'zsr_barn_01',
		offset = -0.5,
		health = 7500,
		renderDist = 500,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 100},
			{item = 'wood_plank', amount = 250},
		}
	},
	{
		name = 'Wooden Chair',
		hash = 'prop_torture_ch_01',
		offset = 0.0,
		health = 500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 12},
			{item = 'wood_plank', amount = 30},
		}
	},
	{
		name = 'Wooden Wall',
		hash = 'prop_fncwood_16b',
		offset = 0.0,
		health = 1000,
		renderDist = 250,
		onGround = true,
		requirements = {
			{item = 'nails', amount = 10},
			{item = 'wood_plank', amount = 20},
		}
	},
	{
		name = 'Workbench',
		hash = 'prop_tool_bench02',
		offset = 0.0,
		health = 2500,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'nails', amount = 12},
			{item = 'wood_plank', amount = 30},
		}
	},
	{
		name = 'Work Light',
		hash = 'prop_worklight_03b',
		offset = 0.0,
		health = 1000,
		renderDist = 100,
		onGround = false,
		requirements = {
			{item = 'battery', amount = 50},
			{item = 'light_bulb', amount = 2},
			{item = 'scrap_metal', amount = 20},
		}
	},
}