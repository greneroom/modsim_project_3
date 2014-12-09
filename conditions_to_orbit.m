function [angle, init_vel] = conditions_to_orbit(planet)

v_orbit = orbital_velocity(planet);

atmosphere_height = planet.('atmosphere_height');

[angle, init_vel] = orbit(planet, v_orbit, 0, atmosphere_height, true, false, false);

end

