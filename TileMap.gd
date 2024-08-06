extends TileMap

var fnl := FastNoiseLite.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	fnl.seed = randi()
	generate_map()


func generate_map():
		for x in 500:
			for y in 500:
				var noiseVal := fnl.get_noise_2d(x,y)
				if noiseVal < 0.1:
					set_cell(0, Vector2i(x,y), 0, Vector2i(0,1))
				elif noiseVal < 0.19:
					set_cell(0, Vector2i(x,y), 0, Vector2i(1,1))
				elif noiseVal < 0.4:
					set_cell(0, Vector2i(x,y), 0, Vector2i(2,0))
				else:
					set_cell(0, Vector2i(x,y), 0, Vector2i(1,0))
