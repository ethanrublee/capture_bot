include <tubing.scad>

tube_od = 9.0;
tube_or = tube_od / 2.0;
spacing = tube_od + 20;
res = 100;
$fn=100;

width = tube_od + 8;
depth = tube_od + 8;

module block_sleeve(width,depth,height)
{
  difference()
  {
    cube([width,depth,height],center=true);
    
  }
}
module laser_hole(width,depth,height)
{
  tubing(tube_or, height + 2);
}

module set_hole(length, axis)
{
 rotate(90,axis)
 cylinder(r = 2.286/2, h = length, center = true, $fn=100 );
}


module set_holes()
{
  translate([-width/2,depth/2 - tube_or -4,0])
  set_hole(10, [0,1,0]);
}

module laser_block()
{

difference()
{
    block_sleeve(22, depth+2, 10);
    laser_hole(width,depth,10);
    set_holes();
}
}

union()
{

difference()
{
translate([0,-10,0])
rotate(20,[1,0,0])
difference(){
	block_sleeve(22,10,10);
 	translate([8.5,-1,2])
	rotate(90,[0,1,0])  	
	set_hole(20, [0,1,0]);
 	translate([-8.5,-1,2])
	rotate(90,[0,1,0])  	
	set_hole(20, [0,1,0]);
}
laser_hole(width,depth,10);
translate([0,0,-10.0])
block_sleeve(50,100, 10);
}
difference()
{
laser_block();
translate([0,-10,0])
rotate(20,[1,0,0])
union()
{
	translate([8.5,-1,2])
	rotate(90,[0,1,0])  	
	set_hole(20, [0,1,0]);
 	translate([-8.5,-1,2])
	rotate(90,[0,1,0])  	
	set_hole(20, [0,1,0]);
}
}
}