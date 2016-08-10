//
//  Card.h
//  GVTraining02
//
//  Created by Cassiano Monteiro on 03/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic, strong) NSString *contents;

- (NSUInteger)matchCard:(Card *)card;
- (NSUInteger)matchCards:(NSArray<Card *> *)cards;

@end
