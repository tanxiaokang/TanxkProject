#  LLDB 

## 介绍
    是 Xcode 中自带的一个调试工具，在开发的过程中使用好了这个调试工具，不仅是能力的一种提升，更是一种装逼的 神器。

## 如何进入 LLDB

    通常当程序 crash 或者有断点的时候，会自动的变成 LLDB 模式。也可以手动 处理，直接点击这里：
   
   (https://upload-images.jianshu.io/upload_images/1198135-f00b5bc24a8f979a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000)
   
   
## 实战
~~~
e id $ghView = (id)0x7fa47ae09ff0
e (void)[$ghView setBackgroundColor:[UIColor redColor]]
e (void)[CATransaction flush]
po 0x7fa47ae09ff0
~~~
    
    
    
参考文章:https://www.jianshu.com/p/17600324656a
    
    


