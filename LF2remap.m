function lf2d = LF2remap(lf)
% Remap the 4D light field to a 2D image
[u,v,height,width,channels] = size(lf);
lf = permute(lf,[1,3,2,4,5]);
lf2d = reshape(lf,[u*height,v*width,channels]);

% for i = 1: u
%     for j = 1: v
%         imlf = squeeze(lf(i,j,:,:,:));
%         imlf_rec = zeros(size(imlf));
%         for y = 1: height
%             for x = 1: width
%                 imlf_rec(y,x,:) = lfimg1( (y-1)*u+i , (x-1)*v+j, :);
%             end
%         end
%         cmp = imlf_rec ~= imlf;
%         if (sum(cmp(:)) >= 1)
%             disp('wrong');
%         else
%             disp('success');
%         end
%     end
% end


% figure(1),imshow(lfimg1);