include <tubing.scad>
include<Libs.scad>

$fn=100;
res=100;
tube_od = 19.75;
tube_ir = 19.75 / 2.0;
tube_length = 25;

module tube_case()
{
//main tube
  rotate([0,90,0])
  sleeve(50,tube_ir,5);

//screw plate 
  translate([0,0,tube_od - 2])
  cube([50,15,12],center=true);

//fairing for the tub to base joint
  translate([0,10,-tube_ir])
  cube([50,5,5],center=true);
//more fairing
  translate([0,-10,-tube_ir])
  cube([50,5,5],center=true);
}

module screw_hole()
{
  rotate([90,0,0])
  {
    hexNut(size="M4");
    cylinder(r=2.05,h = 50, center = true);
  }
}

module tube_assembly()
{
  translate([0,0,2.75+tube_ir])
  difference()
  {
    tube_case();
    translate([0,0,tube_od - 2])
    {
      cube([55,5,25],center=true);
      translate([0,7.75,0])
      {
        translate([15,0,0])
        screw_hole();
        translate([-15,0,0])
        screw_hole();
      }
    }
  }

  cube([50,50,5],center=true);
}

rotate([0,90,0])
tube_assembly();


