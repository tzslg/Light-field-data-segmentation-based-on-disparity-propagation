function [segments_lf] = LFsegBilinear(segments_im, Sp_info, uv_size)
[height,width] = size(segments_im);
uv_radius = floor((uv_size)/2);
segments_lf = zeros(uv_size,uv_size,height,width);
%% 视差传递，正确 ,双线性插值
    for u = 1: uv_size
        delta_u = u-uv_radius-1;
        for v = 1: uv_size
            delta_v = v-uv_radius-1;    
            for y = 1: height
                for x = 1: width
                         yy =y-delta_u*Sp_info(y,x);
                         xx =x-delta_v*Sp_info(y,x);  
                         %防止越界
                         if yy>height||xx>width||yy<1||xx<1
                            yy=min(yy,height);
                            yy=max(yy,1);
                            xx=min(xx,width);
                            xx=max(xx,1);
                         end
                         temp=segments_im(y,x);    
                         yy1=floor(yy);yy2=ceil(yy);
                         xx1=floor(xx);xx2=ceil(xx); 
                         d1=xx-xx1;d2=xx2-xx; 
                         d3=yy-yy1;d4=yy2-yy;
                         
                         temp1=temp*d3*d1;
                         temp2=temp*d3*d2;
                         temp3=temp*d4*d1;
                         temp4=temp*d4*d2;                       
                         segments_lf(u,v,yy1,xx1)=segments_lf(u,v,yy1,xx1)+temp1;   
                         segments_lf(u,v,yy1,xx2)=segments_lf(u,v,yy1,xx2)+temp2; 
                         segments_lf(u,v,yy2,xx1)=segments_lf(u,v,yy2,xx1)+temp3; 
                         segments_lf(u,v,yy2,xx2)=segments_lf(u,v,yy2,xx2)+temp4; 
                end
            end
        end
    end
    segments_lf(segments_lf>0)=1;
end

 


