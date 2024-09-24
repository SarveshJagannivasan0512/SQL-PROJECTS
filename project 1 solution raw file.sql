select ibp.bidder_id ,ibp.no_of_bids,ibd1.bidder_name,
(case;when bid_status like &quot;won&quot; then 1&#x0A;else 0&#x0A;end ) as total_wins,&#x0A;round(sum(case&#x0A;when bid_status like &quot;won&quot; then 1&#x0A;else 0&#x0A;end )/100,2) as  percentage_wins&#x0A;from ipl_user iu&#x0A;join ipl_bidder_details ibd1&#x0A;on iu.user_id=ibd1.user_id&#x0A;join ipl_bidder_points ibp&#x0A;join ipl_bidding_details ibd&#x0A;on ibd.bidder_id=ibp.bidder_id&#x0A;where bid_status like &quot;%won%&quot;&#x0A;group by ibp.bidder_id,ibp.no_of_bids,ibd1.bidder_name&#x0A;order by percentage_wins  desc</ENTRY>
select * from ipl_stadium</ENTRY>
select * from ipl_tournament</ENTRY>
select * from ipl_match_schedule</ENTRY>
select * from ipl_match</ENTRY>
select ist.stadium_id,ist.stadium_name,ist.city,count(im.match_id) as no_of_matches&#x0A;from ipl_match im join ipl_match_schedule ims&#x0A;on im.match_id=ims.match_id&#x0A;join ipl_stadium ist&#x0A;on ims.STADIUM_ID=ist.stadium_id&#x0A;group by ist.stadium_id,ist.stadium_name,ist.city</ENTRY>
select * from ipl_match</ENTRY>
select * from ipl_stadium</ENTRY>
select * from ipl_team_standings</ENTRY>
select * from ipl_team</ENTRY>
select * from ipl_match_schedule</ENTRY>
select ist.stadium_id,ist.stadium_name,it.team_name,im.match_id,&#x0A;round(sum(its.matches_won/its.matches_played)*100,2) as percentage_of_wins&#x0A;from ipl_team it join ipl_team_standings its&#x0A;on it.team_id=its.team_id&#x0A;join ipl_match im join ipl_match_schedule ims&#x0A;on im.match_id=ims.match_id&#x0A;cross join ipl_stadium ist&#x0A;&#x0A;where toss_winner=match_winner and status=&quot;completed&quot;&#x0A;group by ist.stadium_id,ist.stadium_name,it.team_name,im.match_id</ENTRY>
select stadium_id,stadium_name,sum(case &#x0A;when toss_winner=match_winner then 1&#x0A;else 0&#x0A;end) cwon,count(stadium_id) total_matches,&#x0A;(sum(case &#x0A;when toss_winner=match_winner then 1&#x0A;else 0&#x0A;end)/count(stadium_id))*100  win_percentage&#x0A;from ipl_match  join&#x0A;ipl_match_schedule using(match_id)&#x0A;join ipl_stadium using(stadium_id)&#x0A;where status=&quot;completed&quot;&#x0A;group by stadium_id,stadium_name&#x0A;order by stadium_id</ENTRY>
<ENTRY timestamp='11:14:33'>select bid_team,sum(no_of_bids),team_name from ipl_bidder_points ibp join ipl_bidding_details ibd&#x0A;on ibp.bidder_id=ibd.bidder_id join ipl_team  it on ibd.bid_team=it.team_id&#x0A;group by bid_team,team_name&#x0A;order by bid_team</ENTRY>
<ENTRY timestamp='11:14:45'>~</ENTRY>
<ENTRY timestamp='11:16:44'>select * from ipl_match</ENTRY>
<ENTRY timestamp='11:21:46'>select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on im.TEAM_ID1=it.TEAM_ID &#x0A;where it.team_id=im.MATCH_WINNER</ENTRY>
<ENTRY timestamp='11:22:19'>select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on (im.TEAM_ID1,im.team_id2)=it.TEAM_ID &#x0A;where it.team_id=im.MATCH_WINNER</ENTRY>
<ENTRY timestamp='11:23:33'>select * from ipl_match</ENTRY>
<ENTRY timestamp='11:24:44'>select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.team_name=substring(im.win_details,6,8)</ENTRY>
<ENTRY timestamp='11:25:12'>select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.team_name=substring(win_details,6,2)</ENTRY>
<ENTRY timestamp='11:25:24'>select * from ipl_match</ENTRY>
<ENTRY timestamp='11:26:34'>select * from ipl_team</ENTRY>
<ENTRY timestamp='11:26:47'>select * from ipl_match</ENTRY>
<ENTRY timestamp='11:27:10'>select * from ipl_team_standings</ENTRY>
<ENTRY timestamp='11:27:29'>select * from ipl_tournament</ENTRY>
<ENTRY timestamp='11:29:46'>select * from ipl_team</ENTRY>
<ENTRY timestamp='11:30:07'>select * from ipl_match</ENTRY>
<ENTRY timestamp='11:30:17'>select * from ipl_team</ENTRY>
<ENTRY timestamp='11:31:09'>select tournmt_id,tournmt_name,team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,2)</ENTRY>
<ENTRY timestamp='11:31:18'>select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,2)</ENTRY>
<ENTRY timestamp='11:31:38'>select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,8)</ENTRY>
<ENTRY timestamp='11:31:43'>select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,2)</ENTRY>
<ENTRY timestamp='11:32:16'>select * from ipl_team</ENTRY>
<ENTRY timestamp='11:32:18'>select * from ipl_match</ENTRY>
<ENTRY timestamp='11:33:40'>select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,1)&#x0A;union all&#x0A;select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,2)&#x0A;union all&#x0A;select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,3)</ENTRY>
<ENTRY timestamp='11:33:56'>order by team_id</ENTRY>
<ENTRY timestamp='11:34:10'>~</ENTRY>
<ENTRY timestamp='11:34:51'>with t as&#x0A;(select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,1)&#x0A;union all&#x0A;select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,2)&#x0A;union all&#x0A;select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,3))&#x0A;select * from t order by team_id asc</ENTRY>
<ENTRY timestamp='11:35:16'>with t as&#x0A;select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,1)&#x0A;union all&#x0A;select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,2)&#x0A;union all&#x0A;select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,3)</ENTRY>
<ENTRY timestamp='11:35:18'>~</ENTRY>
<ENTRY timestamp='11:35:26'>select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,1)&#x0A;union all&#x0A;select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,2)&#x0A;union all&#x0A;select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,3)</ENTRY>
<ENTRY timestamp='11:35:57'>select * from ipl_team</ENTRY>
<ENTRY timestamp='11:36:02'>select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,1)&#x0A;union all&#x0A;select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,2)&#x0A;union all&#x0A;select team_id,team_name,win_details from ipl_match im join ipl_team it&#x0A;on it.remarks=substring(win_details,6,3)</ENTRY>
<ENTRY timestamp='11:36:19'>select * from ipl_team</ENTRY>
<ENTRY timestamp='11:37:07'>select * from ipl_match</ENTRY>
<ENTRY timestamp='11:37:21'>select * from ipl_team_standings</ENTRY>
<ENTRY timestamp='11:39:05'>select team_id,team_name,sum(matches_played),sum(matches_won),sum(matches_lost) from ipl_team_standings its&#x0A;join ipl_team it on its.team_id=it.team_id</ENTRY>
<ENTRY timestamp='11:39:12'>select its.team_id,team_name,sum(matches_played),sum(matches_won),sum(matches_lost) from ipl_team_standings its&#x0A;join ipl_team it on its.team_id=it.team_id</ENTRY>
<ENTRY timestamp='11:39:27'>select its.team_id,team_name,sum(matches_played),sum(matches_won),sum(matches_lost) from ipl_team_standings its&#x0A;join ipl_team it on its.team_id=it.team_id&#x0A;group by its.team_id,team_name</ENTRY>
<ENTRY timestamp='11:40:58'>select * from ipl_player</ENTRY>
<ENTRY timestamp='11:43:05'>select * from ipl_team_players</ENTRY>
<ENTRY timestamp='11:43:45'>select * from ipl_player</ENTRY>
<ENTRY timestamp='11:43:59'>select * from ipl_team</ENTRY>
<ENTRY timestamp='11:44:06'>select * from ipl_team_players</ENTRY>
<ENTRY timestamp='11:45:08'>select * from ipl_team</ENTRY>
<ENTRY timestamp='11:45:15'>select ,team_name,player_role from ipl_team_players itp join ipl_team it&#x0A;on itp.team_id=it.team_id&#x0A;where player_role =&quot;Bowler&quot; and team_id=5</ENTRY>
<ENTRY timestamp='11:45:23'>select team_name,player_role from ipl_team_players itp join ipl_team it&#x0A;on itp.team_id=it.team_id&#x0A;where player_role =&quot;Bowler&quot; and team_id=5</ENTRY>
<ENTRY timestamp='11:45:29'>select team_name,player_role from ipl_team_players itp join ipl_team it&#x0A;on itp.team_id=it.team_id&#x0A;where player_role =&quot;Bowler&quot; and its.team_id=5</ENTRY>
<ENTRY timestamp='11:45:33'>select team_name,player_role from ipl_team_players itp join ipl_team it&#x0A;on itp.team_id=it.team_id&#x0A;where player_role =&quot;Bowler&quot; and itp.team_id=5</ENTRY>
<ENTRY timestamp='11:45:44'>select * from ipl_team_players</ENTRY>
<ENTRY timestamp='11:45:59'>select * from ipl_player</ENTRY>
<ENTRY timestamp='11:47:00'>select team_name,player_name,player_role from ipl_team_players itp join ipl_team it&#x0A;on itp.team_id=it.team_id&#x0A;join ipl_player ip on itp.player_id=ip.player_id&#x0A;where player_role =&quot;Bowler&quot; and itp.team_id=5</ENTRY>
<ENTRY timestamp='11:47:17'>select * from ipl_team_players</ENTRY>
<ENTRY timestamp='11:48:44'>select team_name,player_name,player_role from ipl_team_players itp join ipl_team it&#x0A;on itp.team_id=it.team_id&#x0A;join ipl_player ip on itp.player_id=ip.player_id&#x0A;where player_role =&quot;Bowler&quot; and itp.team_id=5</ENTRY>
<ENTRY timestamp='11:49:30'>select * from ipl_team_players</ENTRY>
<ENTRY timestamp='11:51:22'>select TEAM_ID,team_name,count(player_role) as no_of_ar from ipl_team_players itp where team_id in&#x0A;(select team_id from ipl_team it where it.team_id=itp.team_id)</ENTRY>
<ENTRY timestamp='11:51:34'>select itp.TEAM_ID,it.team_name,count(player_role) as no_of_ar from ipl_team_players itp where team_id in&#x0A;(select team_id from ipl_team it where it.team_id=itp.team_id)</ENTRY>
<ENTRY timestamp='11:51:52'>select * from ipl_team_players</ENTRY>
<ENTRY timestamp='11:52:05'>select itp.TEAM_ID,count(player_role) as no_of_ar from ipl_team_players itp where team_id in&#x0A;(select team_id from ipl_team it where it.team_id=itp.team_id)</ENTRY>
<ENTRY timestamp='11:52:20'>select itp.TEAM_ID,count(player_role) as no_of_ar from ipl_team_players itp where team_id in&#x0A;(select team_id from ipl_team it where it.team_id=itp.team_id)&#x0A;group by itp.team_id</ENTRY>
<ENTRY timestamp='11:53:13'>select * from ipl_team_players</ENTRY>
<ENTRY timestamp='11:53:28'>select itp.TEAM_ID,count(player_role) as no_of_ar from ipl_team_players itp where team_id in&#x0A;(select team_id from ipl_team it where it.team_id=itp.team_id)&#x0A;where player_role=&quot;all-rounder&quot;&#x0A;group by itp.team_id&#x0A;order by no_of_ar desc</ENTRY>
<ENTRY timestamp='12:19:52'>with ar as(&#x0A;select itp.TEAM_ID,it.team_name ,count(player_role) as no_of_ar from ipl_team_players itp where team_id in&#x0A;(select team_id from ipl_team it where it.team_id=itp.team_id))&#x0A;select * from ar where no_of_ar=&quot;ALL-rounders&quot; or no_of_ar&gt;4</ENTRY>
<ENTRY timestamp='12:19:58'>with ar as(&#x0A;select itp.TEAM_ID,count(player_role) as no_of_ar from ipl_team_players itp where team_id in&#x0A;(select team_id from ipl_team it where it.team_id=itp.team_id))&#x0A;select * from ar where no_of_ar=&quot;ALL-rounders&quot; or no_of_ar&gt;4</ENTRY>
<ENTRY timestamp='12:20:01'>~</ENTRY>
<ENTRY timestamp='12:20:17'>with ar as(&#x0A;select itp.TEAM_ID,count(player_role) as no_of_ar from ipl_team_players itp where team_id in&#x0A;(select team_id from ipl_team it where it.team_id=itp.team_id))&#x0A;select * from ar where no_of_ar=&quot;ALL-rounders&quot; or no_of_ar&gt;4&#x0A;group by itp.team-id</ENTRY>
<ENTRY timestamp='12:20:24'>with ar as(&#x0A;select itp.TEAM_ID,count(player_role) as no_of_ar from ipl_team_players itp where team_id in&#x0A;(select team_id from ipl_team it where it.team_id=itp.team_id))&#x0A;select * from ar where no_of_ar=&quot;ALL-rounders&quot; or no_of_ar&gt;4&#x0A;group by itp.team_id</ENTRY>
<ENTRY timestamp='12:20:33'>with ar as(&#x0A;select itp.TEAM_ID,count(player_role) as no_of_ar from ipl_team_players itp where team_id in&#x0A;(select team_id from ipl_team it where it.team_id=itp.team_id))&#x0A;select * from ar where no_of_ar=&quot;ALL-rounders&quot; or no_of_ar&gt;4&#x0A;group by team_id</ENTRY>
<ENTRY timestamp='12:25:42'>select itp.team_id,it.team_name,player_role,count(player_role) as cnt_of_ar&#x0A;from ipl_team_players itp join ipl_team it on itp.team_id=it.team_id&#x0A;where player_role=&quot;all-rounders&quot; and cnt_of_ar&gt;4</ENTRY>
<ENTRY timestamp='12:26:21'>select itp.team_id,it.team_name,player_role,count(player_role) as cnt_of_ar&#x0A;from ipl_team_players itp join ipl_team it on itp.team_id=it.team_id&#x0A;where player_role=&quot;all-rounders&quot;&#x0A;group by itp.team_id,it.team_name&#x0A;having cnt_of_Ar&gt;4</ENTRY>
<ENTRY timestamp='12:27:30'>select t.TEAM_ID, TEAM_NAME, count(*) NO_OF_ALL_ROUNDER from ipl_team t&#x0A;join ipl_team_players tp &#x0A;on t.TEAM_ID = tp.TEAM_ID&#x0A;where tp.PLAYER_ROLE = 'All-Rounder'&#x0A;group by t.TEAM_ID having count(*)&gt;4</ENTRY>
<ENTRY timestamp='12:28:29'>select itp.team_id,it.team_name,player_role,count(*) as cnt_of_ar&#x0A;from ipl_team_players itp join ipl_team it on itp.team_id=it.team_id&#x0A;where itp.player_role=&quot;all-rounders&quot;&#x0A;group by itp.team_id,it.team_name&#x0A;having cnt_of_Ar&gt;4</ENTRY>
<ENTRY timestamp='12:28:34'>select itp.team_id,it.team_name,player_role,count(*) as cnt_of_ar&#x0A;from ipl_team_players itp join ipl_team it on itp.team_id=it.team_id&#x0A;where itp.player_role=&quot;all-rounders&quot;&#x0A;group by itp.team_id&#x0A;having cnt_of_Ar&gt;4</ENTRY>
<ENTRY timestamp='12:28:42'>~</ENTRY>
<ENTRY timestamp='12:28:57'>select itp.team_id,it.team_name,player_role,count(*) as cnt_of_ar&#x0A;from ipl_team_players itp join ipl_team it &#x0A;on itp.team_id=it.team_id&#x0A;where itp.player_role=&quot;all-rounder&quot;&#x0A;group by itp.team_id&#x0A;having cnt_of_Ar&gt;4</ENTRY>
<ENTRY timestamp='12:31:47'>select * from ipl_bidder_points</ENTRY>
<ENTRY timestamp='12:32:03'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='12:32:58'>~</ENTRY>
<ENTRY timestamp='12:33:01'>select * from ipl_match</ENTRY>
<ENTRY timestamp='12:33:08'>select * from ipl_match_schedule</ENTRY>
<ENTRY timestamp='12:33:11'>select * from ipl_match</ENTRY>
<ENTRY timestamp='12:33:14'>select * from ipl_match_schedule</ENTRY>
<ENTRY timestamp='12:33:24'>select * from ipl_player</ENTRY>
<ENTRY timestamp='12:33:26'>select * from ipl_stadium</ENTRY>
<ENTRY timestamp='12:33:37'>select * from ipl_tournament</ENTRY>
<ENTRY timestamp='12:33:45'>select * from ipl_team_standings</ENTRY>
<ENTRY timestamp='12:33:50'>select * from ipl_user</ENTRY>
<ENTRY timestamp='12:33:54'>select * from ipl_team_standings</ENTRY>
<ENTRY timestamp='12:33:56'>select * from ipl_team_players</ENTRY>
<ENTRY timestamp='12:33:58'>select * from ipl_team</ENTRY>
<ENTRY timestamp='12:33:59'>select * from ipl_stadium</ENTRY>
<ENTRY timestamp='12:34:02'>select * from ipl_team</ENTRY>
<ENTRY timestamp='12:34:12'>select * from ipl_stadium</ENTRY>
<ENTRY timestamp='12:34:19'>select * from ipl_match_schedule</ENTRY>
<ENTRY timestamp='12:34:30'>select * from ipl_match</ENTRY>
<ENTRY timestamp='12:34:37'>select * from ipl_match_schedule</ENTRY>
<ENTRY timestamp='12:35:07'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='12:35:16'>~</ENTRY>
<ENTRY timestamp='12:35:23'>select * from ipl_bidder_points</ENTRY>
<ENTRY timestamp='12:35:57'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='12:36:08'>select * from ipl_bidder_points</ENTRY>
<ENTRY timestamp='12:36:38'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='12:36:49'>select * from ipl_match</ENTRY>
<ENTRY timestamp='12:36:53'>select * from ipl_match_schedule</ENTRY>
<ENTRY timestamp='12:36:55'>select * from ipl_match</ENTRY>
<ENTRY timestamp='12:37:14'>~</ENTRY>
<ENTRY timestamp='12:37:15'>select * from ipl_match_schedule</ENTRY>
<ENTRY timestamp='12:37:38'>select * from ipl_bidder_points</ENTRY>
<ENTRY timestamp='12:37:40'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='12:39:58'>select * from ipl_team</ENTRY>
<ENTRY timestamp='12:40:16'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='12:41:11'>select bidder_id,sum(total_points) as bidder_points,bid_status,stadium_id,year(bid_date)&#x0A;from ipl_bidder_points ibp join ipl_bidding_details ibd&#x0A;on ibp.bidder_id=ibd.bidder_id&#x0A;join ipl_match im join ipl_match_schedule ims &#x0A;on im.match_id=ims.match_id&#x0A;where bid_team=1 and STADIUM_ID=7&#x0A;order by bidder_points desc</ENTRY>
<ENTRY timestamp='12:41:22'>select ibp.bidder_id,sum(total_points) as bidder_points,bid_status,stadium_id,year(bid_date)&#x0A;from ipl_bidder_points ibp join ipl_bidding_details ibd&#x0A;on ibp.bidder_id=ibd.bidder_id&#x0A;join ipl_match im join ipl_match_schedule ims &#x0A;on im.match_id=ims.match_id&#x0A;where bid_team=1 and STADIUM_ID=7&#x0A;order by bidder_points desc</ENTRY>
<ENTRY timestamp='12:41:53'>select ibp.bidder_id,sum(total_points) as bidder_points,bid_status,stadium_id,year(bid_date)&#x0A;from ipl_bidder_points ibp join ipl_bidding_details ibd&#x0A;on ibp.bidder_id=ibd.bidder_id&#x0A;join ipl_match im join ipl_match_schedule ims &#x0A;on im.match_id=ims.match_id&#x0A;where bid_team=1 and STADIUM_ID=7&#x0A;group by ibp.bidder_id,bid_status,year(bid_date)&#x0A;order by bidder_points desc</ENTRY>
<ENTRY timestamp='12:42:11'>select ibp.bidder_id,bid_team,sum(total_points) as bidder_points,bid_status,stadium_id,year(bid_date)&#x0A;from ipl_bidder_points ibp join ipl_bidding_details ibd&#x0A;on ibp.bidder_id=ibd.bidder_id&#x0A;join ipl_match im join ipl_match_schedule ims &#x0A;on im.match_id=ims.match_id&#x0A;where bid_team=1 and STADIUM_ID=7&#x0A;group by ibp.bidder_id,bid_status,year(bid_date)&#x0A;order by bidder_points desc</ENTRY>
<ENTRY timestamp='12:42:49'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='12:42:59'>select ibp.bidder_id,bid_team,sum(total_points) as bidder_points,bid_status,stadium_id,year(bid_date)&#x0A;from ipl_bidder_points ibp join ipl_bidding_details ibd&#x0A;on ibp.bidder_id=ibd.bidder_id&#x0A;join ipl_match im join ipl_match_schedule ims &#x0A;on im.match_id=ims.match_id&#x0A;where bid_team=1 and bid_status=&quot;won&quot; and STADIUM_ID=7&#x0A;group by ibp.bidder_id,bid_status,year(bid_date)&#x0A;order by bidder_points desc</ENTRY>
<ENTRY timestamp='12:43:28'>select * from ipl_stadium</ENTRY>
<ENTRY timestamp='12:43:43'>select ibp.bidder_id,bid_team,sum(total_points) as bidder_points,bid_status,stadium_id,year(bid_date)&#x0A;from ipl_bidder_points ibp join ipl_bidding_details ibd&#x0A;on ibp.bidder_id=ibd.bidder_id&#x0A;join ipl_match im join ipl_match_schedule ims &#x0A;on im.match_id=ims.match_id&#x0A;where bid_team=1 and bid_status=&quot;won&quot; and STADIUM_ID=7&#x0A;group by ibp.bidder_id,bid_status,year(bid_date)&#x0A;order by bidder_points desc</ENTRY>
<ENTRY timestamp='12:45:25'>select * from ipl_player</ENTRY>
<ENTRY timestamp='12:49:49'>select instr(performance_dtls,&quot;wkt&quot;) from ipl_player</ENTRY>
<ENTRY timestamp='12:50:21'>select * from ipl_player</ENTRY>
<ENTRY timestamp='12:50:37'>select instr(performance_dtls,&quot;wkt&quot;) from ipl_player</ENTRY>
<ENTRY timestamp='12:50:42'>select * from ipl_player</ENTRY>
<ENTRY timestamp='12:51:38'>select instr(performance_dtls,&quot;wkt&quot;) from ipl_player</ENTRY>
<ENTRY timestamp='12:51:50'>select substr(performace_dtls,18,5) from ipl_player</ENTRY>
<ENTRY timestamp='12:52:00'>select substr(performance_dtls,18,5) from ipl_player</ENTRY>
<ENTRY timestamp='12:52:20'>select * from ipl_player</ENTRY>
<ENTRY timestamp='12:52:35'>select substr(performance_dtls,18,8) from ipl_player</ENTRY>
<ENTRY timestamp='12:52:50'>select * from ipl_player</ENTRY>
<ENTRY timestamp='12:52:54'>select substr(performance_dtls,18,8) from ipl_player</ENTRY>
<ENTRY timestamp='12:53:20'>select substr(performance_dtls,18,4) from ipl_player</ENTRY>
<ENTRY timestamp='12:53:28'>select substr(performance_dtls,18,7) from ipl_player</ENTRY>
<ENTRY timestamp='12:56:00'>select substr(performance_dtls,20,3) from ipl_player</ENTRY>
<ENTRY timestamp='12:56:08'>select substr(performance_dtls,21,3) from ipl_player</ENTRY>
<ENTRY timestamp='12:56:32'>select substr(performance_dtls,22,3) from ipl_player</ENTRY>
<ENTRY timestamp='12:56:57'>order by wkts desc</ENTRY>
<ENTRY timestamp='12:57:01'>select substr(performance_dtls,22,3) as wkts from ipl_player&#x0A;order by wkts desc</ENTRY>
<ENTRY timestamp='12:57:58'>select * from ipl_player</ENTRY>
<ENTRY timestamp='12:58:14'>select substr(performance_dtls,22,3) as wkts from ipl_player&#x0A;order by wkts desc</ENTRY>
<ENTRY timestamp='12:58:22'>select substr(performance_dtls,21,3) as wkts from ipl_player&#x0A;order by wkts desc</ENTRY>
<ENTRY timestamp='12:58:29'>select substr(performance_dtls,2&#x0A;0,3) as wkts from ipl_player&#x0A;order by wkts desc</ENTRY>
<ENTRY timestamp='12:58:32'>select substr(performance_dtls,20,3) as wkts from ipl_player&#x0A;order by wkts desc</ENTRY>
<ENTRY timestamp='12:58:40'>select substr(performance_dtls,20,3) as wkts from ipl_player&#x0A;order by wkts</ENTRY>
<ENTRY timestamp='12:58:57'>select substr(performance_dtls,18,7) as wkts from ipl_player&#x0A;order by wkts</ENTRY>
<ENTRY timestamp='12:59:12'>select * from ipl_player</ENTRY>
<ENTRY timestamp='13:00:49'>select * from ipl_match</ENTRY>
<ENTRY timestamp='13:00:53'>select * from ipl_bidder_points</ENTRY>
<ENTRY timestamp='13:01:02'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='13:01:07'>select * from ipl_match</ENTRY>
<ENTRY timestamp='13:01:27'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='13:01:33'>select * from ipl_bidder_points</ENTRY>
<ENTRY timestamp='13:05:50'>select * from ipl_match</ENTRY>
<ENTRY timestamp='13:06:04'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='13:06:33'>select * from ipl_match</ENTRY>
<ENTRY timestamp='13:10:02'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='13:10:14'>select * from ipl_match</ENTRY>
<ENTRY timestamp='13:10:19'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='13:10:23'>select bidder_id,&#x0A;sum(&#x0A;case&#x0A;when bid_team=</ENTRY>
<ENTRY timestamp='13:10:25'>select * from ipl_match</ENTRY>
<ENTRY timestamp='13:13:36'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='13:17:47'>select ims.match_id,bidder_id,ibd.schedule_id&#x0A;sum(&#x0A;case&#x0A;when bid_team=toss_winner then 1&#x0A;else 0&#x0A;end )  as total_toss_wins&#x0A;round(sum(case&#x0A;when bid_team=toss_winner then 1&#x0A;else 0&#x0A;end/100),2) as percentage_wins&#x0A;from ipl_bidding_details ibd join ipl_match_schedule ims&#x0A;on ibd.schedule_id=ims.schedule_id&#x0A;join ipl_match im on ims.match_id=im.match_id&#x0A;group by  ims.match_id,bidder_id,ibd.schedule_id&#x0A;order by percentage_wins desc</ENTRY>
<ENTRY timestamp='13:17:54'>select ims.match_id,bidder_id,ibd.schedule_id,&#x0A;sum(&#x0A;case&#x0A;when bid_team=toss_winner then 1&#x0A;else 0&#x0A;end )  as total_toss_wins&#x0A;round(sum(case&#x0A;when bid_team=toss_winner then 1&#x0A;else 0&#x0A;end/100),2) as percentage_wins&#x0A;from ipl_bidding_details ibd join ipl_match_schedule ims&#x0A;on ibd.schedule_id=ims.schedule_id&#x0A;join ipl_match im on ims.match_id=im.match_id&#x0A;group by  ims.match_id,bidder_id,ibd.schedule_id&#x0A;order by percentage_wins desc</ENTRY>
<ENTRY timestamp='13:18:00'>select ims.match_id,bidder_id,ibd.schedule_id,&#x0A;sum(&#x0A;case&#x0A;when bid_team=toss_winner then 1&#x0A;else 0&#x0A;end )  as total_toss_wins,&#x0A;round(sum(case&#x0A;when bid_team=toss_winner then 1&#x0A;else 0&#x0A;end/100),2) as percentage_wins&#x0A;from ipl_bidding_details ibd join ipl_match_schedule ims&#x0A;on ibd.schedule_id=ims.schedule_id&#x0A;join ipl_match im on ims.match_id=im.match_id&#x0A;group by  ims.match_id,bidder_id,ibd.schedule_id&#x0A;order by percentage_wins desc</ENTRY>
<ENTRY timestamp='13:18:39'>select ibp.bidder_id ,ibp.no_of_bids,ibd1.bidder_name,&#x0A;sum(case&#x0A;when bid_status like &quot;won&quot; then 1&#x0A;else 0&#x0A;end ) as total_wins,&#x0A;round(sum(case&#x0A;when bid_status like &quot;won&quot; then 1&#x0A;else 0&#x0A;end )/100,2) as  percentage_wins&#x0A;from ipl_user iu&#x0A;join ipl_bidder_details ibd1&#x0A;on iu.user_id=ibd1.user_id&#x0A;join ipl_bidder_points ibp&#x0A;join ipl_bidding_details ibd&#x0A;on ibd.bidder_id=ibp.bidder_id&#x0A;where bid_status like &quot;%won%&quot;&#x0A;group by ibp.bidder_id,ibp.no_of_bids,ibd1.bidder_name&#x0A;order by percentage_wins  desc</ENTRY>
<ENTRY timestamp='13:19:06'>select * from ipl_match</ENTRY>
<ENTRY timestamp='13:19:22'>select ims.match_id,bidder_id,ibd.schedule_id,&#x0A;sum(&#x0A;case&#x0A;when bid_team=toss_winner then 1&#x0A;else 0&#x0A;end )  as total_toss_wins,&#x0A;round(sum(case&#x0A;when bid_team=toss_winner then 1&#x0A;else 0&#x0A;end/100),2) as percentage_wins&#x0A;from ipl_bidding_details ibd join ipl_match_schedule ims&#x0A;on ibd.schedule_id=ims.schedule_id&#x0A;join ipl_match im on ims.match_id=im.match_id&#x0A;group by  ims.match_id,bidder_id,ibd.schedule_id&#x0A;order by percentage_wins desc</ENTRY>
<ENTRY timestamp='13:19:45'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='13:20:00'>select * from ipl_match</ENTRY>
<ENTRY timestamp='13:24:03'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='13:24:15'>select * from ipl_match</ENTRY>
<ENTRY timestamp='13:25:40'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='13:26:13'>select * from ipl_match</ENTRY>
<ENTRY timestamp='13:28:53'>select * from ipl_tournament</ENTRY>
<ENTRY timestamp='13:31:03'>select tournmt_id,tournmt_name,datediff(from_date,to_date)&#x0A;from ipl_tournament</ENTRY>
<ENTRY timestamp='13:31:14'>select * from ipl_tournament</ENTRY>
<ENTRY timestamp='13:31:28'>select tournmt_id,tournmt_name,datediff(to_date,from_date)&#x0A;from ipl_tournament</ENTRY>
<ENTRY timestamp='13:31:54'>order by duration desc</ENTRY>
<ENTRY timestamp='13:32:00'>select tournmt_id,tournmt_name,datediff(to_date,from_date) duration &#x0A;from ipl_tournament&#x0A;order by duration desc</ENTRY>
<ENTRY timestamp='13:33:23'>select tournmt_id,tournmt_name,max(datediff(to_date,from_date)) max_duration,&#x0A;min(datediff(to_date,from_date)) min_duration&#x0A;from ipl_tournament</ENTRY>
<ENTRY timestamp='13:33:37'>select tournmt_id,tournmt_name,max(datediff(to_date,from_date)) max_duration,&#x0A;min(datediff(to_date,from_date)) min_duration&#x0A;from ipl_tournament&#x0A;group by tournmt_id</ENTRY>
<ENTRY timestamp='13:34:17'>select tournmt_id,tournmt_name,datediff(to_date,from_date) max_duration,&#x0A;from ipl_tournament&#x0A;order by max_duration</ENTRY>
<ENTRY timestamp='13:34:21'>select tournmt_id,tournmt_name,datediff(to_date,from_date) max_duration&#x0A;from ipl_tournament&#x0A;order by max_duration</ENTRY>
<ENTRY timestamp='13:34:26'>select tournmt_id,tournmt_name,datediff(to_date,from_date) max_duration&#x0A;from ipl_tournament&#x0A;order by max_duration desc</ENTRY>
<ENTRY timestamp='13:35:15'>select tournmt_id,tournmt_name,From_date,to_date,(to_date,from_date) max_duration&#x0A;from ipl_tournament&#x0A;order by max_duration desc</ENTRY>
<ENTRY timestamp='13:35:32'>select tournmt_id,tournmt_name,From_date,to_date,datediff(to_date,from_date) max_duration&#x0A;from ipl_tournament&#x0A;order by max_duration desc</ENTRY>
<ENTRY timestamp='13:36:07'>select tournmt_id,tournmt_name,From_date,to_date,max(datediff(to_date,from_date)) max_duration&#x0A;from ipl_tournament&#x0A;order by max_duration desc</ENTRY>
<ENTRY timestamp='13:36:18'>select tournmt_id,tournmt_name,From_date,to_date,datediff(to_date,from_date) max_duration&#x0A;from ipl_tournament&#x0A;order by max_duration desc</ENTRY>
<ENTRY timestamp='13:37:29'>with dur as&#x0A;(select tournmt_id,tournmt_name,From_date,to_date,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by max_duration desc)&#x0A;select max(duration),min(duration) from dur</ENTRY>
<ENTRY timestamp='13:37:37'>with dur as&#x0A;(select tournmt_id,tournmt_name,From_date,to_date,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select max(duration),min(duration) from dur</ENTRY>
<ENTRY timestamp='13:37:44'>with dur as&#x0A;(select tournmt_id,tournmt_name,From_date,to_date,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select *,max(duration),min(duration) from dur</ENTRY>
<ENTRY timestamp='13:38:07'>with dur as&#x0A;(select tournmt_id,tournmt_name,From_date,to_date,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select *,max(duration),min(duration) from dur&#x0A;group by tournmt_id,tournmt_name</ENTRY>
<ENTRY timestamp='13:38:19'>with dur as&#x0A;(select tournmt_id,tournmt_name,From_date,to_date,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select *,max(duration),min(duration) from dur</ENTRY>
<ENTRY timestamp='13:39:39'>with dur as&#x0A;(select tournmt_id,tournmt_name,From_date,to_date,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select *,dense_rank()over(order by duration desc) as rank_pos&#x0A;from dur</ENTRY>
<ENTRY timestamp='13:40:16'>with dur as&#x0A;(select tournmt_id,tournmt_name,concat(From_date,&quot; &quot;,to_date) as duration_column,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select *,dense_rank()over(order by duration desc) as rank_pos&#x0A;from dur</ENTRY>
<ENTRY timestamp='13:41:35'>with dur1 as&#x0A;(with dur as&#x0A;(select tournmt_id,tournmt_name,concat(From_date,&quot; &quot;,to_date) as duration_column,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select *,dense_rank()over(order by duration desc) as rank_pos&#x0A;from dur)&#x0A;select min(rank_pos),max(rank_pos) from dur1</ENTRY>
<ENTRY timestamp='13:41:43'>with dur1 as&#x0A;(with dur as&#x0A;(select tournmt_id,tournmt_name,concat(From_date,&quot; &quot;,to_date) as duration_column,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select *,dense_rank()over(order by duration desc) as rank_pos&#x0A;from dur)&#x0A;select *,min(rank_pos),max(rank_pos) from dur1</ENTRY>
<ENTRY timestamp='13:41:55'>with dur1 as&#x0A;(with dur as&#x0A;(select tournmt_id,tournmt_name,concat(From_date,&quot; &quot;,to_date) as duration_column,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select *,dense_rank()over(order by duration desc) as rank_pos&#x0A;from dur)&#x0A;select *,min(rank_pos),max(rank_pos) from dur1&#x0A;group by tournmt_id</ENTRY>
<ENTRY timestamp='13:43:08'>with dur as&#x0A;(select tournmt_id,tournmt_name,concat(From_date,&quot; &quot;,to_date) as duration_column,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select * from dur</ENTRY>
<ENTRY timestamp='13:43:31'>with dur as&#x0A;(select tournmt_id,tournmt_name,concat(From_date,&quot; &quot;,to_date) as duration_column,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select * from dur&#x0A;limit 1</ENTRY>
<ENTRY timestamp='13:43:39'>with dur as&#x0A;(select tournmt_id,tournmt_name,concat(From_date,&quot; &quot;,to_date) as duration_column,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select * from dur&#x0A;limit 1,11</ENTRY>
<ENTRY timestamp='13:44:48'>with dur as&#x0A;(select tournmt_id,tournmt_name,concat(From_date,&quot; &quot;,to_date) as duration_column,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select * from dur&#x0A;limit 1&#x0A;order by duration desc limit 1</ENTRY>
<ENTRY timestamp='13:45:36'>with dur1 as&#x0A;(with dur as&#x0A;(select tournmt_id,tournmt_name,concat(From_date,&quot; &quot;,to_date) as duration_column,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select *,dense_rank()over(order by duration desc) as rank_pos&#x0A;from dur)&#x0A;select * from dur1</ENTRY>
<ENTRY timestamp='13:45:51'>with dur1 as&#x0A;(with dur as&#x0A;(select tournmt_id,tournmt_name,concat(From_date,&quot; &quot;,to_date) as duration_column,datediff(to_date,from_date) duration&#x0A;from ipl_tournament&#x0A;order by duration desc)&#x0A;select *,dense_rank()over(order by duration desc) as rank_pos&#x0A;from dur)&#x0A;select * from dur1&#x0A;where rank_pos in (1,5)</ENTRY>
<ENTRY timestamp='15:24:07'>select * from ipl_tournament</ENTRY>
<ENTRY timestamp='15:24:17'>select * from ipl_bidding_details</ENTRY>
<ENTRY timestamp='15:25:35'>select * from ipl_bidder_points</ENTRY>
<ENTRY timestamp='15:27:04'>select * from ipl_tournament</ENTRY>
<ENTRY timestamp='15:30:02'>select bidder_id,bidder_name,month(bid_date) as month_bid,sum(total_points) as tot_points&#x0A;from ipl_bidder_details ibd join ipl_bidder_points ibp on ibd.bidder_id=ibp.bidder_id&#x0A;join ipl_bidding_details ibd1 on ibp.BIDDER_ID=ibd1.BIDDER_ID&#x0A;where year(bid_date)=2017&#x0A;group by bidder_month&#x0A;order by tot_points desc month_bid asc</ENTRY>
<ENTRY timestamp='15:30:34'>select bidder_id,bidder_name,month(bid_date) as month_bid,sum(total_points) as tot_points&#x0A;from ipl_bidder_details ibd join ipl_bidder_points ibp on ibd.bidder_id=ibp.bidder_id&#x0A;join ipl_bidding_details ibd1 on ibp.BIDDER_ID=ibd1.BIDDER_ID&#x0A;where year(bid_date)=2017&#x0A;group by bidder_month&#x0A;order by tot_points,month_bid asc</ENTRY>
<ENTRY timestamp='15:30:45'>select ibp.bidder_id,bidder_name,month(bid_date) as month_bid,sum(total_points) as tot_points&#x0A;from ipl_bidder_details ibd join ipl_bidder_points ibp on ibd.bidder_id=ibp.bidder_id&#x0A;join ipl_bidding_details ibd1 on ibp.BIDDER_ID=ibd1.BIDDER_ID&#x0A;where year(bid_date)=2017&#x0A;group by bidder_month&#x0A;order by tot_points,month_bid asc</ENTRY>
<ENTRY timestamp='15:30:51'>select ibd.bidder_id,bidder_name,month(bid_date) as month_bid,sum(total_points) as tot_points&#x0A;from ipl_bidder_details ibd join ipl_bidder_points ibp on ibd.bidder_id=ibp.bidder_id&#x0A;join ipl_bidding_details ibd1 on ibp.BIDDER_ID=ibd1.BIDDER_ID&#x0A;where year(bid_date)=2017&#x0A;group by bidder_month&#x0A;order by tot_points,month_bid asc</ENTRY>
<ENTRY timestamp='15:31:23'>select ibd.bidder_id,bidder_name,month(bid_date) as month_bid,sum(total_points) as tot_points&#x0A;from ipl_bidder_details ibd join ipl_bidder_points ibp on ibd.bidder_id=ibp.bidder_id&#x0A;join ipl_bidding_details ibd1 on ibp.BIDDER_ID=ibd1.BIDDER_ID&#x0A;where year(bid_date)=2017&#x0A;group by month_bid&#x0A;order by tot_points,month_bid asc</ENTRY>
<ENTRY timestamp='15:31:58'>select ibd.bidder_id,bidder_name,month(bid_date) as month_bid,sum(total_points) as tot_points&#x0A;from ipl_bidder_details ibd join ipl_bidder_points ibp on ibd.bidder_id=ibp.bidder_id&#x0A;join ipl_bidding_details ibd1 on ibp.BIDDER_ID=ibd1.BIDDER_ID&#x0A;where year(bid_date)=2017&#x0A;group by month_bid,ibd.bidder_id,bidder_name&#x0A;order by tot_points,month_bid asc</ENTRY>
<ENTRY timestamp='15:32:12'>select ibd.bidder_id,bidder_name,month(bid_date) as month_bid,sum(total_points) as tot_points&#x0A;from ipl_bidder_details ibd join ipl_bidder_points ibp on ibd.bidder_id=ibp.bidder_id&#x0A;join ipl_bidding_details ibd1 on ibp.BIDDER_ID=ibd1.BIDDER_ID&#x0A;where year(bid_date)=2017&#x0A;group by month_bid,ibd.bidder_id,bidder_name&#x0A;order by tot_points desc,month_bid asc</ENTRY>
<ENTRY timestamp='15:32:39'>select ibd.bidder_id,bidder_name,month(bid_date) as month_bid,year(bid_date),sum(total_points) as tot_points&#x0A;from ipl_bidder_details ibd join ipl_bidder_points ibp on ibd.bidder_id=ibp.bidder_id&#x0A;join ipl_bidding_details ibd1 on ibp.BIDDER_ID=ibd1.BIDDER_ID&#x0A;where year(bid_date)=2017&#x0A;group by month_bid,ibd.bidder_id,bidder_name&#x0A;order by tot_points desc,month_bid asc</ENTRY>
<ENTRY timestamp='15:32:54'>select ibd.bidder_id,bidder_name,month(bid_date) as month_bid,year(bid_date) as year_bid,sum(total_points) as tot_points&#x0A;from ipl_bidder_details ibd join ipl_bidder_points ibp on ibd.bidder_id=ibp.bidder_id&#x0A;join ipl_bidding_details ibd1 on ibp.BIDDER_ID=ibd1.BIDDER_ID&#x0A;where year(bid_date)=2017&#x0A;group by month_bid,ibd.bidder_id,bidder_name,year_bid&#x0A;order by tot_points desc,month_bid asc</ENTRY>
<ENTRY timestamp='15:33:35'>select * from ipl_tournament</ENTRY>
<ENTRY timestamp='15:33:51'>select * from ipl_bidder_points</ENTRY>
<ENTRY timestamp='15:35:05'>select bidder_id from ipl_bidding_details where year(bid_date)=2017</ENTRY>
<ENTRY timestamp='15:41:33'>select ibd1.BIDDER_ID,bidder_name,month(bid_date) bid_month,year(bid_date) year_bid from ipl_bidder_details ibd1 where ibd1.bidder_id in(&#x0A;select ibp.bidder_id,sum(total_points) as tot_points from ipl_bidder_points ibp where ibp.bidder_id in(&#x0A;select bidder_id from ipl_bidding_details where ))</ENTRY>
<ENTRY timestamp='15:41:54'>select ibd1.BIDDER_ID,bidder_name,month(bid_date) bid_month,year(bid_date) year_bid from ipl_bidder_details ibd1 where ibd1.bidder_id in(&#x0A;select ibp.bidder_id,sum(total_points) as tot_points from ipl_bidder_points ibp where ibp.bidder_id in(&#x0A;select bidder_id from ipl_bidding_details where year(bid_date)=2017))</ENTRY>
<ENTRY timestamp='15:42:23'>select ibd1.BIDDER_ID,bidder_name,month(bid_date) bid_month,year(bid_date) year_bid from ipl_bidder_details ibd1 where ibd1.bidder_id in(&#x0A;select ibp.bidder_id,sum(total_points) as tot_points from ipl_bidder_points ibp where ibp.bidder_id in(&#x0A;select ibd.bidder_id from ipl_bidding_details ibd where year(ibd.bid_date)=2017))</ENTRY>
<ENTRY timestamp='15:44:53'>select ibd1.BIDDER_ID,bidder_name,year(bid_date) year_bid from ipl_bidder_details ibd1 where ibd1.bidder_id in(&#x0A;select ibp.bidder_id,sum(total_points) as tot_points from ipl_bidder_points ibp where ibp.bidder_id in(&#x0A;select ibd.bidder_id from ipl_bidding_details ibd where year(ibd.bid_date)=2017))</ENTRY>
<ENTRY timestamp='15:45:12'>select ibd1.BIDDER_ID,bidder_name from ipl_bidder_details ibd1 where ibd1.bidder_id in(&#x0A;select ibp.bidder_id,sum(total_points) as tot_points from ipl_bidder_points ibp where ibp.bidder_id in(&#x0A;select ibd.bidder_id from ipl_bidding_details ibd where year(ibd.bid_date)=2017))</ENTRY>
<ENTRY timestamp='15:53:09'>select bidder_id from ipl_bidding_details where year(BID_DATE)=2017</ENTRY>
<ENTRY timestamp='15:54:23'>select sum(total_points) from ipl_bidder_details where bidder_id in(&#x0A;select bidder_id from ipl_bidding_details where year(BID_DATE)=2017)</ENTRY>
<ENTRY timestamp='15:54:55'>select sum(total_points) from ipl_bidder_points where bidder_id in(&#x0A;select bidder_id from ipl_bidding_details where year(BID_DATE)=2017)</ENTRY>
<ENTRY timestamp='15:55:06'>select sum(total_points) from ipl_bidder_points where bidder_id in(&#x0A;select bidder_id from ipl_bidding_details where year(BID_DATE)=2017)&#x0A;group by bidder_id</ENTRY>
<ENTRY timestamp='15:55:14'>select bidder_id,sum(total_points) from ipl_bidder_points where bidder_id in(&#x0A;select bidder_id from ipl_bidding_details where year(BID_DATE)=2017)&#x0A;group by bidder_id</ENTRY>
<ENTRY timestamp='15:56:49'>select bidder_id,bidder_name from ipl_bidder_details where bidder_id in(&#x0A;select sum(total_points) from ipl_bidder_points where bidder_id in(&#x0A;select bidder_id from ipl_bidding_details where year(BID_DATE)=2017))&#x0A;group by bidder_id</ENTRY>
<ENTRY timestamp='15:56:55'>select bidder_id,bidder_name from ipl_bidder_details where bidder_id in(&#x0A;select sum(total_points) from ipl_bidder_points where bidder_id in(&#x0A;select bidder_id from ipl_bidding_details where year(BID_DATE)=2017))</ENTRY>
<ENTRY timestamp='15:57:17'>select bidder_id,bidder_name from ipl_bidder_details where bidder_id in(&#x0A;select sum(total_points) from ipl_bidder_points where bidder_id in(&#x0A;select bidder_id from ipl_bidding_details where year(BID_DATE)=2017))&#x0A;group by bidder_id,bidder_name</ENTRY>
<ENTRY timestamp='16:04:36'>select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id &#x0A;where year(bid_date)=2018</ENTRY>
<ENTRY timestamp='16:05:15'>select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018</ENTRY>
<ENTRY timestamp='16:05:30'>select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018&#x0A;group by ibd.bidder_id,bidder_name</ENTRY>
<ENTRY timestamp='16:05:52'>select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018&#x0A;group by ibd.bidder_id,bidder_name&#x0A;order by tot_bid_points desc</ENTRY>
<ENTRY timestamp='16:07:34'>select ibd.bidder_id,bidder_name,dense_rank()over(order by sum(total_points) )as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018&#x0A;group by ibd.bidder_id,bidder_name&#x0A;order by tot_bid_points desc</ENTRY>
<ENTRY timestamp='16:08:54'>with top as&#x0A;(select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018&#x0A;group by ibd.bidder_id,bidder_name&#x0A;order by tot_bid_points desc)&#x0A;select dense_rank()over(order by tot_bid_points) from top</ENTRY>
<ENTRY timestamp='16:09:00'>with top as&#x0A;(select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018&#x0A;group by ibd.bidder_id,bidder_name&#x0A;order by tot_bid_points desc)&#x0A;select *, dense_rank()over(order by tot_bid_points) from top</ENTRY>
<ENTRY timestamp='16:09:18'>with top as&#x0A;(select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018&#x0A;group by ibd.bidder_id,bidder_name)&#x0A;select *, dense_rank()over(order by tot_bid_points) from top</ENTRY>
<ENTRY timestamp='16:09:43'>with top as&#x0A;(select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018&#x0A;group by ibd.bidder_id,bidder_name)&#x0A;select *, dense_rank()over(order by tot_bid_points) as rank_pos from top&#x0A;order by tot_bid_points desc</ENTRY>
<ENTRY timestamp='16:09:56'>with top as&#x0A;(select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018&#x0A;group by ibd.bidder_id,bidder_name)&#x0A;select *, dense_rank()over(order by tot_bid_points) as rank_pos from top&#x0A;order by tot_bid_points desc ,rank_pos asc</ENTRY>
<ENTRY timestamp='16:11:34'>with top as&#x0A;(select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018&#x0A;group by ibd.bidder_id,bidder_name)&#x0A;select *, dense_rank()over(order by tot_bid_points) as rank_pos from top&#x0A;order by tot_bid_points desc&#x0A;limit 3</ENTRY>
<ENTRY timestamp='16:13:16'>union &#x0A;select * , dense_rank()over(order by tot_bid_points) as rank_pos from top&#x0A;order by tot_bid_points asc &#x0A;limit 3</ENTRY>
<ENTRY timestamp='16:19:07'>with top as&#x0A;(select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018&#x0A;group by ibd.bidder_id,bidder_name)&#x0A;&#x0A;(select *, dense_rank()over(order by tot_bid_points) as rank_pos from top&#x0A;order by tot_bid_points desc&#x0A;limit 3)</ENTRY>
<ENTRY timestamp='16:19:39'>select *, dense_rank()over(order by tot_bid_points) as rank_pos from top&#x0A;order by tot_bid_points asc&#x0A;limit 3</ENTRY>
select *, dense_rank()over(order by tot_bid_points) as rank_pos from top3_bottom3&#x0A;order by tot_bid_points desc&#x0A;limit 3</ENTRY>
create view top3_bottom3 as
select ibd.bidder_id,bidder_name,sum(total_points) as tot_bid_points from ipl_bidder_details ibd join ipl_bidding_details ibd1&#x0A;on ibd.bidder_id=ibd1.bidder_id  join ipl_bidder_points ibp on ibd1.BIDDER_ID=ibp.BIDDER_ID&#x0A;where year(bid_date)=2018&#x0A;group by ibd.bidder_id,bidder_name)</ENTRY>
select *, dense_rank()over(order by tot_bid_points) as rank_pos from top3_bottom3&#x0A;order by tot_bid_points desc&#x0A;limit 3</ENTRY>
select *, dense_rank()over(order by tot_bid_points) as rank_pos from top&#x0A;order by tot_bid_points asc&#x0A;limit 3</ENTRY>
select *, dense_rank()over(order by tot_bid_points) as rank_pos from top3_bottom3&#x0A;order by tot_bid_points asc&#x0A;limit 3</ENTRY>
select *, dense_rank()over(order by tot_bid_points) as rank_pos from top3_bottom3&#x0A;order by tot_bid_points desc&#x0A;limit 3&#x0A;union &#x0A;select *, dense_rank()over(order by tot_bid_points) as rank_pos from top3_bottom3&#x0A;order by tot_bid_points asc&#x0A;limit 3</ENTRY>
