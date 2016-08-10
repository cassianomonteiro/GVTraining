//
//  ViewController.h
//  GVTraining03
//
//  Created by Cassiano Monteiro on 10/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// IBOutletCollection permite gerenciar vários objetos do StoryBoard. São alocados em um array.
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

- (IBAction)cardTapped:(UIButton *)sender;
@end

