function LFData=loadLFData(inputpath,LFformat)
    %获取该文件夹下的图像的信息
    flist = dir(strcat([inputpath '*.' LFformat]));
    % 计算总图像数
    nbFile = length(flist);
    uvsize=sqrt(nbFile);
    Img=imread(strcat(inputpath,flist(1).name));
    [h,w,z]=size(Img);
    LFData=zeros(uvsize,uvsize,h,w,z);
    %读取图像并预处理
    itr=1;
    for i=1:uvsize
        for j=1:uvsize
            Img=imread(strcat(inputpath,flist(itr).name));
            LFData(i,j,:,:,:)=Img;
            itr=itr+1;
        end
    end
end