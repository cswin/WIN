%Because WIN with wider and more filters tends to learn the 
%the features relevent to the majority data size, we 
%keep the size consistency between the test and training data; 
function [input_resize,isConsis]=Consistency(input)
 %the majority data size in training 
 sizeTrain_W=481;
 sizeTrain_H=321;
 isConsis=1;
 [H,W,Z]=size(input);
 if (H~=sizeTrain_H && W~=sizeTrain_W) 
   if (H~=sizeTrain_W && W~=sizeTrain_H)
      input=imresize(input,[sizeTrain_H sizeTrain_W]);
      isConsis=0;
   end
 end
  input_resize=input;
end
