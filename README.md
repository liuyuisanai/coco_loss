# COCO loss for person recognition

Codebase for Learning Deep Features via Congenerous Cosine Loss for Person Recognition, [[arXiv]](https://arxiv.org/abs/1702.06890)

This repo contains the network model files in the `prototxt` folder. We use the newly proposed [PIPA](https://people.eecs.berkeley.edu/~nzhang/piper.html) dataset for evaluation; it is a large-scale dataset for person recognition.

The proposed COCO loss layer (known as `center_projection_layer.cu` [here](https://github.com/sciencefans/CaffeMex_v2/blob/master/src/caffe/layers/center_projection_layer.cu)) and the normalized layer ([here](https://github.com/sciencefans/CaffeMex_v2/blob/master/src/caffe/layers/normalize_layer.cu)) are also provided. The gradient derivation in the initial release (v1) on arXiv is **wrong**; please resort to v2 (latest version): Eqn.(8) in v2 paper corresponds to the implementation around lines [here](https://github.com/sciencefans/CaffeMex_v2/blob/master/src/caffe/layers/normalize_layer.cpp#L55).

## Q&A

Here we list some commonly asked questions we received from the public. Thanks for your engagement to make our work matter!

- *Relationship of person recognition task with face recognition, person Re-ID.*


- *Training curve does not increase. Any tricks to make COCO work?*

	Hah, good question.


## Citation
Please kindly cite our work in your publications if it helps your research:

    @article{liu_2017_coco,
      Author = {Liu, Yu and Li, Hongyang and Wang, Xiaogang},
      Title = {Learning Deep Features via Congenerous Cosine Loss for Person Recognition},
	  Journal = {arXiv preprint: 1702.06890},
	  Year = {2017}
    }
