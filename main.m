clc;clear;close;
addpath(genpath(pwd));
%% 加载光场数据
inputpath='F:\LFdata\additional\pens\';
LFformat='png';
LFData=loadLFData(inputpath,LFformat);
%%
load('Data\mypens.mat');
uv_radius=9;
%% 分割传递
% 最近邻
% segLF= LFseg(myoutLabel, dispMap, uv_radius);
% 双线性
segLF= LFsegBilinear(myoutLabel, dispMap, uv_radius);
segLF2d = LF2remap(segLF);
%%
uvlabel=squeeze(segLF(8,3,:,:));
figure,imshow(uvlabel,[]);