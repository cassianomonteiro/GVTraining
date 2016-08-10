//
//  OwnerCell.h
//  GVTrainning05
//
//  Created by Cassiano Monteiro on 28/06/16.
//  Copyright © 2016 Guichê Virtual. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OwnerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *ownerName;
@property (weak, nonatomic) IBOutlet UIImageView *ownerAvatar;

@end
