//
//  ViewController.m
//  GVTraining03
//
//  Created by Cassiano Monteiro on 10/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "ViewController.h"
#import "ConcentrationGame.h"
#import "PokerDeck.h"

@interface ViewController () <ConcentrationGameDelegate>
@property (nonatomic, strong) ConcentrationGame *game;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.game = [[ConcentrationGame alloc] initWithCardsCount:self.cardButtons.count usingDeck:[[PokerDeck alloc] init]];
    self.game.delegate = self;
}

- (IBAction)cardTapped:(UIButton *)sender
{
    Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:sender]];
    if ([self.game shouldPickCard:card]) {
        [self.game pickCard:card];
    }
}

/**
 * Exercícios:
 *
 * 1) Evitar que a primeira carta seja clicada novamente (mexer no shouldPickCard).
 *
 * 2) Aplicar visual desabilitado na tela para as cartas que já tiverem dado match.
 *
 * 3) Posicionar as cartas aleatoriamente.
 * 
 * DESAFIO: criar uma lógica de pontuação dando mais pontos para cartas viradas menos vezes:
 *          Exemplo: Deu match na primeira vez que virei as cartas: 10 pontos.
 *                   Deu match na segunda vez que virei as cartas: 3 pontos.
 *                   Deu match na terceira vez que virei as cartas: 1 pontos.
 *                   Virar cartas 4 vezes ou mais: -1 ponto.
 */

#pragma mark - <ConcentrationGameDelegate>

- (void)showCard:(Card *)card
{
    UIButton *cardButton = [self.cardButtons objectAtIndex:[self.game indexOfCard:card]];
    
    [UIView transitionWithView:cardButton duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [cardButton setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        [cardButton setTitle:card.contents forState:UIControlStateNormal];
    } completion:nil];
}

- (void)hideCard:(Card *)card
{
    UIButton *cardButton = [self.cardButtons objectAtIndex:[self.game indexOfCard:card]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView transitionWithView:cardButton duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [cardButton setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
            [cardButton setTitle:nil forState:UIControlStateNormal];
        } completion:nil];
    });
}

- (void)showScore:(NSNumber *)score
{
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %@", score];
}

@end