@tool
@icon("res://addons/yet_another_behavior_tree/src/Assets/Icons/btsequence.png")
extends BTComposite
class_name BTSequence


#------------------------------------------
# Signaux
#------------------------------------------

#------------------------------------------
# Exports
#------------------------------------------

@export var save_progression:bool = false

#------------------------------------------
# Variables publiques
#------------------------------------------

#------------------------------------------
# Variables privées
#------------------------------------------

var _running_child_index:int = -1

#------------------------------------------
# Fonctions Godot redéfinies
#------------------------------------------

func tick(actor:Node2D, blackboard:BTBlackboard) -> int:
    for child_index in _children.size():
        if not save_progression or child_index >= _running_child_index:
            var child:BTNode = _children[child_index]
            var result:int = child._execute(actor, blackboard)
            if result != BTTickResult.SUCCESS:
                if save_progression and result == BTTickResult.RUNNING:
                    _running_child_index = child_index
                return result

    return BTTickResult.SUCCESS

#------------------------------------------
# Fonctions publiques
#------------------------------------------

#------------------------------------------
# Fonctions privées
#------------------------------------------

func start(blackboard:BTBlackboard) -> void:
    _running_child_index = 0

func stop(blackboard:BTBlackboard) -> void:
    _running_child_index = -1
