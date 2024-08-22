extends Sprite2D

#Array of Characters Available 
var characters = []

var currentSelected = 0 	#Spot of the cursosr within the characters[]
var currentColumnSpot = 0 	#Spot of the cursor based on the column 
var currentRowSpot = 0		#Spot of the cursor based on the row 
var cursorPos: Vector2i = Vector2i(0,0) #position of cursor in grid 
var cell_size: Vector2 #size of each grid cell

@export var cursor: Texture		#Cursor Texture when Player is choosing 
@export var amountofRows: int = 1 
@export var portraitOffset: Vector2 #distance between columns 
@export var columns: int

#Objects
@onready var gridContainer = get_parent().get_node("GridContainer")

func _ready():
	#Get all of the characters stored within the group Characters and pace them in the Array Character
		for nameOfCharacter in get_tree().get_nodes_in_group("Characters"):
			characters.append(nameOfCharacter)
			print(characters)
			print("PO: ", portraitOffset)
		texture = cursor
		cell_size = gridContainer.rect_size / Vector2(columns, gridContainer.get_child_count())
		
func _process(delta):
	if(Input.is_action_just_pressed("right")):
		currentSelected += 1
		currentColumnSpot += 1
		move_cursor(Vector2i(1,0))
		print(position.x)
	elif(Input.is_action_just_pressed("left")):
		currentSelected -= 1
		currentColumnSpot -= 1
		position.x -= portraitOffset.x
		
func move_cursor(direction: Vector2i):
	var newPos= cursorPos + direction 
	
	if newPos.x >= 0 and newPos.x < columns and newPos.y >= 0 and newPos.y < (gridContainer.get_child_count() / columns):
		cursorPos = newPos
		update_cursor_position()

func update_cursor_position():
	position = Vector2(cursorPos.x, cursorPos.y) * cell_size
	
		
		
		
		
