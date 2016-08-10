//
//  Card.h
//  GVTraining02
//
//  Created by Cassiano Monteiro on 03/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <Foundation/Foundation.h>

// Protocolo <NSCopying> permite copiar o objeto em uma nova instância de memória
@interface Card : NSObject <NSCopying>

@property (nonatomic, strong) NSString *contents;

- (NSUInteger)matchCard:(Card *)card;
- (NSUInteger)matchCards:(NSArray<Card *> *)cards;

@end
