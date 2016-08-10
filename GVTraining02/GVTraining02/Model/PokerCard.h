//
//  PokerCard.h
//  GVTraining02
//
//  Created by Cassiano Monteiro on 03/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "Card.h"

// PokerCard herda de Card
@interface PokerCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic, assign) NSUInteger rank;

// Estes são métodos estáticos.
+ (NSArray<NSString *> *)validRanks;
+ (NSArray<NSString *> *)validSuits;

@end
