//
//  ScrollImageVC.h
//  GVTrainning05
//
//  Created by Cassiano Monteiro on 28/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollImageVC : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)backTapped:(UIBarButtonItem *)sender;

@end
