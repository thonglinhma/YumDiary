//
//  YDCache.h
//  YumDiary
//
//  Created by TRAN LE ANH MY on 13/11/12.
//  Copyright (c) 2012 Open AtoZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDCache : NSObject

+ (id)sharedCache;

- (void)clear;

@end
