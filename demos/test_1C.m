%% test_1C
% This test generates non-uniform nodes inside a circle within 
% a bounding box (-1,1)^2. The node-density is highest at the 
% two control points: 'ctps'. 

%%
clear; close all; clc;

%% Define control parameters
% This section explains the control parameters

box    = [-1,-1; 1,1]; %Bounding box
hbdy   = 0.02;
ptol   = 0.001;
[b]    = draw_circ(0,0,1,2/hbdy);
ctps   = [-0.75,0; 0.75,0]; %Define point concentration

%Define distance function for node density metric
radius = @(p,ctps) 0.005+0.08*(min(pdist2(ctps, p))); % for variable node-density

%% Use |NodeLab2D| to get point spread 

[xy]   = NodeLab2D(b.sdf,box,ctps,ptol, radius);
[bdy]  = b.xy;

%% 
% Visualizing

figure; hold on;
plot(xy(:,1), xy(:,2),'.k','MarkerSize',6)
plot(bdy(:,1), bdy(:,2), '.k','MarkerSize',6)
axis tight; axis square; 
drawnow; 

%% 
% The following part has been included for visualizing the control parameters required for |NodeLab2D|
% You can add similar visualization section for other demos or your own experiment 
% to have a better understanding of NodeLab. 

n=25;
[X,Y]=meshgrid(linspace(box(1,1),box(2,1),n),linspace(box(1,2),box(2,2),n));
R=reshape(radius([X(:) Y(:)],ctps),size(X));

figure; hold on;
hl(1)=plot(b.xy(:,1), b.xy(:,2),'r.-','LineWidth',1, 'MarkerSize',6);
plot([box(1,1) box(1,1) box(2,1) box(2,1) box(1,1)],[box(1,2) box(2,2) box(2,2) box(1,2) box(1,2)],'b-','LineWidth',1);
hl(2)=plot(box(:,1),box(:,2),'b.', 'MarkerSize',25);
hl(3)=plot(ctps(:,1),ctps(:,2),'k.', 'MarkerSize',25);
% hl(4)=scatter(X(:),Y(:),15,R(:),'filled');
hl(4)=surf(X,Y,zeros(size(X)),R,'EdgeColor','none','FaceColor','interp','FaceAlpha',0.5);
axis tight; axis square; 
colormap(jet(250));
legend(hl,{'Boundary','Bounding box','Mesh density control points','Mesh density visualization'},'Location','northeastoutside')
drawnow; 
