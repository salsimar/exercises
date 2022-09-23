select wizard.firstname, wizard.lastname, player.enrollment_date from wizard
join player on wizard.id=player.wizard_id
where wizard.id in (select wizard_id from player where enrollment_date between "1995-01-01" and "1998-12-31");
select wizard.firstname, wizard.lastname, player.enrollment_date from wizard
join player on wizard.id=player.wizard_id
where wizard.id in (select wizard_id from player where enrollment_date between "1995-01-01" and "1998-12-31" and `role` like "keeper");
select wizard.firstname, wizard.lastname, player.`role` from wizard
join player on wizard.id=player.wizard_id
where wizard.id in (select wizard_id from player where enrollment_date between "1995-01-01" and "1998-12-31" and `role` like "chaser");
create view count_player_for_team as (SELECT team.name, player.role, count(wizard_id) as N_players FROM player, team WHERE team.id = player.team_id 
GROUP BY player.`role`, team.id);
drop view count_player_for_team; 
create view count_player_for_team as (SELECT team.name, player.role, count(wizard_id) as N_players FROM player, team WHERE team.id = player.team_id 
GROUP BY player.`role`, team.id);
select * from count_player_for_team;
select team.`name`, wizard.firstname, wizard.lastname, player.`role` from wizard
join player on wizard.id=player.wizard_id
join team on team_id=player.team_id
where wizard.id in (select wizard_id from player where `role` like "chaser" and team.name like "Gryffindor");
create view player_role_Gryffindor as (select team.`name`, wizard.firstname, wizard.lastname, player.`role` from wizard join player on wizard.id=player.wizard_id
join team on team_id=player.team_id where `role` like "chaser" and team.name like "Gryffindor");
select * from player_role_Gryffindor;