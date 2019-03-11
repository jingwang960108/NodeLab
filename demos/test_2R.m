%% test_2R
% % This test generates non-uniform nodes inside a rectangle (square) within 
% a bounding box (-1,1)^2. The node-density is highest at the 
% two control points: 'ctps'.

clear variables; close all; clc
%------------------------------------------------
box    = [-1,-1; 1,1];
hbdy   = 0.02;
ptol   = 0.001;
%ctps   = [];
ctps   = [-0.5,1; 0.5, 1];
%ctps   = [linspace(-0.5, 0.5,10); 0.5*ones(1,10)]';
radius = @(p,ctps) 0.005+0.05*(min(pdist2(ctps, p)));
%radius = @(p, ctps) 0.05;
[b]    = draw_rect(-1,-1,1,1,2/hbdy);
[xy]   = NodeLab2D(b.sdf,box,ctps,ptol,radius);
[bdy]  = b.xy;
clear box hbdy ptol ctps radius b
%---------------------------------------------------
plot(xy(:,1), xy(:,2),'.k','MarkerSize',12);hold on
plot(bdy(:,1), bdy(:,2), '.k','MarkerSize',12); axis('square')
set(gca,'visible','off')

