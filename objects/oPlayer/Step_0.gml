//Get Player Input
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D")); 
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W")); 
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S")); 
keyActivate = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check_pressed(vk_shift);
keySelectItem = keyboard_check_pressed(vk_control);
keySelectItemDown = keyboard_check_pressed(ord("Q"));
keySpecialAttack = keyboard_check_pressed(vk_tab);

inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

if (!global.gamePaused){
	script_execute(state);
	invulnerable = max(invulnerable-1,0);
	flash = max(flash-0.05,0);
}
depth = -bbox_bottom;