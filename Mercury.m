classdef Mercury < Planet
    %EARTH Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
     methods
        
        function mercury = Mercury()
            name = 'Mercury';
            speed_of_sound = 1; %No atmosphere -> no drag, doesn't matter
            m_planet = .3301e24; %Mass of the planet in kg
            r_planet = 2440e3; %Radius of planet Earth (m)
            surface_density = 0; %kg/m^3, air density on earth
            atmosphere_height = 1; %atmospheric height of earth (m)
            mercury@Planet(name, m_planet, r_planet, surface_density, atmosphere_height, speed_of_sound);
        end
        
    end
    
end
