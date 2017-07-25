function im_h_y = NIDCN_SWR(im_l_y,model)
 
 weight = model.weight;
 bias = model.bias;
 
 
layer_num = size(weight,2);


im_y = single(im_l_y);

%disp(size(im_y)); 

convfea = vl_nnconv(im_y,weight{1},bias{1},'Pad',3);
convfea = vl_nnrelu(convfea);

%disp(size(convfea));

convfea = vl_nnconv(convfea,weight{2},bias{2},'Pad',3);
convfea = vl_nnrelu(convfea);

%disp(size(convfea));
 
        
         
convfea = vl_nnconv(convfea,weight{3},bias{3},'Pad',3);
convfea = vl_nnrelu(convfea);

%disp(size(convfea));

convfea = vl_nnconv(convfea,weight{4},bias{4},'Pad',3);
convfea = vl_nnrelu(convfea);

%disp(size(convfea));
 
convfea = vl_nnconv(convfea,weight{layer_num},bias{layer_num},'Pad',3);
%disp(size(convfea));

 
 
im_h_y = convfea + im_y;
     
 %disp(size(im_h_y)); 
    
end
