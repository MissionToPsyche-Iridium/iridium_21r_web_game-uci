extends Camera2D

@export var tilemap: TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	
	var tilemaps := get_tree().get_nodes_in_group("TileMaps")
	for map in tilemaps:
		print(map)
		if map.name == "TileMapLayer":
			tilemap = map
	
	setup_camera_limits()

func setup_camera_limits():
	if not tilemap:
		print("not tilemap")
		return
	
	var used_rect: Rect2i = tilemap.get_used_rect()
	var map_size := tilemap.tile_set.get_tile_size()
	
	limit_left = used_rect.position.x
	limit_top = used_rect.position.y * map_size.y
	limit_right = (used_rect.position.x + used_rect.size.x) * map_size.x
	limit_bottom = (used_rect.position.y + used_rect.size.y) * map_size.y
