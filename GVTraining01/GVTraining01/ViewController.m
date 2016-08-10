//
//  ViewController.m
//  GVTraining01
//
//  Created by Cassiano Monteiro on 23/05/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import "ViewController.h"
#import "Card.h"

@interface ViewController ()
@end

@implementation ViewController

- (IBAction)showCardTapped:(UIButton *)sender
{
    // Alocação padrão de um objeto em memória é feita com o método "alloc"
    // O método "init" é o construtor padrão do objeto
    // Um método é chamado entre colchetes, podendo ser encadeado ao retorno de outro método,
    // como no exemplo abaixo (init encadeado no retorno do alloc)
    Card *myCard = [[Card alloc] init];
    
    // Chamada de um método público de instância sem retorno (retorno void)
    [myCard shuffleCard];
    
    // self.carLabel é um getter da propriedade cardLabel
    // ".text" é um setter da propriedade "text" da classe UILabel
    // myCard.face está chamando o getter da propriedade face no objeto myCard
    self.cardLabel.text = myCard.face;
}

@end
