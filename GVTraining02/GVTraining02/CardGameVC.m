//
//  CardGameVC.m
//  GVTraining02
//
//  Created by Cassiano Monteiro on 03/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "CardGameVC.h"

@interface CardGameVC ()
@property (nonatomic, assign) NSUInteger flipsCount;
@end

@implementation CardGameVC

// Override no setter para atualizar a tela toda vez que a propriedade é alterada.
- (void)setFlipsCount:(NSUInteger)flipsCount
{
    _flipsCount = flipsCount;
    self.flipsCounter.text = [NSString stringWithFormat:@"Flips: %d", self.flipsCount];
}

// Ação executada quando a carta é clicada
- (IBAction)cardTapped:(UIButton *)sender
{
    UIImage *cardImage;
    NSString *cardText;
    
    // Este IF verifica se o currentTitle não é nulo
    if (!sender.currentTitle) {
        // O nome da imagem vem do conjunto de Assets do projeto.
        // NÃO é o nome do arquivo, mas sim do asset.
        cardImage = [UIImage imageNamed:@"cardfront"];
        cardText = @"A♠️";
    }
    else {
        cardImage = [UIImage imageNamed:@"cardback"];
    }
    
    [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
    [sender setTitle:cardText forState:UIControlStateNormal];
    
    self.flipsCount++;
}

@end
