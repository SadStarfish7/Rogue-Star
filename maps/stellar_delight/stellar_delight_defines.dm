/* RS REMOVE
//Normal map defs
#define Z_LEVEL_SHIP_MAINTENANCE			1
#define Z_LEVEL_SHIP_LOW					2
#define Z_LEVEL_SHIP_MID					3
#define Z_LEVEL_SHIP_HIGH					4
#define Z_LEVEL_CENTCOM						5
#define Z_LEVEL_MISC						6
#define Z_LEVEL_SPACE_ROCKS					7
#define Z_LEVEL_BEACH						8
#define Z_LEVEL_BEACH_CAVE					9
#define Z_LEVEL_AEROSTAT					10
#define Z_LEVEL_AEROSTAT_SURFACE			11
#define Z_LEVEL_DEBRISFIELD					12
#define Z_LEVEL_FUELDEPOT					13
#define Z_LEVEL_OVERMAP						14
#define Z_LEVEL_OFFMAP1						15
#define Z_LEVEL_SNOWBASE					16
#define Z_LEVEL_GLACIER						17
#define Z_LEVEL_GATEWAY						18
#define Z_LEVEL_OM_ADVENTURE				19
#define Z_LEVEL_REDGATE						20

//Camera networks
#define NETWORK_HALLS "Halls"
*///RS REMOVE END
/datum/map/stellar_delight/New()
	if(global.using_map != src)	//RS ADD START - Map swap related
		return ..()

	ai_shell_allowed_levels += list(z_list["z_misc"])
	ai_shell_allowed_levels += list(z_list["z_beach"])
	ai_shell_allowed_levels += list(z_list["z_aerostat"])
		//RS ADD END
	..()
	var/choice = pickweight(list(
		"rs_lobby" = 50,
		"rs_lobby2" = 50
	))
	if(choice)
		lobby_screens = list(choice)

/datum/map/stellar_delight
	name = "StellarDelight"
	full_name = "NRV Stellar Delight"
	path = "stellardelight"

	use_overmap = TRUE
	overmap_z = Z_LEVEL_OVERMAP
	overmap_size = 99
	overmap_event_areas = 200
	usable_email_tlds = list("virgo.nt")

	zlevel_datum_type = /datum/map_z_level/stellar_delight

	lobby_icon = 'icons/misc/title_rs.dmi'
	lobby_screens = list("rs_lobby")	//RS EDIT
	id_hud_icons = 'icons/mob/hud_jobs_vr.dmi'


	holomap_smoosh = list(list(
		Z_LEVEL_SHIP_LOW,
		Z_LEVEL_SHIP_MID,
		Z_LEVEL_SHIP_HIGH))

	station_name  = "NRV Stellar Delight"
	station_short = "Stellar Delight"
	facility_type = "ship"
	dock_name     = "Virgo-3B Colony"
	dock_type     = "surface"
	boss_name     = "Central Command"
	boss_short    = "CentCom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	starsys_name  = "Virgo-Erigone"

	shuttle_docked_message = "The scheduled shuttle to the %dock_name% has arrived. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The shuttle has departed. Estimate %ETA% until arrival at %dock_name%."
	shuttle_called_message = "A scheduled crew transfer to the %dock_name% is occuring. The shuttle will arrive shortly. Those departing should proceed to deck three, aft within %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	shuttle_name = "Crew Transport"
	emergency_shuttle_docked_message = "The evacuation shuttle has arrived. You have approximately %ETD% to board the shuttle."
	emergency_shuttle_leaving_dock = "The emergency shuttle has departed. Estimate %ETA% until arrival at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation has begun, and an off-schedule shuttle has been called. It will arrive at deck three, aft in approximately %ETA%."
	emergency_shuttle_recall_message = "The evacuation shuttle has been recalled."

	station_networks = list(
							NETWORK_CARGO,
							NETWORK_CIRCUITS,
							NETWORK_CIVILIAN,
							NETWORK_COMMAND,
							NETWORK_ENGINE,
							NETWORK_ENGINEERING,
							NETWORK_EXPLORATION,
							NETWORK_MEDICAL,
							NETWORK_MINE,
							NETWORK_RESEARCH,
							NETWORK_RESEARCH_OUTPOST,
							NETWORK_ROBOTS,
							NETWORK_SECURITY,
							NETWORK_TELECOM,
							NETWORK_HALLS
							)
	secondary_networks = list(
							NETWORK_ERT,
							NETWORK_MERCENARY,
							NETWORK_THUNDER,
							NETWORK_COMMUNICATORS,
							NETWORK_ALARM_ATMOS,
							NETWORK_ALARM_POWER,
							NETWORK_ALARM_FIRE,
							NETWORK_TALON_HELMETS,
							NETWORK_TALON_SHIP
							)

	bot_patrolling = FALSE

	allowed_spawns = list("Gateway","Cryogenic Storage","Cyborg Storage","ITV Talon Cryo", "Redgate")
	spawnpoint_died = /datum/spawnpoint/cryo
	spawnpoint_left = /datum/spawnpoint/gateway
	spawnpoint_stayed = /datum/spawnpoint/cryo

	/*
	meteor_strike_areas = list(/area/tether/surfacebase/outside/outside3)
	*/

	default_skybox = /datum/skybox_settings/stellar_delight

	unit_test_exempt_areas = list(
		/area/stellardelight/deck0/exterior,
		/area/stellardelight/deck1/exterior,
		/area/stellardelight/deck1/exploshuttle,
		/area/stellardelight/deck1/miningshuttle,
		/area/stellardelight/deck2/exterior,
		/area/stellardelight/deck2/portescape,
		/area/stellardelight/deck2/starboardescape,
		/area/stellardelight/deck3/exterior,

		/area/medical/cryo,
		/area/holodeck_control,
		/area/tcommsat/chamber
		)

	unit_test_exempt_from_atmos = list() //it maint

	unit_test_z_levels = list(
		Z_LEVEL_SHIP_MAINTENANCE,
		Z_LEVEL_SHIP_LOW,
		Z_LEVEL_SHIP_MID,
		Z_LEVEL_SHIP_HIGH
	)

	//RS ADD START - Map swap related
	z_list = list(
	"z_centcom" = 5,
	"z_misc" = 6,
	"z_beach" = 8,
	"z_beach_cave" = 9,
	"z_aerostat" = 10,
	"z_aerostat_surface" = 11,
	"z_debrisfield" = 12,
	"z_fueldepot" = 13,
	"z_offmap1" = 15,
	"z_snowbase" = 16,
	"z_glacier" = 17,
	"z_gateway" = 18,
	"z_om_adventure" = 19,
	"z_redgate" = 20
	)

	station_z_levels = list("SD0","SD1","SD2","SD3")	//RS ADD END

	lateload_z_levels = list(
		list("Ship - Central Command"),
		list("Ship - Misc"), //Shuttle transit zones, holodeck templates, etc
		list("V3b Asteroid Field"),
		list("Desert Planet - Z1 Beach","Desert Planet - Z2 Cave"),
		list("Remmi Science Aerostat - Z1 Aerostat","Remmi Aerostat - Z2 Surface"),	//RS EDIT
		list("Debris Field - Z1 Space"),
		list("Fuel Depot - Z1 Space"),
		list("Overmap"),
		list("Offmap Ship - Talon V2"),
		list("Virgo 5","Virgo 5 Glacier")
		)
	//List associations used in admin load selection feature
	lateload_gateway = list(
		"Carp Farm" = list("Gateway - Carp Farm"),
		"Snow Field" = list("Gateway - Snow Field"),
		"Listening Post" = list("Gateway - Listening Post"),
		"Honleth Highlands" = list(list("Gateway - Honleth Highlands A", "Gateway - Honleth Highlands B")),
		"Arynthi Lake A" = list("Gateway - Arynthi Lake Underground A","Gateway - Arynthi Lake A"),
		"Arynthi Lake B" = list("Gateway - Arynthi Lake Underground B","Gateway - Arynthi Lake B"),
		"Wild West" = list("Gateway - Wild West")
		)

	lateload_overmap = list(
		list("Grass Cave")
		)
	//List associations used in admin load selection feature
	lateload_redgate = list(
		"Teppi Ranch" = list("Redgate - Teppi Ranch"),
		"Innland" = list("Redgate - Innland"),
//		"Abandoned Island" = list("Redgate - Abandoned Island"),	//This will come back later
		"Dark Adventure" = list("Redgate - Dark Adventure"),
		"Eggnog Town" = list("Redgate - Eggnog Town Underground","Redgate - Eggnog Town"),
		"Star Dog" = list("Redgate - Star Dog"),
		"Hotsprings" = list("Redgate - Hotsprings"),
		"Rain City" = list("Redgate - Rain City"),
		"Islands" = list("Redgate - Islands Underwater","Redgate - Islands"),
		"Moving Train" = list("Redgate - Moving Train", "Redgate - Moving Train Upper Level"),
		"Fantasy Town" = list("Redgate - Fantasy Dungeon", "Redgate - Fantasy Town"),
		"Snowglobe" = list("Redgate - Snowglobe"),
		"Pet Island" = list("Redgate - Pet Island"),
		"Pizzaria" = list("Redgate - Pizzaria"),
		)

	ai_shell_restricted = TRUE
	ai_shell_allowed_levels = list(
		Z_LEVEL_SHIP_MAINTENANCE,
		Z_LEVEL_SHIP_LOW,
		Z_LEVEL_SHIP_MID,
		Z_LEVEL_SHIP_HIGH	//RS ADD
		)

/*
	belter_docked_z = 		list(Z_LEVEL_SPACE_LOW)
	belter_transit_z =	 	list(Z_LEVEL_MISC)
	belter_belt_z = 		list(Z_LEVEL_ROGUEMINE_1,
						 		 Z_LEVEL_ROGUEMINE_2)

	mining_station_z =		list(Z_LEVEL_SPACE_LOW)
	mining_outpost_z =		list(Z_LEVEL_SURFACE_MINE)
*/
	planet_datums_to_make = list(/datum/planet/virgo3b,
								/datum/planet/virgo4,
								/datum/planet/snowbase)

/datum/map/stellar_delight/get_map_info()
	. = list()
	. +=  "The [full_name] is a recently commissioned multi-role starship assigned to patrol the Virgo-Erigone system. Its mission is flexible, being a response vessel, the [station_short] is assigned to respond to emergencies in the system, and to investigate anomalous activities where a more specialized vessel is unavailable.<br>"
	. +=  "Humanity has spread across the stars and has met many species on similar or even more advanced terms than them - it's a brave new world and many try to find their place in it . <br>"
	. +=  "Though Virgo-Erigone is not important for the great movers and shakers, it sees itself in the midst of the interests of a reviving alien species of the Zorren, corporate and subversive interests and other exciting dangers the Periphery has to face.<br>"
	. +=  "As an employee or contractor of NanoTrasen, operators of the Adephagia and one of the galaxy's largest corporations, you're probably just here to do a job."
	return jointext(., "<br>")

/*	//RS REMOVE START
/datum/map/stellar_delight/perform_map_generation()

	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_SPACE_ROCKS, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_SPACE_ROCKS, 64, 64)         // Create the mining ore distribution map.
	return 1
*/	//RS REMOVE END

/datum/skybox_settings/stellar_delight
	icon_state = "space5"
	use_stars = FALSE

/obj/effect/landmark/map_data/stellar_delight
	height = 4

/obj/effect/overmap/visitable/ship/stellar_delight
	name = "NRV Stellar Delight"
	icon = 'icons/obj/overmap_vr.dmi'
	icon_state = "stellar_delight_g"
	desc = "Spacefaring vessel. Friendly IFF detected."
	scanner_desc = @{"[i]Registration[/i]: NRV Stellar Delight
[i]Class[/i]: Nanotrasen Response Vessel
[i]Transponder[/i]: Transmitting (CIV), non-hostile"
[b]Notice[/b]: A response vessel registered to Nanotrasen."}
	vessel_mass = 25000
	vessel_size = SHIP_SIZE_LARGE
	initial_generic_waypoints = list("starboard_shuttlepad","port_shuttlepad","sd-1-23-54","sd-1-67-15","sd-1-70-130","sd-1-115-85","sd-2-25-98","sd-2-117-98","sd-3-22-78","sd-3-36-33","sd-3-104-33","sd-3-120-78")
	initial_restricted_waypoints = list("SD Exploration Shuttle" = list("sd_explo"), "Mining Shuttle" = list("sd_mining"))	//RS EDIT
	levels_for_distress = list()	//RS EDIT
	unowned_areas = list(/area/shuttle/sdboat)
	known = TRUE
	start_x = 2
	start_y = 2

	fore_dir = NORTH

	skybox_icon = 'stelardelightskybox.dmi'
	skybox_icon_state = "skybox"
	skybox_pixel_x = 450
	skybox_pixel_y = 200

/obj/effect/overmap/visitable/ship/stellar_delight/New(loc, ...)	//RS ADD START - Map swap related
	levels_for_distress += list(using_map.z_list["z_offmap1"])
	levels_for_distress += list(using_map.z_list["z_beach"])
	levels_for_distress += list(using_map.z_list["z_aerostat"])
	levels_for_distress += list(using_map.z_list["z_aerostat_surface"])
	levels_for_distress += list(using_map.z_list["z_fueldepot"])
	. = ..()	//RS ADD END

/obj/effect/overmap/visitable/ship/stellar_delight/build_skybox_representation()
	..()
	if(!cached_skybox_image)
		return
	cached_skybox_image.add_overlay("glow")

// We have a bunch of stuff common to the station z levels
/datum/map_z_level/stellar_delight
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_XENOARCH_EXEMPT|MAP_LEVEL_PERSIST
	holomap_legend_x = 220
	holomap_legend_y = 160

/datum/map_z_level/stellar_delight/deck_zero
	z = Z_LEVEL_SHIP_MAINTENANCE
	name = "Subdeck"
	base_turf = /turf/space
	transit_chance = 25
	holomap_offset_x = SHIP_HOLOMAP_MARGIN_X
	holomap_offset_y = SHIP_HOLOMAP_MARGIN_Y

/datum/map_z_level/stellar_delight/deck_one
	z = Z_LEVEL_SHIP_LOW
	name = "Deck 1"
	base_turf = /turf/simulated/open
	transit_chance = 25
	holomap_offset_x = SHIP_HOLOMAP_MARGIN_X
	holomap_offset_y = SHIP_HOLOMAP_MARGIN_Y

/datum/map_z_level/stellar_delight/deck_two
	z = Z_LEVEL_SHIP_MID
	name = "Deck 2"
	base_turf = /turf/simulated/open
	transit_chance = 25
	holomap_offset_x = SHIP_HOLOMAP_MARGIN_X
	holomap_offset_y = SHIP_HOLOMAP_MARGIN_Y + SHIP_MAP_SIZE

/datum/map_z_level/stellar_delight/deck_three
	z = Z_LEVEL_SHIP_HIGH
	name = "Deck 3"
	base_turf = /turf/simulated/open
	transit_chance = 25
	holomap_offset_x = HOLOMAP_ICON_SIZE - SHIP_HOLOMAP_MARGIN_X - SHIP_MAP_SIZE
	holomap_offset_y = SHIP_HOLOMAP_MARGIN_Y + SHIP_MAP_SIZE

/datum/map_template/ship_lateload
	allow_duplicates = FALSE
//	var/associated_map_datum //RS REMOVE

/////STATIC LATELOAD/////

#include "../expedition_vr/snowbase/submaps/glacier.dm"
#include "../expedition_vr/snowbase/submaps/glacier_areas.dm"

/datum/map_template/ship_lateload/on_map_loaded(z)
	if(!associated_map_datum || !ispath(associated_map_datum))
		log_game("Extra z-level [src] has no associated map datum")
		return

	new associated_map_datum(using_map, z)

/datum/map_template/station_map/sd0	//RS ADD START - Map swap related
	name = "SD0"
	mappath = 'maps/stellar_delight/stellar_delight0.dmm'

	associated_map_datum = /datum/map_z_level/stellar_delight/deck_zero

/datum/map_template/station_map/sd1
	name = "SD1"
	mappath = 'maps/stellar_delight/stellar_delight1.dmm'

	associated_map_datum = /datum/map_z_level/stellar_delight/deck_one

/datum/map_template/station_map/sd2
	name = "SD2"
	mappath = 'maps/stellar_delight/stellar_delight2.dmm'

	associated_map_datum = /datum/map_z_level/stellar_delight/deck_two

/datum/map_template/station_map/sd3
	name = "SD3"
	mappath = 'maps/stellar_delight/stellar_delight3.dmm'

	associated_map_datum = /datum/map_z_level/stellar_delight/deck_three	//RS ADD END

/datum/map_template/ship_lateload/ship_centcom
	name = "Ship - Central Command"
	desc = "Central Command lives here!"
	mappath = 'ship_centcom.dmm'

	associated_map_datum = /datum/map_z_level/ship_lateload/ship_centcom

/datum/map_z_level/ship_lateload/ship_centcom
	name = "Centcom"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_z_level/ship_lateload/ship_centcom/New(datum/map/map)	//RS ADD START - Map swap related
	z = using_map.z_list["z_centcom"]
	. = ..()	//RS ADD END

/area/centcom //Just to try to make sure there's not space!!!
	base_turf = /turf/simulated/floor/outdoors/rocks

/datum/map_template/ship_lateload/ship_misc
	name = "Ship - Misc"
	desc = "Misc areas, like some transit areas, holodecks, merc area."
	mappath = 'ship_misc.dmm'

	associated_map_datum = /datum/map_z_level/ship_lateload/misc

/datum/map_z_level/ship_lateload/misc
	name = "Misc"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT

/datum/map_z_level/ship_lateload/misc/New(datum/map/map)	//RS ADD START - Map swap related
	z = using_map.z_list["z_misc"]
	. = ..()	//RS ADD END

#include "../submaps/space_rocks/space_rocks.dm"
/datum/map_template/ship_lateload/space_rocks
	name = "V3b Asteroid Field"
	desc = "Space debris is common in V3b's orbit due to the proximity of Virgo 3"
	mappath = 'maps/submaps/space_rocks/space_rocks.dmm'

	associated_map_datum = /datum/map_z_level/ship_lateload/space_rocks

/datum/map_template/ship_lateload/space_rocks/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_SPACE_ROCKS), 60, /area/sdmine/unexplored, /datum/map_template/space_rocks)
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_SPACE_ROCKS, world.maxx - 4, world.maxy - 4)
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_SPACE_ROCKS, 64, 64)

/datum/map_z_level/ship_lateload/space_rocks
	z = Z_LEVEL_SPACE_ROCKS
	name = "V3b Asteroid Field"
	base_turf = /turf/space
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT|MAP_LEVEL_CONSOLES

/datum/map_template/ship_lateload/overmap
	name = "Overmap"
	desc = "Overmap lives here :3"
	mappath = 'overmap.dmm'

	associated_map_datum = /datum/map_z_level/ship_lateload/overmap

/datum/map_z_level/ship_lateload/overmap
	z = Z_LEVEL_OVERMAP
	name = "Overmap"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_SEALED|MAP_LEVEL_CONTACT|MAP_LEVEL_XENOARCH_EXEMPT

#include "../expedition_vr/aerostat/_aerostat_science_outpost.dm"
/datum/map_template/common_lateload/away_aerostat/science	//RS EDIT
	name = "Remmi Science Aerostat - Z1 Aerostat"	//RS EDIT
	desc = "The Virgo 2 Aerostat away mission."
	mappath = 'maps/expedition_vr/aerostat/aerostat_science_outpost.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/away_aerostat
