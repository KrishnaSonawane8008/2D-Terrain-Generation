extends TileMap

var dirt = FastNoiseLite.new()
var newnoise =FastNoiseLite.new()
var width=1500
var height=300
var t_factor=0
var stop_mountain=0
var peaks=5
var m_height=100
var tree_chance=0
# Called when the node enters the scene tree for the first time.

func _ready():
	dirt.seed=randi()
	newnoise.seed=randi()
	for x in range(width):
		var grd=abs(newnoise.get_noise_2d(x,0)*peaks)
		if(x>200 and stop_mountain==0):
			if(t_factor==0):
				peaks+=0.5
				m_height-=1
				if(m_height==50):
					t_factor=1
			if(t_factor==1):
				peaks-=0.5
				m_height+=1
				if(m_height==200):
					t_factor=0
					stop_mountain=1
		tree_chance=(randi()%10)+1
		var layer=1
		for y in range(grd+m_height,height):
			var n= newnoise.get_noise_2d(x,y)*0.1
			var d= dirt.get_noise_2d(x,y)
			dirt.fractal_octaves=4
			dirt.frequency=0.0841
			dirt.fractal_lacunarity=1
			dirt.fractal_gain=0.7
			dirt.noise_type=FastNoiseLite.TYPE_SIMPLEX_SMOOTH
			if n>-0.1:
				if layer==1:
					if(tree_chance==3):
						set_cell(0,Vector2i(x,y-1),7,Vector2i(1,1))
						var br=randi()%9+6
						var branch_range=randi()%5+3
						for bark in range(1,br):
							set_cell(0,Vector2i(x,y-1-bark),7,Vector2i(0,1))
						for green in range(1,6):
							if(green==1):
								for branch in range(1,branch_range+1):
									set_cell(0,Vector2i(x-(branch)+(int(branch_range/2))+1,y-br-green),7,Vector2i(1,0))
							elif(green==2):
								for leaves in range(1,branch_range+3):
									set_cell(0,Vector2i(x-(leaves-1)+(int(branch_range/2))+1,y-br-green),7,Vector2i(0,0))
							elif(green==3):
								for leaves in range(1,branch_range+5):
									set_cell(0,Vector2i(x-(leaves-2)+(int(branch_range/2))+1,y-br-green),7,Vector2i(0,0))
							elif(green==4):
								for leaves in range(1,branch_range+3):
									set_cell(0,Vector2i(x-(leaves-1)+(int(branch_range/2))+1,y-br-green),7,Vector2i(0,0))
							elif(green==5):
								for leaves in range(1,branch_range+1):
									set_cell(0,Vector2i(x-(leaves)+(int(branch_range/2))+1,y-br-green),7,Vector2i(0,0))
							
					set_cell(0,Vector2i(x,y),1,Vector2i(1,0))
					layer+=1
				elif layer>1 && layer<=10:
					set_cell(0,Vector2i(x,y),1,Vector2i(0,0))
					layer+=1
				elif layer>10 && layer<=20:
					set_cell(0,Vector2i(x,y),1,Vector2i(1,1))
					layer+=1
			if d<0.3:
				if layer>20 && layer<=40:
					set_cell(0,Vector2i(x,y),1,Vector2i(1,1))
					layer+=1
				elif layer>30:
					set_cell(0,Vector2i(x,y),1,Vector2i(0,1))
			#	layer+=1
					
func _draw():
	draw_rect(Rect2(0, 0, width*16, height*16), Color.SKY_BLUE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	
