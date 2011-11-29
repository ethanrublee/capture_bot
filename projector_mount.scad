width = 45;
height = 14;
girth = 15;
beef = 10;
module projector(width,height,girth)
{
  cube([width,girth + 5,height],center=true);
}
module screw_tube()
{
  cylinder(r = 2.286/2, h = 20, center = true, $fn=100);  
}
module screw_holes(width,beef)
{
    translate([width/2 + beef/2,0,0])
    screw_tube();
    translate([-width/2 - beef/2,0,0])
    screw_tube();
}
module base_block(width,height,girth,beef)
{
  difference()
  {
  
    cube([width+2*beef,girth,height+beef/2],center=true);
    translate([0,0,beef*0.26])
    projector(width,height,girth);
    screw_holes(width,beef);
  }
}

module top_block(width,height,girth,beef)
{
  difference()
  {
    cube([width+2*beef,girth,beef/2],center=true);
    translate([0,0,beef*0.26])
    screw_holes(width,beef);
  }
}

base_block(width,height,girth,beef);
translate([0,girth+5,-height/2])
top_block(width,height,girth,beef);
