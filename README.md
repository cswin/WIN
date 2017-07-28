# WIN
## Learning Pixel-Distribution Prior with Wider Convolution for Image Denoising
-----------------------------------------------------------------
### Main Contents:
-----------------------------------------------------------------
**WIN_Train**: training demo for Gaussian denoising.

**demos**:  Demo_test_WIN-.m.

**model**: including the trained models for Gaussian denoising 

**testsets**: BSD200 and Set12 for Gaussian denoising evaluation

To run the testing demos `Demo_test_WIN-.m`, you should first [install](http://www.vlfeat.org/matconvnet/install/) [MatConvNet](http://www.vlfeat.org/matconvnet/).

### Pixel-Distribution:
**Compare the pixel-distributions at different noise levels**
![pixel-distributions10](http://i.imgur.com/mojqbIU.png)

![pixel-distributions50](http://i.imgur.com/Sd2cJhn.png)

### Inference noise by Pixel-distribution features :
![pixel-Inference](http://i.imgur.com/0tYYXVZ.png)

### Results:
-----------------------------------------------------------------
![TESTBSD200](http://imgur.com/iKnZLSz.png)

**Behavior at different noise levels of average PSNR on BSD200-test**

![Behavior](http://i.imgur.com/GL3H5Xi.png)

**First image from Set12-test with noise level=10**
![First image from Set12-test with noise level=10](http://i.imgur.com/4WkiKXI.png)

**Second image from BSD200-test with noise level=10**
![Second image from BSD200-test with noise level=10](http://imgur.com/kRH8oFx.png)

**One image from Set12-test with noise level=30**
![One image from Set12-test with noise level=30](http://imgur.com/tGEN7nb.png)

**One image from BSD200-test with noise level=50**
![One image from BSD200-test with noise level=50](http://imgur.com/tNmA0ir.png)

**One image from BSD200-test with noise level=70**
![One image from BSD200-test with noise level=70](http://imgur.com/97yDMoz.png)




