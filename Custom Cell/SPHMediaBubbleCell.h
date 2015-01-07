//
//  SPHMediaBubbleCell.h
//  NewChatBubble
//
//  Created by Siba Prasad Hota  on 1/3/15.
//  Copyright (c) 2015 Wemakeappz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MediaCellDelegate;

@interface SPHMediaBubbleCell : UITableViewCell
{
    UIImageView *messageBackgroundView;

}
@property(nonatomic, retain) UILabel *timestampLabel;
@property (nonatomic,strong) NSString *bubbletype;
@property (nonatomic,strong) UIImageView *AvatarImageView;
@property (nonatomic,strong) UIImageView *messageImageView;


@property (nonatomic, assign) id <MediaCellDelegate> CustomDelegate;
- (void)showMenu;

@end


@protocol MediaCellDelegate
@required

-(void)mediaCellDidTapped:(SPHMediaBubbleCell *)mediaCell AndGesture:(UIGestureRecognizer*)tapGR;

-(void)mediaCellCopyPressed:(SPHMediaBubbleCell *)mediaCell;
-(void)mediaCellForwardPressed:(SPHMediaBubbleCell *)mediaCell;
-(void)mediaCellDeletePressed:(SPHMediaBubbleCell *)mediaCell;


@end