extends TileMap

var stupid = FastNoiseLite.new()
var stupid2  = FastNoiseLite.new()
var stupid3 = FastNoiseLite.new()

var width = 32
var height = 32

@onready var player = get_parent().get_node("%Ibides")

func _ready() -> void:
	stupid.seed = randi()
	stupid2.seed = randi()
	stupid3.seed = randi()


func _process(delta: float) -> void:
	generate_chunk(player.position)


func generate_chunk(position):
	var tile_pos = local_to_map(position)
	for x in range(width):
		for y in range(height):
			var stupo = stupid.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)*10
			var stupo2 = stupid2.get_noise_2d(tile_pos.x-width/2  + x, tile_pos.y-height/2 + y)*10
			var stupo3 = stupid3.get_noise_2d(tile_pos.x-width/2  + x, tile_pos.y-height/2 + y)*10
			set_cell(0, Vector2i(tile_pos.x-width/2  + x, tile_pos.y-height/2 + y), 0, Vector2(round((stupo+10)/5), round((stupo2+10)/5)))
