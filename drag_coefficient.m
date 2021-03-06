function res = drag_coefficient(v_mag, speed_of_sound)
% Inputs:
%     v_mag: the magnitude of the velocity in m/s
% Outputs:
%     res: the drag coefficient at a given speed

    mach_number = v_mag / speed_of_sound; % 340 m/s is the speed of sound
    
    % This is data from a table for how drag coefficient varies with
    % respect to how fast a projectile is moving.
    Mach = [0.000, 0.400, 0.500, 0.600, 0.700, 0.800, 0.825, 0.850, 0.875, 0.900, 0.925, 0.950, 0.975, 1.000, 1.025, 1.050, 1.075, 1.100, 1.150, 1.200, 1.300, 1.400, 1.500, 1.600, 1.800, 2.000, 2.200, 2.400];
    C_D = [0.230, 0.229, 0.200, 0.171, 0.164, 0.144, 0.141, 0.137, 0.137, 0.142, 0.154, 0.177, 0.236, 0.306, 0.334, 0.341, 0.345, 0.347, 0.348, 0.348, 0.343, 0.336, 0.328, 0.321, 0.304, 0.292, 0.282, 0.270];
    
    % Use the table to interpolate the drag coefficient at the current
    % velocity
    answer = interp1(Mach, C_D, mach_number, 'linear');
    
    % If the current velocity falls above the bounds of the table, then
    % approximate drag coefficient by assuming it exponentially decays
    % toward to value of C_D at mach 0.
    if (mach_number > Mach(end))
        answer = 0.3705 * exp(-.903 * mach_number) + C_D(1);
    end
    
    res = answer;
        
    
end

