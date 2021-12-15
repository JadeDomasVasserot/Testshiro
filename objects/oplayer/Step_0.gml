if keyboard_check(vk_enter) && global.alive = 0{
	global.alive = 1;
	room_restart();
}
if global.alive = 0{
	var lay_id = layer_get_id("Background");
	layer_hspeed(lay_id,0);
}

jumpkey = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space);

if jump > 0 && jumpkey && global.alive = 1{
	vspeed = 0;
	vspeed -= 10;
	jump -= 1;
	state = 2;
}

if global.alive = 1{
	vspeed += 0.4;
} else {
	vspeed = 0;
}

with instance_place(x+hspeed, y, owall){
	global.alive = 0;
}
with instance_place(x,y+vspeed,owall){
	with other {
		repeat(abs(vspeed)){
			if !place_meeting(x,y+sign(vspeed),other){
				y += sign(vspeed);
			} else {
				break;
			}
		}
		state = 1;
		jump = 2;
		vspeed = 0;
	}
}
//If Stuck On SolidObject
if (place_meeting(x, y, owall)){
		for(var i = 0; i < 500; ++i) {
		if(!place_meeting(x + i, y, owall)){//Right
			x += i;
			break;
		}
		if(!place_meeting(x - i, y, owall)){//Left				
			x -= i;
			break;
		}
		if(!place_meeting(x, y - i, owall)){//Up
			y -= i;	
			break;
		}
		if(!place_meeting(x, y + i, owall)){//Down
			y += i;
			break;
		}
		if(!place_meeting(x + i, y - i, owall)){//Top Right
			x += i;
			y -= i;
			break;
		}
		if(!place_meeting(x - i, y - i, owall)){//Top Left
			x -= i;
			y -= i;
			break;
		}
		if(!place_meeting(x + i, y + i, owall)){//Bottom Right
			x += i;
			y += i;
			break;
		}
		if(!place_meeting(x - i, y + i, owall)){//Bottom Left
			x -= i;
			y += i;
			break;
		}
	}
}