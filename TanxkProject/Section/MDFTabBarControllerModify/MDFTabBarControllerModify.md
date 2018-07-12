
# MDFTabBarController 组件使用方法

#### 
    1. 定义一个类，实现MDFTweakValue() 宏，具体用法参考 MDFTweakConfig+config
    2. 在APPDelegate设置 
        ~
        UITabBarController *tvc = [[MDFTabBarController alloc] init];
        self.window = [[FBTweakShakeWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = tvc;
        [self.window makeKeyAndVisible];
        ~

