# WIN
## Learning Pixel-Distribution Prior with Wider Convolution for Image Denoising

### Abstract

We explore an innovative strategy for image denoising by using convolutional neural networks (CNN) to learn the similar pixel-distribution features from noisy images.   
Many types of image noise follow a certain pixel-distribution in common, such as additive white Gaussian noise (AWGN). By increasing CNN's width with larger reception fields and more channels in each layer, 
CNNs can reveal the ability to extract more accurate pixel-distribution features.  
The key to our approach is a discovery that wider CNNs with more convolutions tends to learn the similar pixel-distribution features, which reveals a new strategy to solve low-level vision problems effectively. The inference-mapping primarily relies on the priors behind the noise property instead of deeper CNNs with more stacked nonlinear layers. We evaluate our work: Wide inference Networks (WIN) on AWGN and demonstrate that by learning the pixel-distribution features from images, WIN-based network consistently achieves significantly better performance than current state-of-the-art deep CNN-based methods in both quantitative and visual evaluations. (Our paper is avaiable on: arXiv:1707.05414v2)

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

WIN can learn more pixel-distribution features from noisy images having higher level noise. This is the reason that WIN performs even better in higher-level noise.

We are claiming that WIN5 learns some similar pixel-distribution features and we call it as “Prior”, which gives much contribution for performance. When the noise level is higher, the pixel-distribution features are more similar. Thus, WIN can learn more pixel-distribution features from noisy images having higher level noise. This is the reason why WIN performs even better in higher-level noise.
 
Moreover, In the following Table, the WIN5-RB-B (blind denoising) is trained on more samples that are generated with data-augmentation skill. As one can see, the running time is much better than WIN5-RB-S without data-augmentation. This result indicates more training samples can help WINs learn more accurate similar features that can accelerate the inference.


### The process of denoising inference by sparse distribution statistics features:
![pixel-Inference](http://i.imgur.com/plrKXth.png)

We can consider BN as cache area in WINs. Learned priors are preserved in WINs as knowledge base for denoising inference. When WIN has more channels to preserve more data means and variances, various combinations of these feature maps can corporate with residual learning to infer the noise-free images more accurately. 

### Comparing training and test loss error during training between WIN7+BN and WIN10+BN:

WIN+BN cannot work without the input-to-output skip connection and is always over-fitting.

![WINBN](http://i.imgur.com/U7mbmSG.png)

In WIN5-RB's training, BN keeps the distribution of input data consistent and the skip connection
can not only introduce residual learning but also guide the network to extract the certain features in common: pixel-distribution. 
Without the input data as a comparison, BN could bring negative effects as keeping the each input distribution same, especially, when a task is to output pixel-level feature map. In DnCNN, two BN layers are removed from the first and last layers,
by which a certain degree of the BN's negative effects can be reduced.
Meantime DnCNN also highlights network's generalization ability largely
relies on the depth of networks. 

-----------------------------------------------------------------
### Results:
-----------------------------------------------------------------
![TESTBSD200](http://imgur.com/iKnZLSz.png)

WIN infers noise-free images based on the learned pixel-distribution features. When the noise level is higher, the pixel-distribution features are more similar. Thus, WIN can learn more pixel-distribution features from noisy images having higher level noise. This is the reason why WIN performs even better in higher-level noise.
 
Moreover, the WIN5-RB-B is trained on more samples that are generated with data-augmentation skill. As one can see, the running time is much better than WIN5-RB-S without data-augmentation. This result indicates more training samples can help WINs learn more accurate similar features that can accelerate the inference.

**Behavior at different noise levels of average PSNR on BSD200-test**

![Behavior](http://imgur.com/QnzseRi.png) 

As the noise level is increasing, the performance gain of WIN5-RB-B is getting larger, while the performance gain of DnCNN comparing to BM3D is not changing much as the noise level is changing. Compared with WINs, DnCNN is composed of even more layers embedded with BN. This observation indicates that the performance gain achieved by WIN5-RB does not mostly come from BN's regularization effect but the pixel-distribution features learned and relevant priors such as means and variances reserved in WINs. Both Larger kernels and more channels can promote CNNs more likely to learn pixel-distribution features. 
 
**First image from Set12-test with noise level=10**
![First image from Set12-test with noise level=10](http://i.imgur.com/4WkiKXI.png)

**Second image from BSD200-test with noise level=10**
![Second image from BSD200-test with noise level=10](http://imgur.com/kRH8oFx.png)

**I.Comparing 7x7 filter-size WINs with 13x13 filter-size WINs for noise level=30**
![1Comparing 7x7 filter-size WINs with 13x13 level=30](http://i.imgur.com/D7OjoKw.png)

As we can see, Increasing filter size can further improve performance.

**II.Comparing 7x7 filter-size WINs with 13x13 filter-size WINs for noise level=30**
![2Comparing 7x7 filter-size WINs with 13x13 level=30](http://i.imgur.com/p1qPVuI.png)

As we can see, Increasing filter size can further improve performance.

**III.Comparing 7x7 filter-size WINs with 13x13 filter-size WINs for noise level=30**
![3Comparing 7x7 filter-size WINs with 13x13 level=30](http://i.imgur.com/legwbim.png)


