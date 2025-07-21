class_name Player
extends CharacterBody2D

@onready var hit_component: HitComponent = $HitComponent
@export var current_tool: DataTypes.Tools = DataTypes.Tools.None

var player_direction: Vector2

func _on_ready() -> void:
	ToolManager.tool_selected.connect(on_tool_select)
	
func on_tool_select(tool: DataTypes.Tools) -> void:
	current_tool = tool
	hit_component.current_tool = tool
