# Soccer Scouting SQL Project
A (practical) personal SQL project on my genuine interest in soccer. This project aims to provide a streamlined solution for storing and analyzing data related to youth players' statistics. 

## EER Diagram 
![diagram](https://github.com/khlong189/soccer_scouting/assets/57957853/bc346c71-944b-47c3-871a-0aeb36a0b84c)

## Functional Dependencies
- agents(agent_id) -> agents(first_name, last_name, agency_name, contact_info, num_client)
- academies(academy_id) -> academies(academy_name, city, country, contact_info)
- players(player_id) -> players(first_name, last_name, birthdate, city, country, nationality, lang, height, weight, foot, academy_id, agent_id)
- attack(attk_id) -> attack(season, games, goals, hd_goals, rf_goals, lf_goals, fk_goals, pen_goals, shots, shots_target, shoot_acc, bc_misses)
- defend(def_id) -> defend(season, games, tackles, tackles_succ, blocked_shots, intercept, clear, hd_clear, recoveries, duels_won, duels_lost)
- teamplay(tp_id) -> teamplay(season, games, assists, passes, big_chances, crss, crss_acc, through_ball, acc_long_balls)
- discipline(dis_id) -> discipline(season, games, yellow, red, fouls, offsides)
- goalkeep(gk_id) -> goalkeep(season, games, saves, pen_saves, punches, high_claims, catches, sweep_clear, throw_outs)
- player_stat(stat_id) -> player_stat(player_id, pos, tp_id, attk_id, def_id, tp_id, dis_id, gk_id).
