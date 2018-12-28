//
//  LAndRRequest.m
//  XFDNavTest
//
//  Created by lwk on 15/11/30.
//  Copyright © 2015年 lwk. All rights reserved.
//

#import "LAndRRequest.h"
#import "PPNetworkHelper.h"



@implementation LAndRRequest


- (void)startGetConnectionWithPath:(NSString *)path parameter:(NSDictionary *)parameter CaCha:(BOOL)isOne
{
//    //1.这个方法是用来进行转码的，即将汉字转码
//    path=[path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    //2.拼接字符串
//    NSMutableString *absoluteString = [[NSMutableString alloc] initWithFormat:@"https://lottery.hndnews.com/api/index%@",path];
//
//    //判断是否需要传参
//    if([parameter count]>0){
//        //用来保存遍历出来的参数
//        NSMutableArray *query = [[NSMutableArray alloc] init];
//        //枚举出字典中的key 和 值
//        [parameter enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//            NSString *parameterString = [[NSString alloc] initWithFormat:@"%@=%@",key,obj];
//            [query addObject:parameterString];
//        }];
//        //拼接参数到url后面 ？ &
//        [absoluteString appendFormat:@"?%@",[query componentsJoinedByString:@"&"]];
//    }
//    //3.继续转码
//    NSString *str=absoluteString;
//    str=[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//
//    //4.1开启日志打印
//    [PPNetworkHelper openLog];
//
//    __weak typeof(self) weakSelf = self;
//    //4.5 发送get请求
//    if (isOne) {
//        [PPNetworkHelper GET:str parameters:parameter responseCache:^(id responseCache) {
//            //4.2.1 缓存数据
//            NSLog(@"加载缓存");
//
//            NSLog(@"responseCache========%@",responseCache);
//            [weakSelf.delegate CaChaToRequest:self withData:responseCache];
//        } success:^(id responseObject) {
//            //4.2.2 请求成功
//            NSLog(@"有缓存请求成功");
//            [weakSelf.delegate successToRequest:self withData:responseObject];
//        } failure:^(NSError *error) {
//            //4.2.3 请求失败
//            NSLog(@"有缓存请求失败");
//            [weakSelf.delegate failToRequest:self withData:error];
//
//        }];
//    }else{
//        [PPNetworkHelper GET:str parameters:parameter success:^(id responseObject) {
//            //4.3.1 请求成功
//            NSLog(@"无缓存请求成功");
//            [weakSelf.delegate successToRequest:self withData:responseObject];
//        } failure:^(NSError *error) {
//            //4.3.2 请求失败
//            NSLog(@"无缓存请求失败");
//            [weakSelf.delegate failToRequest:self withData:error];
//        }];
//    }
}

- (void)startPostConnectionWithPath:(NSString *)path parameter:(NSDictionary *)parameter CaCha:(BOOL)isOne
{
    //1.这个方法是用来进行转码的，即将汉字转码
    path=[path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    NSMutableString *absoluteString = [[NSMutableString alloc] initWithFormat:@"http://gp.wejud.cn/app/iphone/%@",path];
    
    //3.继续转码    
    NSString *str=absoluteString;
    str=[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    /**
     设置网络请求参数的格式:默认为二进制格式
     PPRequestSerializerJSON(JSON格式),
     PPRequestSerializerHTTP(二进制格式)
     
     设置方式 : [PPNetworkHelper setRequestSerializer:PPRequestSerializerHTTP];
     */
    
    /**
     设置服务器响应数据格式:默认为JSON格式
     PPResponseSerializerJSON(JSON格式),
     PPResponseSerializerHTTP(二进制格式)
     
     设置方式 : [PPNetworkHelper setResponseSerializer:PPResponseSerializerJSON];
     */
    
    /**
     *  设置请求超时时间:默认为15.0fS
     *
     *  @param time 时长
     设置方式 : [PPNetworkHelper setRequestTimeoutInterval:15.0f];
     */
    //4.1开启日志打印
        [PPNetworkHelper openLog];
    /**
     设置请求头 : [PPNetworkHelper setValue:@"value" forHTTPHeaderField:@"header"];
     */
    [PPNetworkHelper setRequestTimeoutInterval:15.0f];
//    __weak typeof(self) weakSelf = self;
    
    NSLog(@"POST请求\n地址:%@\n参数:%@",str,parameter);
    
    //4.2 发送post请求
    if (isOne) {
        [PPNetworkHelper POST:str parameters:parameter responseCache:^(id responseCache) {
            //4.2.1 缓存数据
            NSLog(@"加载缓存");
    
            if (self.delegate && [self.delegate respondsToSelector:@selector(CaChaToRequest:withData:)]){
                [self.delegate CaChaToRequest:self withData:responseCache];
            }
        } success:^(id responseObject) {
            //4.2.2 请求成功
            NSLog(@"有缓存请求成功");

            if (self.delegate && [self.delegate respondsToSelector:@selector(successToRequest:withData:)]){
                [self.delegate successToRequest:self withData:responseObject];
            }
            
        } failure:^(NSError *error) {
            //4.2.3 请求失败
            NSLog(@"有缓存请求失败");
            
//            [MBProgressHUD showHUDMsg:@"服务器异常，请稍后再试"];
            if (self.delegate && [self.delegate respondsToSelector:@selector(failToRequest:withData:)]) {
                [self.delegate failToRequest:self withData:error];
            }
            
        }];
        
    }else{
        [PPNetworkHelper POST:str parameters:parameter success:^(id responseObject) {
            //4.3.1 请求成功
            NSLog(@"无缓存请求成功");
            //转化成json，上架的时候注销
//            NSData *data1=[NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
//            NSString *jsonStr=[[NSString alloc]initWithData:data1 encoding:NSUTF8StringEncoding];
//            NSLog(@"responseObject========%@",jsonStr);
             if (self.delegate && [self.delegate respondsToSelector:@selector(successToRequest:withData:)]) {
                 [self.delegate successToRequest:self withData:responseObject];
            }
        } failure:^(NSError *error) {
            //4.3.2 请求失败
            NSLog(@"无缓存请求失败========%@",error);
            
//            [MBProgressHUD showHUDMsg:@"请求超时"];
            if (self.delegate && [self.delegate respondsToSelector:@selector(failToRequest:withData:)]){
                [self.delegate failToRequest:self withData:error];
            }
        }];
    }
    
}


//取消所有网络请求
- (void)CancelRequests{
    [PPNetworkHelper cancelAllRequest];
}

//获取网络缓存的总大小 bytes(字节)
- (NSInteger)getAllHttpCacheSizes{
    NSInteger age = [PPNetworkCache getAllHttpCacheSize];
    return age;
}
//删除所有网络缓存
- (void)removeAllHttpsCache{
    [PPNetworkCache removeAllHttpCache];
}

@end
