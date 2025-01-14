@tool
@icon("res://addons/yet_another_behavior_tree/src/Assets/Icons/btdecorator.png")
extends BTNode
class_name BTDecorator

#------------------------------------------
# Signaux
#------------------------------------------

#------------------------------------------
# Exports
#------------------------------------------

#------------------------------------------
# Variables publiques
#------------------------------------------

#------------------------------------------
# Variables privées
#------------------------------------------

#------------------------------------------
# Fonctions Godot redéfinies
#------------------------------------------

func _get_configuration_warnings() -> PackedStringArray:
    var warnings:PackedStringArray = []
    if not _has_only_one_child():
        warnings.append("A decorator must have only one child")
    if not _child_is_bt_node():
        warnings.append("A decorator must have a child of type BTNode")
    return warnings

#------------------------------------------
# Fonctions publiques
#------------------------------------------

#------------------------------------------
# Fonctions privées
#------------------------------------------

func is_valid() -> bool:
    return _has_only_one_child() and _child_is_bt_node()

func _has_only_one_child() -> bool:
    return get_child_count() >= 1

func _child_is_bt_node() -> bool:
    for child in get_children():
        if not child is BTNode:
            return false
    return true
