//
//  Model.h
//  Ex1_1_1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property NSMutableArray *data;

-(void)addProduct:(id)product;

-(void)removeProductAt:(int)index;

-(id)productAt:(int)productId;

-(int)numberOfProduct;

+(Model *)sharedModel;

@end
