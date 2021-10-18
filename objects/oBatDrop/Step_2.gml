 /// @description Insert description here
// You can write your code in this editor
flash = max(0,flash-0.05);
fric = 0.05;
if (z==0) fric = 0.10;

//Magnetize
if(instance_exists(oPlayer)) and (global.inventoryOpen == false){
	var _px = oPlayer.x;
	var _py = oPlayer.y;
	var _dist = point_distance(x,y,_px,_py);
	
	if (_dist < 16){ // Magnet Radius
		spd += 0.25;
		direction = point_direction(x,y,_px,_py);
		spd = min(spd,3);
		fric = 0;
		if (_dist < 5){ // Collect Radius
			if (collectScriptArg != -1){
				script_execute(collectScript, collectScriptArg);
			}else{
				if (collectScript != -1) script_execute(collectScript);
			}
			instance_destroy();
		}
	}
}

if(bounceCount != 0){
		bounce += (pi*bounceSpeed);
		if(bounce > pi){
			bounce -= pi;
			bounceHeight *= 0.6;
			bounceCount--;
		}
		z = abs(sin(bounce)) * bounceHeight;
	}else z = 0;

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
spd = max(spd-fric,0);
depth = -bbox_bottom;