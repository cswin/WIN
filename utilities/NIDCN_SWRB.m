function im_h_y = NIDCN_SWRB(im_l_y,model)
% 
 
 weight = model.weight;
 bias = model.bias;
 
 bnmean= model.bnmean;
 bnvariance=model.bnvariance;
 bnscale=model.bnscale ;
 scaleG=model.scaleG ;
 scaleB=model.scaleB ;
 eps=1e-5;

layer_num = size(weight,2);

im_y = single(im_l_y);

%disp(size(im_y)); 

convfea = vl_nnconv(im_y,weight{1},bias{1},'Pad',3);

bnme=repmat(reshape(bnmean{1},1,1,size(bnmean{1},1)),size(convfea,1),size(convfea,2));
scaG=repmat(reshape(scaleG{1},1,1,size(scaleG{1},1)),size(convfea,1),size(convfea,2));
std=repmat(reshape(sqrt(bnvariance{1}/bnscale{1} + eps),1,1,size(convfea,3)),size(convfea,1),size(convfea,2));
scaB=repmat(reshape(scaleB{1},1,1,size(scaleB{1},1)),size(convfea,1),size(convfea,2));
x=convfea-bnme / bnscale{1};
for i = size(bnmean{1},1):-1:1
    y(:,:,i) = scaG(:,:,i).* x(:,:,i) ./ std(:,:,i) +scaB(:,:,i);
end
 

convfea = vl_nnrelu(y);

%disp(size(convfea));

convfea = vl_nnconv(convfea,weight{2},bias{2},'Pad',3);

bnme=repmat(reshape(bnmean{2},1,1,size(bnmean{2},1)),size(convfea,1),size(convfea,2));
scaG=repmat(reshape(scaleG{2},1,1,size(scaleG{2},1)),size(convfea,1),size(convfea,2));
std=repmat(reshape(sqrt(bnvariance{2}/bnscale{2} + eps),1,1,size(convfea,3)),size(convfea,1),size(convfea,2));
scaB=repmat(reshape(scaleB{2},1,1,size(scaleB{2},1)),size(convfea,1),size(convfea,2));
x=convfea-bnme / bnscale{2};
for i = size(bnmean{2},1):-1:1
    y(:,:,i) = scaG(:,:,i).* x(:,:,i) ./ std(:,:,i) + scaB(:,:,i);
end
 

convfea = vl_nnrelu(y);
        
         
convfea = vl_nnconv(convfea,weight{3},bias{3},'Pad',3);

bnme=repmat(reshape(bnmean{3},1,1,size(bnmean{3},1)),size(convfea,1),size(convfea,2));
scaG=repmat(reshape(scaleG{3},1,1,size(scaleG{3},1)),size(convfea,1),size(convfea,2));
std=repmat(reshape(sqrt(bnvariance{3}/bnscale{3} + eps),1,1,size(convfea,3)),size(convfea,1),size(convfea,2));
scaB=repmat(reshape(scaleB{3},1,1,size(scaleB{3},1)),size(convfea,1),size(convfea,2));
x=convfea-bnme / bnscale{3};
for i = size(bnmean{3},1):-1:1
    y(:,:,i) = scaG(:,:,i).* x(:,:,i) ./ std(:,:,i) +scaB(:,:,i);
end
 

convfea = vl_nnrelu(y);


convfea = vl_nnconv(convfea,weight{4},bias{4},'Pad',3);

bnme=repmat(reshape(bnmean{4},1,1,size(bnmean{4},1)),size(convfea,1),size(convfea,2));
scaG=repmat(reshape(scaleG{4},1,1,size(scaleG{4},1)),size(convfea,1),size(convfea,2));
std=repmat(reshape(sqrt(bnvariance{4}/bnscale{4} + eps),1,1,size(convfea,3)),size(convfea,1),size(convfea,2));
scaB=repmat(reshape(scaleB{4},1,1,size(scaleB{4},1)),size(convfea,1),size(convfea,2));
x=convfea-bnme / bnscale{4};
for i = size(bnmean{4},1):-1:1
    y(:,:,i) = scaG(:,:,i).* x(:,:,i) ./ std(:,:,i) +scaB(:,:,i);
end
 

convfea = vl_nnrelu(y);
 
convfea = vl_nnconv(convfea,weight{layer_num},bias{layer_num},'Pad',3);

y = scaleG{layer_num}*(convfea-bnmean{layer_num}/bnscale{layer_num}) ...
    / sqrt(bnvariance{layer_num}/bnscale{layer_num} + eps)  + scaleB{layer_num};

 
im_h_y = y + im_y;
     
end
