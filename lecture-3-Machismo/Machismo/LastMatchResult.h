//
//  LastMatchResult.h
//  Machismo
//
//  Created by Saad Patail on 3/31/16.
//  Copyright © 2016 Saad Patail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LastMatchResult : NSObject

@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, getter=isPenalty) BOOL penalty;
@property (nonatomic) NSInteger score;

- (NSString *)contents;
- (void)clear;

@end
