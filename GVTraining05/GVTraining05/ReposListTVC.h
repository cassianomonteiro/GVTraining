//
//  ReposListTVC.h
//  GVTraining04
//
//  Created by Cassiano Monteiro on 17/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReposListTVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

// Propriedade a ser preenchida quando ocorrer a transição via segue
@property (nonatomic, strong) NSString *username;
@end
