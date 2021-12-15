if global.alive = 0{
	draw_set_font(Font1);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text(room_width/2,room_height/2,"Press ''ENTER'' To Start");
	draw_text(room_width/2,room_height/2+30,"Points "+string(point));
} else {
	draw_set_font(Font1);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_text(10,30,"Points "+string(point));
}
draw_sprite_ext(imagesprite[state],1,x,y+22,0.3,0.3,0,c_white,1);