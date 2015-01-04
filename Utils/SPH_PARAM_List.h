//
//  SPH_PARAM_List.h
//  NewChatBubble
//
//  Created by Siba Prasad Hota on 04/01/15.
//  Copyright (c) 2015 Wemakeappz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPH_PARAM_List : NSObject

@property(nonatomic,retain) NSString *chat_Type;  // GROUP/ USER (us)/OPERATOR (op)
@property(nonatomic,retain) NSString *chat_message_Type; // ( text (0)/ Image (1) / audio(3) / video(2))
@property(nonatomic,retain) NSString *chat_messageID;
@property(nonatomic,retain) NSString *chat_message;
@property(nonatomic,retain) NSString *chat_media_type; //(ImageByOther,VideoByother,AudioByother,textByother)
@property(nonatomic,retain) NSString *chat_date_time;
@property(nonatomic,retain) NSString *chat_time;
@property(nonatomic,retain) NSString *chat_Thumburl;
@property(nonatomic,retain) NSString *chat_send_status;
@property(nonatomic,retain) NSString *chat_downloadStatus;

@end
