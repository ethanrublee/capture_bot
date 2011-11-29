res = 10;
module tubing(radius, length)
{
    cylinder(r = radius, h = length, center = true, $fn=res);  
}

module sleeve(length, tube_ir, thickness)
{
  difference()
  {
    cylinder(r = (tube_ir + thickness), h = length, center = true,$fn=res );
    tubing(tube_ir,length+4);
  }
}

module cap(radius)
{
  difference()
  {
    sphere(r = radius);
    translate([0,0,-radius])
    cube(size = 2*radius,center=true);
  }
}
  
module capped01()
{


 
  tube_od = 7.9;
 	tube_or = tube_od / 2.0;
  tube_length = 10;
  union()
  {
    sleeve(tube_length,tube_or, 1.0);
    translate([0,0,tube_length/2.])
    cap(tube_or + 1.1);
  }
}

module connector01(tube_length)
{
  tube_od = 7.9;
 	tube_or = tube_od / 2.0;

  union()
  {
    translate([10,0,0])
      sleeve(tube_length ,tube_or,1.0);
    translate([-10,0,0])
      sleeve(tube_length ,tube_or,1.0);
    cube([tube_length  - tube_od,5,tube_length],center = true);
  }

}

module connector02(tube_length )
{
  tube_od = 7.9;
 	tube_or = tube_od / 2.0;
  module shape01()
  {
    difference()
    {
      sleeve(tube_length ,tube_or,1.0);
      translate([0,tube_length/2,tube_length/2. - tube_or * 1.5  ])
      rotate([90,0,0])
      tubing(tube_or,tube_length+1);
    }
  }
  
  module shape02(tube_length )
  {
    difference()
    {
      sleeve(tube_length ,tube_or,1.0);
      translate([0,0,tube_length/2. ])
      rotate([90,0,0])
      tubing(tube_or,tube_length+1);
    }
  }
  union()
  {
  shape01();
  
  #translate([0,tube_length/2,tube_length/2. - tube_or * 1.5  ])
  rotate([90,180,0])
      shape02(tube_length);
  }
}

//capped01();
/*
translate([0,-10,0])
  connector01(20);
translate([0,10,0])
  connector01(20);
  */
  module tube_joint()
  {
  tube_od = 7.85;
 	tube_or = tube_od / 2.0;
 	
  //translate([0,-30,0])
  //connector01(20);
  rotate([0,-90,0])
  difference()
  {
  rotate([0,90,0])
  cylinder(r=10,h=40,center = true,$fn=res);
  //cube([35,20,20],center = true);
  translate([-10,0,0])
  tubing(tube_or,30);
    translate([10,0,0])
  tubing(tube_or,30);
  rotate([90,0,0])
      translate([10,0,0])
  tubing(tube_or,30);
    rotate([90,0,0])
      translate([-10,0,0])
  tubing(tube_or,30);
      rotate([0,90,0])
      //translate([-10,0,0])
  tubing(tube_or,50);
  }
  }

