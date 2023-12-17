extends Control


func _on_yes_pressed():
	pass # Replace with function body.


func _on_no_pressed():
	GameManager.main_menu()
	queue_free()
