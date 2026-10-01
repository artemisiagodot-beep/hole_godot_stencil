extends GameSystem 


func _ready() -> void:
	task.text = "Your task is collect " + str(win_score/2)+" pillars in " + str(time.wait_time) +"seconds." 
