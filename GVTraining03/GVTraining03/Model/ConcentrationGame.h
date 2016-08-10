//
//  ConcentrationGame.h
//  GVTraining03
//
//  Created by Cassiano Monteiro on 10/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

// Protocolos em Objective-C são como interfaces em Java. São definidos métodos a serem implementados
// por uma classe que queira atender ao protocolo.
// Podem ser definidos também propriedades e coisas opcionais.
//
// O padrão "delegate" é muito utilizado nas APIs da Apple, e é implementado seguindo o Design Pattern "Strategy".
@protocol ConcentrationGameDelegate <NSObject>
- (void)showCard:(Card *)card;
- (void)hideCard:(Card *)card;
- (void)showScore:(NSNumber *)score;
@end

@interface ConcentrationGame : NSObject

// Esta declaração diz que o delegate deve implementar o protocolo definido, porém pode ser qualquer classe (por isso é do tipo "id")
@property (nonatomic, weak) id<ConcentrationGameDelegate> delegate;

// O qualificador "__unavailable" impede de que este construtor padrão seja utilizado,
// obrigando a utilizar o outro construtor.
- (instancetype)init __unavailable;

// O qualificador "NS_DESIGNATED_INITIALIZER" diz que é um construtor que pode ser usado como padrão.
- (instancetype)initWithCardsCount:(NSUInteger)cardsCount usingDeck:(Deck *)deck NS_DESIGNATED_INITIALIZER;

- (void)pickCard:(Card *)card;
- (BOOL)shouldPickCard:(Card *)card;
- (Card *)cardAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfCard:(Card *)card;

@end
