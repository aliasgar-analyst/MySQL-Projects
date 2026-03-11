CREATE DATABASE Sky_Sports;

USE Sky_Sports;

SELECT DISTINCT team 
FROM world_cup_standings;

SELECT team 
FROM world_cup_standings 
WHERE `group` = 7 AND `rank` = 1;

SELECT COUNT(team) 
FROM world_cup_standings;

SELECT team, matches_played 
FROM world_cup_standings;

SELECT team, (wins * 100.0 / matches_played) AS wins_percent 
FROM world_cup_standings;

SELECT team, goals_scored 
FROM world_cup_standings 
WHERE goals_scored = (SELECT MAX(goals_scored) FROM world_cup_standings);

SELECT team, ROUND((draws * 100.0 / matches_played), 2) AS draws_percent 
FROM world_cup_standings;

SELECT team, goals_scored 
FROM world_cup_standings 
WHERE goals_scored = (SELECT MIN(goals_scored) FROM world_cup_standings);

SELECT team, (losses * 100.0 / matches_played) AS losses_percent 
FROM world_cup_standings 
ORDER BY losses ASC;

SELECT AVG(goal_difference) 
FROM world_cup_standings;

SELECT team 
FROM world_cup_standings 
WHERE points = 0;

SELECT * FROM world_cup_standings 
WHERE expected_goal_scored < exp_goal_conceded;

SELECT * FROM world_cup_standings 
WHERE exp_goal_difference BETWEEN -0.5 AND 0.5;

SELECT * FROM world_cup_standings 
ORDER BY exp_goal_difference_per_90 ASC;

SELECT team, players_used 
FROM team_performance_stats 
WHERE players_used = (SELECT MAX(players_used) FROM team_performance_stats);

SELECT team, avg_age 
FROM team_performance_stats 
ORDER BY avg_age ASC;

SELECT AVG(possession) 
FROM team_performance_stats;

SELECT team, games 
FROM team_performance_stats 
WHERE games >= 5;

SELECT * FROM team_performance_stats 
WHERE minutes > 600;

SELECT team, goals, assists 
FROM team_performance_stats 
ORDER BY goals ASC;

SELECT team, pens_made, pens_att 
FROM team_performance_stats 
ORDER BY pens_made DESC;

SELECT team, cards_yellow, cards_red 
FROM team_performance_stats 
WHERE cards_red = 1 
ORDER BY cards_yellow ASC;

SELECT team, goals_per90, assists_per90, goals_assists_per90 
FROM team_performance_stats 
ORDER BY goals_assists_per90 DESC;

SELECT team, goals_pens_per90, goals_assists_pens_per90 
FROM team_performance_stats 
ORDER BY goals_assists_pens_per90 ASC;

SELECT team, shots, shots_on_target, shots_on_target_pct 
FROM team_performance_stats 
WHERE shots_on_target_pct < 30 
ORDER BY shots_on_target_pct ASC;

SELECT team, shots_per90, shots_on_target_per90 
FROM team_performance_stats 
WHERE team = 'Belgium';

SELECT team, goals_per_shot, goals_per_shot_on_target, average_shot_distance 
FROM team_performance_stats 
ORDER BY average_shot_distance DESC;

SELECT team, errors, touches 
FROM team_performance_stats 
WHERE errors = 0 AND touches < 1500;

SELECT team, fouls 
FROM team_performance_stats 
WHERE fouls = (SELECT MAX(fouls) FROM team_performance_stats);

SELECT team, offsides 
FROM team_performance_stats 
WHERE offsides < 10 OR offsides > 20;

SELECT team, aerials_won, aerials_lost, aerials_won_pct 
FROM team_performance_stats 
ORDER BY aerials_won_pct DESC;

SELECT `group`, COUNT(team) AS team_count 
FROM world_cup_standings 
GROUP BY `group`;

SELECT team 
FROM world_cup_standings 
WHERE `group` = 6;

SELECT `group`
FROM world_cup_standings 
WHERE team = 'Australia';

SELECT `group`, AVG(wins) AS avg_wins 
FROM world_cup_standings 
GROUP BY `group`;

SELECT `group`, MAX(expected_goal_scored) AS max_xG 
FROM world_cup_standings 
GROUP BY `group`
ORDER BY max_xG ASC;

SELECT `group`, MIN(exp_goal_conceded) AS min_xG_conceded 
FROM world_cup_standings 
GROUP BY `group`
ORDER BY min_xG_conceded DESC;

SELECT `group`, AVG(exp_goal_difference_per_90) AS avg_exp_diff_90 
FROM world_cup_standings 
GROUP BY `group`
ORDER BY avg_exp_diff_90 ASC;

SELECT team 
FROM world_cup_standings 
WHERE goals_scored = goals_against;

SELECT team, players_used 
FROM team_performance_stats 
WHERE players_used = (SELECT MAX(players_used) FROM team_performance_stats);

SELECT team, players_used, avg_age, games, minutes 
FROM team_performance_stats 
WHERE minutes > 200 AND minutes < 500;

SELECT * FROM world_cup_standings 
ORDER BY points ASC;

SELECT DISTINCT team 
FROM world_cup_standings 
ORDER BY team ASC;

SELECT s.`group`, AVG(p.avg_age) as average_age
FROM world_cup_standings s
JOIN team_performance_stats p ON s.team = p.team
GROUP BY s.`group`
ORDER BY average_age DESC;

SELECT s.`group`, SUM(p.fouls) as total_fouls
FROM world_cup_standings s
JOIN team_performance_stats p ON s.team = p.team
GROUP BY s.`group`
ORDER BY total_fouls ASC;

SELECT s.`group`, SUM(p.games) as total_games
FROM world_cup_standings s
JOIN team_performance_stats p ON s.team = p.team
GROUP BY s.`group`
ORDER BY total_games DESC;

SELECT s.`group`, SUM(p.players_used) as total_players
FROM world_cup_standings s
JOIN team_performance_stats p ON s.team = p.team
GROUP BY s.`group`
ORDER BY total_players ASC;

SELECT s.`group`, SUM(p.offsides) as total_offsides
FROM world_cup_standings s
JOIN team_performance_stats p ON s.team = p.team
GROUP BY s.`group`
ORDER BY total_offsides ASC;

SELECT s.`group`, AVG(p.passes_pct) as avg_pass_accuracy
FROM world_cup_standings s
JOIN team_performance_stats p ON s.team = p.team
GROUP BY s.`group`
ORDER BY avg_pass_accuracy DESC;

SELECT s.`group`, AVG(p.goals_per90) as avg_goals_90
FROM world_cup_standings s
JOIN team_performance_stats p ON s.team = p.team
GROUP BY s.`group`
ORDER BY avg_goals_90 ASC;












