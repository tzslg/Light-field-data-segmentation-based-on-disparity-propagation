function lf4d = LF2remap4d(lf,uv_size)
[height,width,channels] = size(lf);
height = height/uv_size;
width = width/uv_size;
lf4d = reshape(lf, [uv_size, height, uv_size, width, channels]);
lf4d = permute(lf4d, [1,3,2,4,5]);