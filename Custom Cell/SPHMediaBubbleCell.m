//
//  SPHMediaBubbleCell.m
//  NewChatBubble
//
//  Created by Siba Prasad Hota  on 1/3/15.
//  Copyright (c) 2015 Wemakeappz. All rights reserved.
//

#import "SPHMediaBubbleCell.h"
#import "Constantvalues.h"

@implementation SPHMediaBubbleCell

@synthesize timestampLabel = _timestampLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        if ([[UIDevice currentDevice].systemVersion floatValue] < 7.0f) {
            self.textLabel.backgroundColor = [UIColor whiteColor];
        }
        self.textLabel.font = [UIFont systemFontOfSize:14.0f];
        self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.textLabel.numberOfLines = 0;
        self.textLabel.textAlignment = NSTextAlignmentLeft;
        self.textLabel.textColor = [UIColor clearColor];
        
        _timestampLabel = [[UILabel alloc] init];
        _timestampLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _timestampLabel.textAlignment = NSTextAlignmentCenter;
        _timestampLabel.backgroundColor = [UIColor clearColor];
        _timestampLabel.font = [UIFont systemFontOfSize:12.0f];
        _timestampLabel.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.0];
        _timestampLabel.frame = CGRectMake(0.0f, 12, self.bounds.size.width, 18);
        
        [self.contentView addSubview:_timestampLabel];
        
        messageBackgroundView = [[UIImageView alloc] initWithFrame:self.textLabel.frame];
        [self.contentView addSubview:messageBackgroundView];
        
        messageImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.5,0.5,1,1)];
        [messageBackgroundView addSubview:messageImageView];
        

        
        self.AvatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5,10+TOP_MARGIN, 50, 50)];
        
        [self.contentView addSubview:self.AvatarImageView];
        
        CALayer * l = [self.AvatarImageView layer];
        [l setMasksToBounds:YES];
        [l setCornerRadius:self.AvatarImageView.frame.size.width/2.0];
        
        CALayer * l2 = [messageImageView layer];
        [l2 setMasksToBounds:YES];
        [l2 setCornerRadius:10];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if ([self.bubbletype isEqualToString:@"LEFT"])
    {
        messageBackgroundView.frame = CGRectMake(60,TOP_MARGIN+30 - 12, 140,140);
        self.AvatarImageView.frame=CGRectMake(5,10+TOP_MARGIN, 50, 50);
      //  messageBackgroundView.image = [[UIImage imageNamed:@"messages_left_bubble.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:16];
        messageImageView.frame=CGRectMake(0.5,0.5, 139,  139);
        messageImageView.image=[UIImage imageNamed:@"ProfilePic"];


        
    }else
    {
        messageBackgroundView.frame = CGRectMake( self.frame.size.width-200,TOP_MARGIN+20,140,140);
       // messageBackgroundView.image = [[UIImage imageNamed:@"messages_right_bubble.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:16];
        self.AvatarImageView.frame=CGRectMake( self.frame.size.width-55,10+TOP_MARGIN, 50, 50);
         messageImageView.image=[UIImage imageNamed:@"scene"];
    }
       messageImageView.frame=CGRectMake(0.5,0.5, 139,  139);
    
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1].CGColor);
    
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, 0, 21); //start at this point
    CGContextAddLineToPoint(context, (self.bounds.size.width - 120) / 2, 21); //draw to this point
    
    CGContextMoveToPoint(context, self.bounds.size.width, 21); //start at this point
    CGContextAddLineToPoint(context, self.bounds.size.width - (self.bounds.size.width - 120) / 2, 21); //draw to this point
    
    CGContextStrokePath(context);
    
}



@end
