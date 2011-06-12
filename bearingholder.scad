module disk(height, bore, od)
{

    module bearing_base(height, od)
    {
			cylinder(r = od/2, h = height, center = true);
	}
	
	module bearing(height,bore,od)
	{
	    difference() 
	    {
	        bearing_base(height,od);
	        cylinder(r = bore/2, h = height + 2, center = true);
	    }
	}
	bearing(height,bore,od);
}

disk(height=7,bore=8,od=22, $fn=100);

