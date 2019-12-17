//
//  INXSCommandInfo.h
//  InnotechIMSDK
//
//  Created by jocer on 2019/4/29.
//  Copyright © 2019 jocer. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface INXSCommandInfo : NSObject

@property (nonatomic, strong) NSData *requestID;

@property (nonatomic, assign) int32_t cmd;

@property (nonatomic, assign) NSUInteger length;

@property (nonatomic, assign) BOOL isGzipped;

@property (nonatomic, copy, nullable) NSData *jsonData;

@property (nonatomic, copy, nullable) void(^sendProgressBlock)(float progress);

@property (nonatomic, copy, nullable) void(^receiveHandler)(INXSCommandInfo * _Nullable info);

@property (nonatomic, copy, nullable) void(^sendCompeletionBlock)(id _Nullable data, NSError * _Nullable aError) ;

@property (nonatomic, copy, nullable) void(^completion)(id _Nullable data, NSError * _Nullable aError);

@end

NS_ASSUME_NONNULL_END
