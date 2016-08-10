//
//  CardGameVC.h
//  GVTraining02
//
//  Created by Cassiano Monteiro on 03/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <UIKit/UIKit.h>

// Classe para controlar uma cena do StoryBoard.
// É necessário definir esta classe na propriedade do componente ViewController da cena controlada no StoryBoard. 
@interface CardGameVC : UIViewController

// Outlets (referências a objetos instanciados) para componentes do StoryBoard.
// São criados segurando CTRL e arrastando do StoryBoard até o código.
@property (weak, nonatomic) IBOutlet UIButton *card;
@property (weak, nonatomic) IBOutlet UILabel *flipsCounter;

// Actions para eventos do StoryBoard
// Também criados segurando CTRL e arrastando do StoryBoard até o código.
- (IBAction)cardTapped:(UIButton *)sender;

/**
 * EXERCÍCIOS
 *
 * 1) Fazer o flip da carta mostrar cartas aleatórias a cada flip da frente da carta.
 *
 * 2) Incluir mais uma carta no StoryBoard. Iniciar o app com as cartas viradas para baixo.
 *    Ao virar cada carta, um valor aleatório é exibido. 
 *    As ter duas cartas aleatórias exibidas, contabilizar o score:
 *      Score 3 - Número e naipe iguais
 *      Score 2 - Somente número igual
 *      Score 1 - Somente naipe igual
 *      Score 0 - Tudo diferente
 * 
 * DESAFIO: fazer um jogo da memória.
 */

@end
