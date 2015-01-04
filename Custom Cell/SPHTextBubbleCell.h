//
//  SPHLeftBubbleCell.h
//  NewChatBubble
//
//  Created by Siba Prasad Hota  on 1/3/15.
//  Copyright (c) 2015 Wemakeappz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPHTextBubbleCell : UITableViewCell
{
    UIImageView *messageBackgroundView;
}

@property(nonatomic, retain) UILabel *timestampLabel;
@property (nonatomic,strong) NSString *bubbletype;
@property (nonatomic,strong) UIImageView *AvatarImageView;


@end


