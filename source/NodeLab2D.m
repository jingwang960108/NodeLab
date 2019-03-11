function [p]= NodeLab2D(fd,bbox,ctps,ptol,radius,varargin) 
%ptol = 0.001;
[p] = node_placing (bbox , 5e+4 ,5e+5,ctps,radius);
 p   = p(feval(fd,p,varargin{:})< eps,:); 

% if yoou want some fixed nodes 
if ~isempty(ctps),
    p=setdiff(p,ctps,'rows'); 
end

pfix=unique(ctps,'rows'); % REMOVE DUPLICATE ONES
p=[pfix; p];                                        
ib  = find(abs(fd([p]))< ptol);
p(ib,:) = [];

%_______________________________________________





% <NodeLab is a simple MATLAB-repository for node-generation and adaptive refinement 
% for testing, and implementing various meshfree methods for solving PDEs in arbitrary domains.>
%     Copyright (C) <2019>  <Pankaj K Mishra>
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.



 
