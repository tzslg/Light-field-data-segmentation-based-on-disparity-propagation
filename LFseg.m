function [segments_lf] = LFseg(segments_im, Sp_info, uv_size)
[height,width] = size(segments_im);
uv_radius = floor((uv_size)/2);
segments_lf = zeros(uv_size,uv_size,height,width);
% 视差传递，正确
    for u = 1: uv_size
        delta_u = u-uv_radius-1;
        for v = 1: uv_size
            delta_v = v-uv_radius-1;    
            for y = 1: height
                for x = 1: width
                    if segments_im(y,x)>0 %
                         uv_y = round(y-delta_u*Sp_info(y,x));
                         uv_x = round(x-delta_v*Sp_info(y,x));  
                         if uv_y>height ||uv_x>width ||uv_y<1||uv_x<1
                            uv_y=min(uv_y,height);
                            uv_y=max(uv_y,1);
                            uv_x=min(uv_x,width);
                            uv_x=max(uv_x,1);
                         end
                         segments_lf(u,v,uv_y,uv_x) = segments_im(y,x);
                    end
                end          
            end       
        end    
    end
end
 


