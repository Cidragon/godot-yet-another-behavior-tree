@tool
@icon("res://addons/yet_another_behavior_tree/src/Assets/Icons/btrepeatuntil.png")
extends BTDecorator
class_name BTRepeatUntil

#------------------------------------------
# Signaux
#------------------------------------------

#------------------------------------------
# Exports
#------------------------------------------

@export_enum("SUCCESS:0", "RUNNING:1", "FAILURE:2") var stop_condition:int = 0

@export_range(0, 999999) var max_iteration:int = 0

#------------------------------------------
# Variables publiques
#------------------------------------------

#------------------------------------------
# Variables privées
#------------------------------------------

#------------------------------------------
# Fonctions Godot redéfinies
#------------------------------------------

#------------------------------------------
# Fonctions publiques
#------------------------------------------

func tick(actor:Node2D, blackboard:BTBlackboard) -> int:
    var result:int
    var not_stopped:bool = true
    var iteration_count:int = 0
    while not_stopped:
        result = _children[0]._execute(actor, blackboard)
        if stop_condition == BTTickResult.SUCCESS and result == BTTickResult.SUCCESS:
            not_stopped = false
        if stop_condition == BTTickResult.RUNNING and result == BTTickResult.RUNNING:
            not_stopped = false
        if stop_condition == BTTickResult.FAILURE and result == BTTickResult.FAILURE:
            not_stopped = false

        if max_iteration > 0:
            iteration_count += 1
            if not not_stopped and iteration_count > max_iteration:
                not_stopped = false

    return result

#------------------------------------------
# Fonctions privées
#------------------------------------------
