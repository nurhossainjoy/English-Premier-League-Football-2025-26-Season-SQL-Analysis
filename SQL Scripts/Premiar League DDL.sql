/* ============================================================
                    EPL PLAYER MATCH DATASET
   ============================================================

   Database    : PostgreSQL
   Table Name  : public.epl

   Description :
   This table stores English Premier League player-level
   match statistics and match information.

   SQL Category: DDL (Data Definition Language)

   ============================================================ */


CREATE TABLE public.epl (

    -- League Information
    league VARCHAR(50),
    season INTEGER,

    -- Game Information
    game VARCHAR(255),
    game_id VARCHAR(50),

    -- Player Information
    team VARCHAR(100),
    player VARCHAR(150),
    jersey_number INTEGER,
    nation VARCHAR(50),
    position VARCHAR(20),
    age VARCHAR(20),

    -- Player Match Statistics
    minutes INTEGER,
    goals INTEGER,
    assists INTEGER,

    penalty_goals INTEGER,
    penalty_attempts INTEGER,

    shots INTEGER,
    shots_on_target INTEGER,

    yellow_cards INTEGER,
    red_cards INTEGER,

    fouls_committed INTEGER,
    fouls_drawn INTEGER,

    offsides INTEGER,
    crosses INTEGER,

    tackles_won INTEGER,
    interceptions INTEGER,

    own_goals INTEGER,

    penalties_won INTEGER,
    penalties_conceded INTEGER,

    -- Match Date Information
    match_date VARCHAR(50),
    match_week INTEGER,
    match_day VARCHAR(20),
    kickoff_time TIME,

    -- Match Details
    home_team VARCHAR(100),
    away_team VARCHAR(100),
    match_score VARCHAR(20),

    venue VARCHAR(150),
    attendance INTEGER,

    referee VARCHAR(150)

);