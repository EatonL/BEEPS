引用原文作者的话描述本代码主要实现功能：

BEEPS. This ImageJ plugin smoothes an image without altering its edges. The smoothing is applied by the way of a bi-exponential filter, itself realized by a pair of one-tap recursions. It is therefore very fast; moreover, its computational cost is truly independent of the amount of smoothing. Meanwhile, the preservation of edges is obtained by a range filter akin to the range filter found in a bilateral filter。

---


## 核心数学原理：

![image](https://img-blog.csdnimg.cn/20190114190746976.jpg)

![image](https://img-blog.csdnimg.cn/20190114190843467.jpg)

![image](https://img-blog.csdnimg.cn/20190114175645938.jpg)

![image](https://img-blog.csdnimg.cn/20190114191530889.jpg)

其中 x 是图像输入， y 是图像输出。具体论文分析可见拙作：[https://blog.csdn.net/bazhidao0031/article/details/81450815](https://blog.csdn.net/bazhidao0031/article/details/81450815)。

---


## 效果图：

算法本身用于保边去噪，但高斯滤波器本身具有图片平滑效果，所以人脸磨皮效果更显著 (◕ܫ◕)

### 原图：
![image](https://img-blog.csdnimg.cn/20190114191153645.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2JhemhpZGFvMDAzMQ==,size_16,color_FFFFFF,t_70)

### BEEPS:
![image](https://img-blog.csdnimg.cn/2019011419123665.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2JhemhpZGFvMDAzMQ==,size_16,color_FFFFFF,t_70)

---

## 操作流程：
运行主文件 BEEPS.m --> 选取图片（如果找不到目标图片，记得改为所有文件）--> 根据图片效果优化参数

