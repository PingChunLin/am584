clear all; close all; clc;
%Read the images and save as a matrix
%{
directory = dir('*.*');
for k=8:length(directory)
    data=imread(directory(k).name);
    %imshow(directory(k).name);
    data_re = reshape(data,size(data,1)*size(data,2),1);
    vector(:,k)= data_re;
end
vector = im2double(vector(:,5:end));
save('faces.mat','vector');
%}

load faces.mat;
faces = vector;
n = 192; m = 168;
trainingFaces = faces(:,1:end-64); % We use the leave the last for test data
avgFace = mean(trainingFaces,2); % size n*m by 1;

% compute eigenfaces on mean-subtracted training data
X = trainingFaces-avgFace*ones(1,size(trainingFaces,2));
[U,S,V] = svd(X,'econ'); 
sig=diag(S);
energy1=sig(1)/sum(sig)
energy3=sum(sig(1:3))/sum(sig)

figure(1)
title('SVD Spectrum of Modes');
plot(sig,'ko','Linewidth',[1.5])
xlabel('Mode');
ylabel('Energy');
title('SVD Spectrum of Modes');

figure(2)
for j=1:3 % plot the first 3 eigenfaces
    subplot(1,3,j)
    imagesc(reshape(U(:,j),n,m)); colormap gray;
end

faces = vector;
testFace = faces(:,end-63); % last image out 
testFaceMS = testFace - avgFace;

figure(3)
ranks = [10,50,100,200,400,800,1000,2000];
subplot(3,3,1)
imagesc(reshape(testFaceMS,n,m)), colormap gray
title('original');
hold on
for jj = 1:8
    subplot(3,3,jj+1)
    r = ranks(jj);
    reconFace = avgFace + (U(:,1:r)*(U(:,1:r)'*testFaceMS));
    imagesc(reshape(reconFace,n,m)), colormap gray
    title(['r=',num2str(r,'%d')]);
end
