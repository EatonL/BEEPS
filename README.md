引用原文作者的话描述本代码主要实现功能：

BEEPS. This ImageJ plugin smoothes an image without altering its edges. The smoothing is applied by the way of a bi-exponential filter, itself realized by a pair of one-tap recursions. It is therefore very fast; moreover, its computational cost is truly independent of the amount of smoothing. Meanwhile, the preservation of edges is obtained by a range filter akin to the range filter found in a bilateral filter。

---


## 核心数学原理：

![image](http://pco31cl5b.bkt.clouddn.com/18-8-15/1698578.jpg)

![image](http://pco31cl5b.bkt.clouddn.com/18-8-15/69898426.jpg)

![image](http://pco31cl5b.bkt.clouddn.com/18-8-15/35028065.jpg)

![image](http://pco31cl5b.bkt.clouddn.com/18-8-15/68613292.jpg)

其中 x 是图像输入， y 是图像输出。具体论文分析可见拙作：[https://blog.csdn.net/bazhidao0031/article/details/81450815](https://blog.csdn.net/bazhidao0031/article/details/81450815)。

---


## 效果图：

算法本身用于保边去噪，但高斯滤波器本身具有图片平滑效果，所以人脸磨皮效果更显著 (◕ܫ◕)

### 原图：
![image](http://pco31cl5b.bkt.clouddn.com/18-8-19/13902887.jpg)

### BEEPS:
![image](http://pco31cl5b.bkt.clouddn.com/18-8-19/27753609.jpg)

---

## 操作流程：
运行主文件 BEEPS.m --> 选取图片（如果找不到目标图片，记得改为所有文件）--> 根据图片效果优化参数

