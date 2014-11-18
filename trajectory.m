function [T Trajectory] = trajectory(v_initial, r_planet, equatorial_speed, m_planet)

v_x = equatorial_speed;
v_y = v_initial;
x = 0;
y = r_planet;
[T, Trajectory] = ode45(@derivs, [0 100], [x y v_x v_y]);

    function res = derivs(t, W)
    % t:    the time
    % W:    the current position and velocity [x; y; dx/dt; dy/dt]
    % res:  a vector [dx/dt; dy/dt; d2x/dt; d2y/dt]

    P = W(1:2); %the current position [x y]
    V = W(3:4); %the current velocity [dx/dt dy/dt]

    dPdt = V; % change in position is velocity
    dVdt = acceleration(P, m_planet);

    res = [dPdt; dVdt];
end

end

function res = acceleration(P, m_planet)

G = 6.67384e-11;
x = P(1);
y = P(2);

a_grav = G * m_planet / sqrt(x^2 + y^2);

unit_vector = [x; y] ./ norm([x y]);
res = -a_grav * unit_vector;

end
