classdef Mars < Planet
    %EARTH Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
     methods
        
        function mars = Mars()
            m_planet = 639e21; %Mass of the planet in kg
            r_planet = 3396e3; %Radius of planet Earth (m)
            surface_density = .02; %kg/m^3, air density on earth
            atmosphere_height = 17559; %atmospheric height of earth (m)
            mars@Planet(m_planet, r_planet, surface_density, atmosphere_height);
        end
        
    end
    
end