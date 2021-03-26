clc;clear;close;
addpath(genpath(pwd));

%% Data loading
inputpath='.\Data\pens\';
LFformat='png';
LFData=loadLFData(inputpath,LFformat);
load('Data\mypens.mat');
uv_radius=9;

%% disparity transmission
% Propagation of nearest neighbor interpolation
% segLF= LFseg(myoutLabel, dispMap, uv_radius);
% Bilinear interpolation propagation
segLF= LFsegBilinear(myoutLabel, dispMap, uv_radius);
segLF2d = LF2remap(segLF);

%% visual
uvlabel=squeeze(segLF(8,3,:,:));
figure,imshow(uvlabel,[]);
