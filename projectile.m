function res = projectile(t, W)
% t:    the time
% W:    the current position and velocity [x; y; dx/dt; dy/dt]
% res:  a vector [dx/dt; dy/dt; d2x/dt; d2y/dt]

%unpack the current position and velocity
m_planet = 5.972e24; %kg

P = W(1:2); %the current position [x y]
V = W(3:4); %the current velocity [dx/dt dy/dt]

dPdt = V; % change in position is velocity
dVdt = acceleration(P, m_planet);

res = [dPdt; dVdt];
end

function res = acceleration(P, m_planet)

G = 6.67384e-11;
x = P(1);
y = P(2);

a_grav = G * m_planet / sqrt(x^2 + y^2);

unit_vector = [x; y] ./ norm([x y]);
res = -a_grav * unit_vector;

end

