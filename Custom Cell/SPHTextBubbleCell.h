//
//  SPHLeftBubbleCell.h
//  NewChatBubble
//
//  Created by Siba Prasad Hota  on 1/3/15.
//  Copyright (c) 2015 Wemakeappz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextCellDelegate;

@interface SPHTextBubbleCell : UITableViewCell
{
    UIImageView *messageBackgroundView;
}

@property(nonatomic, retain) UILabel *timestampLabel;
@property (nonatomic,strong) NSString *bubbletype;
@property (nonatomic,strong) UIImageView *AvatarImageView;

@property (nonatomic, assign) id <TextCellDelegate> CustomDelegate;

- (void)showMenu;


@end


@protocol TextCellDelegate
@required

-(void)textCellDidTapped:(SPHTextBubbleCell *)tesxtCell AndGesture:(UIGestureRecognizer*)tapGR;

-(void)cellCopyPressed:(SPHTextBubbleCell *)tesxtCell;
-(void)cellForwardPressed:(SPHTextBubbleCell *)tesxtCell;
-(void)cellDeletePressed:(SPHTextBubbleCell *)tesxtCell;


@end

