function createfigure1(X1, Y1, X2, Y2)
%CREATEFIGURE(X1, Y1, X2, Y2)
%  X1:  vector of x data
%  Y1:  vector of y data
%  X2:  vector of x data
%  Y2:  vector of y data

%  Auto-generated by MATLAB on 08-Jun-2021 12:58:29

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'DisplayName','Lazo abierto','Color',[0 0 1]);

% Create plot
plot(X2,Y2,'DisplayName','Lazo cerrado','Color',[1 0 0]);

% Create ylabel
ylabel({'y(s)'});

% Create xlabel
xlabel({'Tiempo [s]'});

% Create title
title({'Respuesta ante un escalón ecuación 1'});

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XGrid','on','YGrid','on');
% Create legend
legend(axes1,'show');
