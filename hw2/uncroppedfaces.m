clear all; close all; clc;
%Yale Faces 
%{
directory = dir('*.*');
for k=8:length(directory)
    data=imread(directory(k).name);
    %imshow(directory(k).name);
    data_re = reshape(data,size(data,1)*size(data,2),1);
    vector(:,k)= data_re;
end
vector = im2double(vector(:,5:end));
save('new_faces.mat','vector');
%}

load new_faces.mat; %uncropped faces as a matrix
faces = vector;
trainingFaces = faces(:,1:end-11); % We exclude last person for test
avgFace = mean(trainingFaces,2); % size n*m by 1;
% compute eigenfaces on mean-subtracted training data
X = trainingFaces-avgFace*ones(1,size(trainingFaces,2));

[U,S,V] = svd(X,'econ');
sig=diag(S);
energy1=sig(1)/sum(sig);
energy25=sum(sig(1:25))/sum(sig);

figure(1)
title('SVD Spectrum of Modes');
plot(sig,'ko','Linewidth',[1.5])
xlabel('Mode');
ylabel('Energy');
title('SVD Spectrum of Modes')

n = 320; m = 243;
testFace = faces(:,end-10); % leave last image out 
testFaceMS = testFace - avgFace;

%Plots
figure(2)

ranks = [10,50,100,150,152];
subplot(3,2,1)
imagesc(reshape(testFaceMS,n,m)), colormap gray
title('original');
hold on
for jj = 1:5
    subplot(3,2,jj+1)
    r = ranks(jj);
    reconFace = avgFace + (U(:,1:r)*(U(:,1:r)'*testFaceMS));
    imagesc(reshape(reconFace,n,m)), colormap gray
    title(['r=',num2str(r,'%d')]);
end