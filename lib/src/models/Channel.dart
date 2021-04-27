import 'package:json_annotation/json_annotation.dart';

import 'User.dart';

part 'Channel.g.dart';

@JsonSerializable()
class Channel{

   int creator_user_profile_id;
   int channel_id;
   String channel;
   String topic;
   bool is_private;
   bool is_social_mode;
   String url;
   int num_other;
   bool has_blocked_speakers;
   bool is_explore_channel;
   int num_speakers;
   int num_all;
   List<ChannelUser> users;
   String token;
   bool is_handraise_enabled;
   String pubnub_token;
   int pubnub_heartbeat_value;
   int pubnub_heartbeat_interval;


  Channel(this.creator_user_profile_id,
      this.channel_id,this.channel,
      this.topic,this.is_private,
      this.is_social_mode,this.url,
      this.num_other,this.has_blocked_speakers,
      this.is_explore_channel,this.num_speakers,
      this.num_all,this.users,
      this.token,this.is_handraise_enabled,
     this.pubnub_token,this.pubnub_heartbeat_interval,this.pubnub_heartbeat_value);

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);

}


@JsonSerializable()
class ChannelUser{

   int user_id;
   String name;
   String photo_url;
   String username;
   bool is_speaker;
   bool is_moderator;
   bool is_followed_by_speaker;
   bool is_invited_as_speaker;
   bool is_new;
   String time_joined_as_speaker;
   String first_name;

  ChannelUser(this.user_id,this.name,this.photo_url,this.username,this.is_speaker,this.is_moderator,this.is_followed_by_speaker,
      this.is_invited_as_speaker,this.is_new,this.time_joined_as_speaker,this.first_name);

  factory ChannelUser.fromJson(Map<String, dynamic> json) => _$ChannelUserFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelUserToJson(this);

}


@JsonSerializable()
class ChannelResponse{

  List<Channel> channels;

  ChannelResponse(this.channels);

  factory ChannelResponse.fromJson(Map<String, dynamic> json) => _$ChannelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelResponseToJson(this);

}
