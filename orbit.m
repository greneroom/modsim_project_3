function [init_ang, init_vel] = orbit(v_initial, launch_angle, initial_height, is_backward) 

% Inputs: 
%     v_initial -> magnitude of the initial launch velocity
% 
% Outputs:
%     Sole function is to plot results.
    

%set the constants
m_planet = 5.972e24; %Mass of the planet in kg
r_planet = 6378137; %Radius of planet Earth (m)
m_projectile = 8e-3; %mass of bullet is 8 grams
surface_density = 1.2; %kg/m^3, air density on earth
atmosphere_height = 100e3; %atmospheric height of earth (m)


%evaluate the trajectory of the projectile

[T, Trajectory] = trajectory(m_projectile, v_initial, r_planet, surface_density, atmosphere_height, m_planet, launch_angle, initial_height, is_backward); %Computes time series 
 
    
%plot the trajectory of the projectile
X = Trajectory(:, 1); %Unpacks x component of projectile position
Y = Trajectory(:, 2); %Unpacks y component of projectile position

animation()

maxheight = max_height(X, Y, r_planet)

    function animation()
        figure;

        %Plots planet visualization
        theta = linspace(0, 2*pi, 5000);
        plot(cos(theta) * r_planet, sin(theta) * r_planet, 'g', 'LineWidth',2);
        hold on;
        window_size = 0.2; %units: planet radii

        minmax = [min(X),max(X),min(Y),max(Y)];
        x_range = max(X) - min(X);
        y_range = max(Y) - min(Y);
        max_range = 1.2 * max([x_range, y_range]);
        mid_X = mean([max(X), min(X)]);
        mid_Y = mean([max(Y), min(Y)]);
        axis_bounds = [mid_X - max_range / 2, mid_X + max_range / 2, mid_Y - max_range / 2, mid_Y + max_range / 2]

        for i = 1:length(T) - 1
            delay = (T(i+1) - T(i))/100;
            plot(X(i), Y(i),'*');
            %axis([-window_size * r_planet, window_size * r_planet, (r_planet + initial_height) - window_size * r_planet, (r_planet + initial_height) + window_size * r_planet]);
            axis(axis_bounds);
            pause(delay);
        end
        
    end

end


