clc;
clear;
prwaitbar off;
% NIST prdatafile set
% nist_10 = prnist([0:9],[1:100:1000]);
load('/Users/yuanzhou/Documents/Github/Pattern-Recognition/MNIST_dataset/"nist_10".mat');
% preprocessing
preproc = im_box([],0,1)*im_rotate*im_box([],1,0)*im_resize([],[28,28]);
nist_10 = nist_10 * preproc;

%Calculate all the image features
% features = im_features(nist_10,nist_10,'all');  % sizeof(nist_10) * 24
load('"features_nist_10".mat')
features_m = +features;
%% ============ Rescaling scalem(Compute scaling map)=========
mapping_scale = scalem(features, 'variance');
scaledData = features*mapping_scale;

% Perform Principal Component Analysis
  % Extraction 10 features gives 95% of the variance
mapping_PCA = pcam(scaledData, 0.99);
PCAData = scaledData*mapping_PCA

% Split into train and test dataset.
[trn, tst, index_trn, index_tst] = gendat(PCAData, 0.95);
w = fisherc(trn);
e = tst*w*testc









