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

-----------------------------------------------------------------

### Prior: Pixel-Distribution:
**Compare the pixel-distributions at different noise levels**
![pixel-distributions10](http://i.imgur.com/mojqbIU.png)

![pixel-distributions50](http://i.imgur.com/Sd2cJhn.png)

### The process of denoising inference by sparse distribution statistics features:
![pixel-Inference](http://i.imgur.com/plrKXth.png)
 
### Comparing training and test loss error during training between WIN7+BN and WIN10+BN:

In WINs, BN cannot work without the input-to-output skip connection and is always over-fitting.

![WINBN](http://i.imgur.com/U7mbmSG.png)

-----------------------------------------------------------------
### Results:
-----------------------------------------------------------------
![TESTBSD200](http://imgur.com/iKnZLSz.png)

**Behavior at different noise levels of average PSNR on BSD200-test**

![Behavior](http://i.imgur.com/GL3H5Xi.png) 

As the noise level is increasing, the performance gain of WIN5-RB-B is getting larger, while the performance gain of DnCNN comparing to BM3D is not changing much as the noise level is changing. Compared with WINs, DnCNN is composed of even more layers embedded with BN. This observation indicates that the performance gain achieved by WIN5-RB does not mostly come from BN's regularization effect but the pixel-distribution features learned and relevant priors such as means and variances reserved in WINs. Both Larger kernels and more channels can promote CNNs more likely to learn pixel-distribution features. 
 

**First image from Set12-test with noise level=10**
![First image from Set12-test with noise level=10](http://i.imgur.com/4WkiKXI.png)

**Second image from BSD200-test with noise level=10**
![Second image from BSD200-test with noise level=10](http://imgur.com/kRH8oFx.png)

**I.Comparing 7x7 filter-size WINs with 13x13 filter-size WINs for noise level=30**
![1Comparing 7x7 filter-size WINs with 13x13 level=30](http://i.imgur.com/D7OjoKw.png)

**II.Comparing 7x7 filter-size WINs with 13x13 filter-size WINs for noise level=30****
![2Comparing 7x7 filter-size WINs with 13x13 level=30](http://i.imgur.com/p1qPVuI.png)




