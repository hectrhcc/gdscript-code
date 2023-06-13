extends Control


# Called when the node enters the scene tree for the first time.

var thread

# The thread will start here.
func _ready():
	thread = Thread.new()
	# Third argument is optional userdata, it can be any variable.
	thread.start(self, "_thread_function", "Wafflecopter")


# Run here and exit.
# The argument is the userdata passed from start().
# If no argument was passed, this one still needs to
# be here and it will be null.
func _thread_function(userdata):
	# Print the userdata ("Wafflecopter")
	print("I'm a thread! Userdata is: ", userdata)

# Thread must be disposed (or "joined"), for portability.
func _exit_tree():
	thread.wait_to_finish()
