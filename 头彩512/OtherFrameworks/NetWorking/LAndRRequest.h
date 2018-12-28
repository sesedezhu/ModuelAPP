//
//  LAndRRequest.h
//  XFDNavTest
//
//  Created by lwk on 15/11/30.
//  Copyright © 2015年 lwk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LAndRRequest;

//协议方法：通知视图控制器请求的结果
@protocol ZYHttpManagerDelegate <NSObject>


@optional
//缓存数据
- (void)CaChaToRequest:(LAndRRequest* )manager withData:(id)data;

//成功了
- (void)successToRequest:(LAndRRequest* )manager withData:(id)data;

//失败了
- (void)failToRequest:(LAndRRequest* )manager withData:(id)data;

@end

//负责发送请求的

@interface LAndRRequest : NSObject

@property(nonatomic,assign)id<ZYHttpManagerDelegate> delegate;
@property(nonatomic,assign)NSInteger tag;

//封装常用的方法（get和post请求）

//1.get请求方法

- (void)startGetConnectionWithPath:(NSString *)path parameter:(NSDictionary *)parameter CaCha:(BOOL)isOne;

//2.post请求方式

- (void)startPostConnectionWithPath:(NSString *)path parameter:(NSDictionary *)parameter CaCha:(BOOL)isOne;

//取消所有网络请求
- (void)CancelRequests;
//获取网络缓存的总大小 bytes(字节)
- (NSInteger)getAllHttpCacheSizes;
//删除所有网络缓存
- (void)removeAllHttpsCache;

@end
