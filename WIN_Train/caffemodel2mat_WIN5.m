clear all;close all;
addpath('/opt/caffe/matlab');

caffe.reset_all();
caffe.set_mode_gpu();
caffe.set_device(0);

numoflayer=5;
%% Setting

folder = '/opt/caffe/examples/WIN_Train/';
folder_model='/opt/caffe/examples/WIN_Train/';
model_prototxt = [folder 'NIDCN_mat_WIN5.prototxt'];
modelpath = [folder_model 'WIN5_N30.caffemodel'];
modelsave = [folder_model 'WIN5_N30.mat'];

net = caffe.Net(model_prototxt,modelpath,'test');

for ii = 1:numoflayer
  model.weight{ii} = net.layers(['conv',num2str(ii)]).params(1).get_data();
  model.bias{ii} = net.layers(['conv',num2str(ii)]).params(2).get_data();
end

save(modelsave,'model');
caffe.reset_all();
