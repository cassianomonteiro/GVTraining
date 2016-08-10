//
//  ViewController.h
//  GVTraining01
//
//  Created by Cassiano Monteiro on 23/05/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// IBOutlet é um link para um OBJETO da tela (IB = Interface Builder)
@property (weak, nonatomic) IBOutlet UILabel *cardLabel;

// IBAction é uma chamada em resposta a um evento que ocorre na tela (ação do usuário)
- (IBAction)showCardTapped:(UIButton *)sender;

@end

