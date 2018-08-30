//
//  Network.m
//  AwesomeInstalment
//
//  Created by VierGhost on 16/10/14.
//  Copyright © 2016年 润农科技. All rights reserved.
//

#import "Network.h"
#import <AFNetworking.h>

static NSString *const kCookie = @"cookie";

static CGFloat const timeoutTime = 15.0f;
//static CGFloat const kSeconds = 15.0f;

@implementation Network {
    Network *response;
    NSHTTPURLResponse *myTask;
}

+ (Network *)sharedJsonRequest {
    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (NSString *)network_ObtionURL:(NSString *)url {
    return url;
}

+ (BOOL)link:(NSString *)url parameters:(NSDictionary *)params outOfTime:(float)outTime callback:(void (^)(Network *))callback {
    Network *request = [self sharedJsonRequest];
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD showWithStatus:@"加载中..."];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    });
    url = [self network_ObtionURL:url];
    
    return [request _link:url parameters:params outOfTime:outTime callback:callback showAlert:YES];
}

#pragma mark - 图片
+ (BOOL)link:(NSString*)url parameters:(NSDictionary *)params imgParameters:(NSArray *)imgParameters fileNames:(NSArray *)fileNames materialtype:(NSInteger)materialtype outOfTime:(float)outTime callback:(REQUEST_CALLBACK)callback
{
    Network *request = [self sharedJsonRequest];
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD showWithStatus:@"加载中..."];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    });
    url = [self network_ObtionURL:url];
    return [request _link:url parameters:params imgParameters:imgParameters fileNames:fileNames materialtype:materialtype outOfTime:outTime callback:callback showAlert:YES];
}

+ (BOOL)linkWithoutLoadingAnimation:(NSString *)url parameters:(NSDictionary *)params outOfTime:(float)outTime callback:(void (^)(Network *))callback {
    Network *request = [self sharedJsonRequest];
    url = [self network_ObtionURL:url];
    return [request _link:url parameters:params outOfTime:outTime callback:callback showAlert:NO];
}

#pragma mark - GET、POST 请求
- (BOOL)_link:(NSString*)url parameters:(NSDictionary *)params outOfTime:(float)outTime callback:(REQUEST_CALLBACK)callback showAlert:(BOOL)showAl {
    
    url = [Network network_ObtionURL:url];
    AFHTTPSessionManager *manager = [self managerWithOutime:outTime];
    if (![url containsString:@""]) {
        [manager setSecurityPolicy:[self customSecurityPolicy:YES]];
    } else {
        [manager setSecurityPolicy:[self customSecurityPolicy:NO]];
    }
    
    [self beforeLink:manager];
    
    if (params) {
        [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            self->myTask = (NSHTTPURLResponse *)task.response;
            [self configResponseWithTask:self->myTask responseObject:responseObject error:nil];
            
            if(callback != nil) {
                callback(self->response);
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            self->myTask = (NSHTTPURLResponse *)task.response;
            [self configResponseWithTask:self->myTask responseObject:nil error:error];
            if (showAl) [self afterLink:self->response];
            
            if(callback != nil) {
                callback(self->response);
                
                NSLog(@"%@", error);
                NSData *d = error.userInfo[@"com.alamofire.serialization.response.error.data"];
                NSString *aString = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
                
                NSLog(@"%@", aString);

            }
        }];
    } else {
        
        [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            self->myTask = (NSHTTPURLResponse *)task.response;
            [self configResponseWithTask:self->myTask responseObject:responseObject error:nil];
            
            if(callback != nil) {
                callback(self->response);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            self->myTask = (NSHTTPURLResponse *)task.response;
            [self configResponseWithTask:self->myTask responseObject:nil error:error];
            if (showAl) [self afterLink:self->response];
            
            if(callback != nil) {
                callback(self->response);
            }
        }];
    }
    return YES;
}

#pragma mark - 图片
#pragma mark - GET、POST 请求
- (BOOL)_link:(NSString*)url parameters:(NSDictionary *)params imgParameters:(NSArray *)imgParameters fileNames:(NSArray *)fileNames materialtype:(NSInteger)materialtype outOfTime:(float)outTime callback:(REQUEST_CALLBACK)callback showAlert:(BOOL)showAl {
    
    url = [Network network_ObtionURL:url];

    AFHTTPSessionManager *manager = [self managerWithOutime:timeoutTime];
    
    if (materialtype != 100) {  // 不是人脸识别
#warning https使用
        if (![url containsString:@""]) {
            [manager setSecurityPolicy:[self customSecurityPolicy:YES]];
        }else {
            [manager setSecurityPolicy:[self customSecurityPolicy:NO]];
        }
        
    }
    
    [self beforeLink:manager];
    
    if (params) {
        [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
        //上传的参数(上传图片，以文件流的格式)
//        NSData *data1 = imgParameters[0];
//        NSData *data2 = imgParameters[1];
            
            for (int i = 1; i <= imgParameters.count; i++) {
                NSData *data1 = imgParameters[i - 1];
                
                NSString *s = fileNames[i - 1];
                
                [formData appendPartWithFileData:data1 name:[NSString stringWithFormat:@"%@",s] fileName:[NSString stringWithFormat:@"%@.png",s] mimeType:@"image/png"];
            }
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            self->myTask = (NSHTTPURLResponse *)task.response;
            [self configResponseWithTask:self->myTask responseObject:responseObject error:nil];
            
                        
            if(callback != nil) {
                callback(self->response);
            }

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            self->myTask = (NSHTTPURLResponse *)task.response;
            [self configResponseWithTask:self->myTask responseObject:nil error:error];
            
            BOOL x = 1;
            if(callback != nil) {
                callback(self->response);
                NSLog(@"%@", error);
                NSData *d = error.userInfo[@"com.alamofire.serialization.response.error.data"];
                NSString *aString = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];

                NSLog(@"++++%@", aString);
                
                NSData *jsonData = [aString dataUsingEncoding:NSUTF8StringEncoding];
                NSError *err;
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:&err];
                if(err)
                {
                    NSLog(@"json解析失败：%@",err);
                } else {
                
                    if ([dic[@"error_message"] isEqualToString:@"NO_FACE_FOUND: image_ref1"]) {
                        [self alertErrorMessage:@"身份证未识别出人脸，请在光线好的地方识别身份证"];
                        x = 0;
                    }
                }
            }
            
            
            if (x) {
                if (showAl) [self afterLink:self->response];
            }

        }];
        
    } else {
        
        [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            self->myTask = (NSHTTPURLResponse *)task.response;
            [self configResponseWithTask:self->myTask responseObject:responseObject error:nil];
            
            if(callback != nil) {
                callback(self->response);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            self->myTask = (NSHTTPURLResponse *)task.response;
            [self configResponseWithTask:self->myTask responseObject:nil error:error];
            if (showAl) [self afterLink:self->response];
            
            if(callback != nil) {
                callback(self->response);
            }
        }];
    }
    return YES;
}

- (AFHTTPSessionManager *)managerWithOutime:(NSTimeInterval)outTime {
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    config.timeoutIntervalForResource = outTime == 0.f ? timeoutTime : outTime;
    config.HTTPShouldUsePipelining = true;
#warning kToken
    //        if ([sharBaseTool decrypt:kToken]) {
    //            config.HTTPAdditionalHeaders = @{@"token":[sharBaseTool decrypt:kToken]};
    //        }
    
    #warning BaseURL
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@""] sessionConfiguration:config];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", @"text/xml", nil];
    
    return manager;
}

- (void)configResponseWithTask:(NSHTTPURLResponse *)task
                responseObject:(id)responseObject
                         error:(NSError *)error {
    
    response = [[Network alloc] init];
    response.status = task.statusCode;
    response.dataDic = responseObject;
    
    if (error) {
        response.header = nil;
        response.responCode = 0;
    } else {
        response.header = [task allHeaderFields];
        response.responCode = [response.dataDic[@"code"] intValue];
        response.message = response.dataDic[@"message"]?: @"请求失败...";
    }
    response.error = error;
    
    [SVProgressHUD dismiss];
}

- (void)beforeLink:(AFHTTPSessionManager *)manager {
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [SVProgressHUD dismiss];
                [operationQueue setSuspended:YES];
                [self alertErrorMessage:@"网络不好，换个网络试试吧"];

                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
}

- (BOOL)afterLink:(Network *)myResponse {
    
    if (myResponse.status == 500) {
        [self alertErrorMessage:@"连接错误，请稍后尝试"];
        return TRUE;
    }
    
    if (myResponse.status == 401) {
        
        return TRUE;
    }
    
    if (myResponse.error == nil) {
        return TRUE;
    }
    
    if ([myResponse.error code] == NSURLErrorNotConnectedToInternet) {
        [self alertErrorMessage:@"网络不好，换个网络试试吧"];
        return FALSE;
    }
    
    [self alertErrorMessage:@"请求失败，请稍后再试"];
    
    return true;
}

- (void)alertErrorMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}


/** 拼接请求地址，便于追寻请求错误 */
- (NSString *)configHttpURLStringWithURLStr:(NSString *)urlStr parameters:(NSDictionary *)parameters {
    __block NSString *newURLStr = urlStr;
    
    newURLStr = [newURLStr hasSuffix:@"?"] ? newURLStr : [newURLStr stringByAppendingString:@"?"];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        newURLStr = [newURLStr stringByAppendingFormat:@"&%@=%@", key, obj];
    }];
    if (newURLStr.length > 0) {
        newURLStr = [newURLStr stringByReplacingOccurrencesOfString:@"?&" withString:@"?"];
    }
    if ([newURLStr hasSuffix:@"?"] || [newURLStr hasSuffix:@"&"]) {
        newURLStr = [newURLStr substringToIndex:newURLStr.length - 1];
    }
    return newURLStr;
}


#pragma mark - 图片
- (void)startWithCompletionBlockWithSuccess:(NetworkRequestCompletionBlock)success
                                    failure:(NetworkRequestCompletionBlock)failure {
    [self setCompletionBlockWithSuccess:success failure:failure];
    [self start];
}

- (void)setCompletionBlockWithSuccess:(NetworkRequestCompletionBlock)success
                              failure:(NetworkRequestCompletionBlock)failure {
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
}

- (void)start {
    
}

- (void)requestWithUrl:(NSString *)url

      withPostedImages:(NSArray *)imagesArray

      WithSuccessBlock:(void (^)(NSArray * resultArray))successBlock

           WithNeebHub:(BOOL)needHub


              WithData:(NSDictionary *)dataDic

{
    url = [Network network_ObtionURL:url];
    
    if (imagesArray.count > 0) {
        
        
        
        //创建一个临时的数组，用来存储回调回来的结果
        
        NSMutableArray *temArray = [NSMutableArray array];
        
        
        
        for (int i = 0;  i < imagesArray.count; i++) {
            
            UIImage *imageObj = imagesArray[i];
            
            //截取图片
            
            NSData *imageData = UIImageJPEGRepresentation(imageObj, 0.5);
            
            
            
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            
            
            
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            
            
            
            // 访问路径
            
            [manager POST:url parameters:dataDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                
                
                
                // 上传文件
                
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                
                formatter.dateFormat = @"yyyyMMddHHmmss";
                
                NSString *str = [formatter stringFromDate:[NSDate date]];
                
                NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
                
                
                
                [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/png"];
                
                
                
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                
                
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
//                [self collectionResponseWithDataTask:task params:dataDic responseObject:responseObject];
//
//                [self log:url Params:dataDic Response:responseObject];
                
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
                
                
                
                [temArray addObject:dic];
                
                
                
                //当所有图片上传成功后再将结果进行回调
                
                if (temArray.count == imagesArray.count) {
                    
                    successBlock(temArray);
                    
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                [self collectionResponseWithDataTask:task params:dataDic responseObject:nil];
//
//                [self log:url Params:dataDic Response:error];
                
                
            }];
            
        }
        
    }
    
    
    ///
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer.timeoutInterval = 20;
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
//    
//    [manager POST:url parameters:newLowKeyDic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        
//        //利用for循环上传多张图片
//        int i = 1;
//        for (UIImage * image in self.photoselectVC.images) {
//            //把图片转换为二进制流
//            NSData *imageData = UIImagePNGRepresentation(image);
//            //按照表单格式把二进制文件写入formData表单
//            [formData appendPartWithFileData:imageData name:@"upLoad" fileName:[NSString stringWithFormat:@"%d.png", i] mimeType:@"image/png"];
//            
//            i++;
//            
//        }
//        
//    } success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"发送成功");
//        
//        NSLog(@"responseObject == %@", responseObject);
//        
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        NSLog(@"发送失败");
//    }];
    
}

#pragma mark - 获取证书data
-(NSData *)cerDataMethod:(NSString *)str proData:(NSData *)proData{
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:str ofType:@"cer"];//证书的路径
    proData = [NSData dataWithContentsOfFile:cerPath];
    
    if ([str isEqualToString:@"zzd"]) {
        self.certData = proData;
    } else {
        self.certData_CertificationCenter = proData;
    }
    
    return proData;
}

#pragma mark - 验证证书
- (AFSecurityPolicy*)customSecurityPolicy:(BOOL)b
{
    // /先导入证书
    NSData *certificationData = (b ? (self.certData ? self.certData : [self cerDataMethod:@"zzd" proData:self.certData]) : (self.certData_CertificationCenter ? self.certData_CertificationCenter : [self cerDataMethod:@"runnongjinfu" proData:self.certData_CertificationCenter]));

    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    NSSet *set = [[NSSet alloc] initWithObjects:certificationData, nil];
    
    //    securityPolicy.pinnedCertificates = @[certData];
    securityPolicy.pinnedCertificates = set;
    
    return securityPolicy;
}

@end
