/* ============================================================
                    EPL SQL DATA ANALYSIS PROJECT
   ============================================================

   Database    : PostgreSQL
   Table       : public.pl_stats
   Author	   : MD NUR HOSSAIN JOY
   Education   : Institute of Business Administration, 
                 University Of Rajshahi

   Description:
   This project analyzes English Premier League player-level
   match statistics using SQL.

   The analysis covers:

   • Player Performance
   • Team Performance
   • Goal & Assist Analysis
   • Match Statistics
   • Attendance Analysis
   • Referee Analysis
   • Window Functions
   • Common Table Expressions (CTEs)
   • Ranking Analysis
   • Advanced Performance Metrics

   ============================================================ */


/* ============================================================
                    DATA TYPE MODIFICATIONS
   ============================================================ */

ALTER TABLE pl_stats
ALTER COLUMN match_date TYPE DATE
USING match_date::DATE;

ALTER TABLE pl_stats
ALTER COLUMN attendance TYPE NUMERIC
USING attendance::NUMERIC;


/* ============================================================
                    EPL SQL ANALYSIS
   ============================================================ */


/* ============================================================
                    🟢 EASY LEVEL
   ============================================================ */


/* ------------------------------------------------------------
   Question 1
   Display all unique teams that participated in the
   Premier League.
   ------------------------------------------------------------ */

SELECT DISTINCT
    team
FROM pl_stats
ORDER BY team;


/* ------------------------------------------------------------
   Question 2
   List the Top 10 players with the highest total goals scored.
   ------------------------------------------------------------ */

SELECT
    player,
    SUM(goals) AS total_goals
FROM pl_stats
GROUP BY player
ORDER BY total_goals DESC
LIMIT 10;


/* ------------------------------------------------------------
   Question 3
   Find the total number of player appearances for each team.
   ------------------------------------------------------------ */

SELECT
    team,
    COUNT(DISTINCT game_id) AS total_player_appearances
FROM pl_stats
GROUP BY team
ORDER BY total_player_appearances DESC;


/* ------------------------------------------------------------
   Question 4
   Display all players who received at least one red card
   during the season.
   ------------------------------------------------------------ */

SELECT
    player,
    SUM(red_cards) AS total_red_cards
FROM pl_stats
GROUP BY player
HAVING SUM(red_cards) > 0
ORDER BY total_red_cards DESC;


/* ------------------------------------------------------------
   Question 5
   Calculate the average minutes played by players for each team.
   ------------------------------------------------------------ */

SELECT
    team,
    ROUND(AVG(minutes), 2) AS average_minutes_played
FROM pl_stats
GROUP BY team
ORDER BY average_minutes_played DESC;


/* ------------------------------------------------------------
   Question 6
   Find the total goals and total assists for every player.
   ------------------------------------------------------------ */

SELECT
    player,
    SUM(goals) AS total_goals,
    SUM(assists) AS total_assists,
    SUM(goals) + SUM(assists) AS goal_contributions
FROM pl_stats
GROUP BY player
ORDER BY goal_contributions DESC;


/* ------------------------------------------------------------
   Question 7
   List all matches where the attendance was greater than 60,000.
   ------------------------------------------------------------ */

SELECT DISTINCT
    game_id,
    match_date,
    match_week,
    match_day,
    home_team,
    away_team,
    match_score,
    venue,
    attendance,
    referee
FROM pl_stats
WHERE attendance > 60000
ORDER BY attendance DESC;


/* ============================================================
                    🟡 INTERMEDIATE LEVEL
   ============================================================*/


/* ------------------------------------------------------------
   Question 8
   Find the Top 5 players with the highest goals-per-match ratio,
   considering only players who made at least 10 appearances.
   ------------------------------------------------------------ */

SELECT
    player,
    SUM(goals) AS total_goals,
    COUNT(DISTINCT game_id) AS total_appearances,
    ROUND(
        SUM(goals)::NUMERIC
        / COUNT(DISTINCT game_id),
        2
    ) AS goals_per_match
FROM pl_stats
GROUP BY player
HAVING COUNT(DISTINCT game_id) >= 10
ORDER BY goals_per_match DESC
LIMIT 5;


/* ------------------------------------------------------------
   Question 9
   Calculate the following statistics for each team:

   • Total Goals
   • Total Assists
   • Total Yellow Cards
   • Total Red Cards

   Sort the results by total goals in descending order.
   ------------------------------------------------------------ */

SELECT
    team,
    SUM(goals) AS total_goals,
    SUM(assists) AS total_assists,
    SUM(yellow_cards) AS total_yellow_cards,
    SUM(red_cards) AS total_red_cards
FROM pl_stats
GROUP BY team
ORDER BY total_goals DESC;


/* ------------------------------------------------------------
   Question 10
   Find all players who scored more goals than the average
   goals scored by all players.
   ------------------------------------------------------------ */

WITH player_goals AS (

    SELECT
        player,
        SUM(goals) AS total_goals
    FROM pl_stats
    GROUP BY player

)

SELECT
    player,
    total_goals
FROM player_goals
WHERE total_goals > (
    SELECT AVG(total_goals)
    FROM player_goals
)
ORDER BY total_goals DESC;


/* ------------------------------------------------------------
   Question 11
   For each match week, calculate:

   • Total Goals
   • Average Attendance
   • Number of Matches Played
   ------------------------------------------------------------ */

SELECT
    match_week,
    SUM(goals) AS total_goals,
    ROUND(AVG(attendance), 0) AS average_attendance,
    COUNT(DISTINCT game_id) AS number_of_matches
FROM pl_stats
GROUP BY match_week
ORDER BY match_week;


/* ------------------------------------------------------------
   Question 12
   Identify the referee who officiated the highest number
   of matches.
   ------------------------------------------------------------ */

SELECT
    referee,
    COUNT(DISTINCT game_id) AS matches_officiated
FROM pl_stats
GROUP BY referee
ORDER BY matches_officiated DESC
LIMIT 1;


/* ------------------------------------------------------------
   Question 13
   Find the player who played the most minutes for each team.

   Concept Used:
   • CTE
   • RANK() Window Function
   ------------------------------------------------------------ */

WITH minutes_played AS (

    SELECT
        team,
        player,
        SUM(minutes) AS total_minutes,
        RANK() OVER (
            PARTITION BY team
            ORDER BY SUM(minutes) DESC
        ) AS player_rank

    FROM pl_stats

    GROUP BY
        team,
        player

)

SELECT
    team,
    player,
    total_minutes
FROM minutes_played
WHERE player_rank = 1
ORDER BY total_minutes DESC;


/* ------------------------------------------------------------
   Question 14
   Calculate the average number of shots on target per match
   for every team.
   ------------------------------------------------------------ */

WITH team_match_stats AS (

    SELECT
        team,
        game_id,
        SUM(shots_on_target) AS shots_on_target_per_match
    FROM pl_stats
    GROUP BY
        team,
        game_id

)

SELECT
    team,
    ROUND(
        AVG(shots_on_target_per_match),
        2
    ) AS average_shots_on_target
FROM team_match_stats
GROUP BY team
ORDER BY average_shots_on_target DESC;


/* ============================================================
                    🔴 ADVANCED LEVEL
   ============================================================ */


/* ------------------------------------------------------------
   Question 15
   Rank players within each team based on their total goals
   scored using the DENSE_RANK() window function.
   ------------------------------------------------------------ */

WITH goal_statistics AS (

    SELECT
        team,
        player,
        SUM(goals) AS total_goals,

        DENSE_RANK() OVER (
            PARTITION BY team
            ORDER BY SUM(goals) DESC
        ) AS goal_rank

    FROM pl_stats

    GROUP BY
        team,
        player

)

SELECT
    team,
    player,
    total_goals
FROM goal_statistics
WHERE goal_rank = 1
ORDER BY total_goals DESC;


/* ------------------------------------------------------------
   Question 16
   Find the Top 10 players with the highest number of
   total goal contributions.

   Goal Contribution = Goals + Assists
   ------------------------------------------------------------ */

SELECT
    player,
    SUM(goals) AS total_goals,
    SUM(assists) AS total_assists,
    SUM(goals) + SUM(assists) AS total_goal_contributions
FROM pl_stats
GROUP BY player
ORDER BY total_goal_contributions DESC
LIMIT 10;


/* ------------------------------------------------------------
   Question 17
   Identify players who recorded both a goal and an assist
   in the same match.

   Display the number of matches where each player recorded
   both a goal and an assist.
   ------------------------------------------------------------ */

SELECT
    team,
    player,
    COUNT(DISTINCT game_id) AS matches_with_goal_and_assist
FROM pl_stats
WHERE goals >= 1
  AND assists >= 1
GROUP BY
    team,
    player
ORDER BY matches_with_goal_and_assist DESC;


/* ------------------------------------------------------------
   Question 18
   Calculate the goal conversion rate for every team.

   Formula:

   Conversion Rate =
   Total Goals ÷ Total Shots
   ------------------------------------------------------------ */

SELECT
    team,
    SUM(goals) AS total_goals,
    SUM(shots) AS total_shots,

    ROUND(
        SUM(goals)::NUMERIC
        / NULLIF(SUM(shots), 0),
        3
    ) AS goal_conversion_rate

FROM pl_stats

GROUP BY team

ORDER BY goal_conversion_rate DESC;


/* ------------------------------------------------------------
   Question 19
   For each team, identify the player who contributed the
   highest percentage of the team's total goals.

   Goal Contribution =
   Goals + Assists
   ------------------------------------------------------------ */

WITH player_statistics AS (

    SELECT
        team,
        player,
        SUM(goals) AS total_goals,
        SUM(assists) AS total_assists,
        SUM(goals) + SUM(assists) AS goal_contributions,

        DENSE_RANK() OVER (
            PARTITION BY team
            ORDER BY SUM(goals) + SUM(assists) DESC
        ) AS contribution_rank

    FROM pl_stats

    GROUP BY
        team,
        player

),

team_statistics AS (

    SELECT
        team,
        SUM(goals) AS team_total_goals
    FROM pl_stats
    GROUP BY team

)

SELECT
    ps.team,
    ps.player,
    ps.total_goals,
    ps.total_assists,
    ps.goal_contributions,
    ts.team_total_goals,

    ROUND(
        (
            ps.goal_contributions::NUMERIC
            * 100
        )
        / NULLIF(ts.team_total_goals, 0),
        2
    ) AS contribution_percentage

FROM player_statistics ps

JOIN team_statistics ts
    ON ps.team = ts.team

WHERE ps.contribution_rank = 1

ORDER BY contribution_percentage DESC;


/* ------------------------------------------------------------
   Question 20
   Create an overall EPL Team Performance Report.

   Display:

   • Team
   • Total Goals
   • Total Assists
   • Total Shots
   • Total Shots on Target
   • Total Yellow Cards
   • Total Red Cards
   • Total Fouls Committed
   • Goal Conversion Rate
   ------------------------------------------------------------ */

SELECT
    team,

    SUM(goals) AS total_goals,
    SUM(assists) AS total_assists,

    SUM(shots) AS total_shots,
    SUM(shots_on_target) AS total_shots_on_target,

    SUM(yellow_cards) AS total_yellow_cards,
    SUM(red_cards) AS total_red_cards,

    SUM(fouls_committed) AS total_fouls_committed,

    ROUND(
        SUM(goals)::NUMERIC
        / NULLIF(SUM(shots), 0),
        3
    ) AS goal_conversion_rate

FROM pl_stats

GROUP BY team

ORDER BY
    total_goals DESC,
    goal_conversion_rate DESC;


/* ------------------------------------------------------------
   Question 21
   Determine the most disciplined team by calculating a
   Fair Play Score.

   Formula:

   Fair Play Score =
   (1 × Yellow Cards)
   + (3 × Red Cards)
   + (0.5 × Fouls Committed)

   A lower score indicates better discipline.
   ------------------------------------------------------------ */

SELECT
    team,

    SUM(yellow_cards) AS total_yellow_cards,
    SUM(red_cards) AS total_red_cards,
    SUM(fouls_committed) AS total_fouls_committed,

    (
        SUM(yellow_cards) * 1
        + SUM(red_cards) * 3
        + SUM(fouls_committed) * 0.5
    ) AS fair_play_score

FROM pl_stats

GROUP BY team

ORDER BY fair_play_score ASC;
/* ============================================================
                    🟢 END OF PROJECT 🟢
   ============================================================ */