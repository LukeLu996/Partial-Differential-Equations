%Script 4
%solution
clear
m = 0; %A parameter corresponding to the symmetry of the problem. 
%m can be slab = 0, cylindrical = 1, or spherical = 2
x=0:0.01:1;
t=0:0.01:1;

sol = pdepe(m,@pdefun,@pdeic,@pdebc,x,t);
% Extract the first solution component as u.
u = sol(:,:,1);

% A surface plot.
figure(1)
surf(x,t,u) 
title('Numerical solution of 1-D parabolic equation')
xlabel('x')
ylabel('t')
zlabel('u')

% A solution profile can also be illuminating.
figure(2)
plot(x,u(end,:))
title('Solution at t = 1')
xlabel('x')
ylabel('u(x,1)')

figure(3)
fig = plot(x,u(:,1),'erase','xor')
for k=2:101
    set(fig,'xdata',x,'ydata',u(:,k))
    axis([0 1 -1 1])
    pause(.02)
end
