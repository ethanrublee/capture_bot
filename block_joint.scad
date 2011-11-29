include <tubing.scad>

tube_od = 7.30;
tube_or = tube_od / 2.0;
spacing = tube_od + 20;
res = 100;

width = spacing + tube_od + 8;
depth = spacing/2 + tube_od + 8;

module block_sleeve(width,depth,height)
{
  difference()
  {
    cube([width,depth,height],center=true);
    
  }
}
module tube_holes(width,depth,height)
{
  translate([-spacing/2,spacing/4,0])
  tubing(tube_or, height + 2);
  translate([spacing/2,spacing/4,0])
  tubing(tube_or, height + 2);
  translate([0,-spacing/4,0])
  tubing(tube_or, height + 2);
}
module set_hole(length, axis)
{
 rotate(90,axis)
 cylinder(r = 2.286/2, h = length, center = true,$fn=100 );
}

module tri_block()
{
  difference()
  {
    block_sleeve(width, depth, 10);
    translate([-width/2,-depth/2,0])
    rotate(45,[0,0,1])
    cube(25,25,20, center = true);
    translate([width/2,-depth/2,0])
    rotate(45,[0,0,1])
    cube(25,25,20, center = true);
  }
}

module tri_corners()
{
  translate([-spacing/2,spacing/4,0])
cylinder(r= tube_or + 4, h = 50, center = true, $fn=100);
}

//tri_corners();

module set_holes()
{
  translate([width/2,depth/2 - tube_or -4,0])
  set_hole(10, [0,1,0]);

  translate([-width/2,depth/2 - tube_or -4,0])
  set_hole(10, [0,1,0]);

  translate([0,-depth/2,0])
  rotate(90,[0,0,1])
  set_hole(10, [0,1,0]);
}

module tri_block_all()
{

difference()
{
 tri_block();
 tube_holes(width,depth,10);
 set_holes();
}
}

module tri_block_4()
{
tri_block_all();
translate( [(width+1)/2 - 3,- (depth +2)/2 -4, 0] )
rotate(-90,[0,0,1])
tri_block_all();

translate( [ -(width+1)/2 + 3,- (depth +2)/2 -4, 0] )
rotate(90,[0,0,1])
tri_block_all();

translate( [ 0,- (depth +10), 0] )
rotate(180,[0,0,1])
tri_block_all();
}

module corner()
{
union()
{
tri_block_all();
translate( [ 0,depth/2 + 2, -depth/2 - 2])
rotate(90,[1,0,0])
union()
{
translate([0,depth/3 ,6])
rotate(45,[1,0,0])
block_sleeve(15, 15, 10);
translate([0,depth/2 + 2 ,0])
block_sleeve(width, 10, 10);
tri_block_all();
}
}
}

corner();
translate([0,depth + 16,0])
rotate(180,[0,0,1])
corner();
//tri_block_4();
