//
//  PokerCard.m
//  GVTraining02
//
//  Created by Cassiano Monteiro on 03/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "PokerCard.h"

@implementation PokerCard

+ (NSArray<NSString *> *)validRanks
{
    return @[@"?",
             @"A",
             @"2",
             @"3",
             @"4",
             @"5",
             @"6",
             @"7",
             @"8",
             @"9",
             @"10",
             @"J",
             @"Q",
             @"K"];
}

+ (NSArray<NSString *> *)validSuits
{
    // É possível inserir qualquer caractere Unicode no código.
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}

// Override da classe Card
- (NSString *)contents
{
    return [NSString stringWithFormat:@"%@%@",
            [PokerCard validRanks][self.rank], self.suit];
}

// Setter explícito para validar rank
- (void)setRank:(NSUInteger)rank
{
    if (rank < [PokerCard validRanks].count) {
        _rank = rank;
    }
}

// Setter explícito para validar suit
- (void)setSuit:(NSString *)suit
{
    if ([[PokerCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}


@end
