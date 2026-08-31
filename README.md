⚽ EPL SQL Data Analysis Project
<p align="center"> <strong>Exploring English Premier League Player and Match Statistics Using PostgreSQL</strong> </p> <p align="center"> A comprehensive SQL data analysis project covering player performance, team statistics, match insights, rankings, attendance, discipline, and advanced analytical techniques. </p>
📌 Project Overview

The EPL SQL Data Analysis Project is a comprehensive data analysis project developed using PostgreSQL and SQL. The project focuses on exploring and analyzing English Premier League (EPL) player-level and match-level statistics to generate meaningful insights into player performance, team performance, scoring efficiency, discipline, match participation, and other important aspects of football analytics.

The dataset contains detailed records of individual player performances across Premier League matches. Each record combines information related to the player, their team, the match, and their statistical contribution during that match.

Using SQL, the project progresses from basic data exploration to increasingly advanced analytical tasks. The analysis includes filtering, aggregation, grouping, conditional analysis, Common Table Expressions (CTEs), Window Functions, ranking techniques, and performance-based calculations.

The project was designed not only to answer football-related analytical questions but also to demonstrate practical SQL skills commonly used in data analytics and business intelligence environments.

🎯 Project Objectives

The main objectives of this project are to:

Explore and understand the structure of a real-world football dataset.
Analyze player-level performance across Premier League matches.
Compare performance across different teams.
Identify top-performing players based on goals, assists, and overall contribution.
Analyze player appearances and minutes played.
Calculate team-level scoring and performance statistics.
Examine shooting accuracy and goal conversion rates.
Analyze disciplinary records using yellow cards, red cards, and fouls.
Evaluate match attendance patterns.
Identify referees who officiated the highest number of matches.
Apply SQL techniques to solve progressively complex analytical problems.
Demonstrate practical use of PostgreSQL for data analysis.
🔄 Project Workflow

The project follows a structured data analysis workflow:

Raw EPL Dataset
        ↓
Database & Table Creation
        ↓
Data Import into PostgreSQL
        ↓
Data Cleaning & Data Type Conversion
        ↓
Initial Data Exploration
        ↓
Basic SQL Analysis
        ↓
Aggregation & Grouping
        ↓
Conditional Analysis
        ↓
CTEs & Window Functions
        ↓
Ranking & Performance Analysis
        ↓
Advanced Football Insights
🗂️ Dataset Overview

The dataset contains English Premier League player and match statistics.

Each row represents a player's statistical record associated with a particular match.

The dataset combines several categories of information:

👤 Player Information
Player Name
Jersey Number
Nationality
Position
Age
Team
⚽ Player Performance Statistics
Minutes Played
Goals
Assists
Penalty Goals
Penalty Attempts
Shots
Shots on Target
🛡️ Defensive Statistics
Tackles Won
Interceptions
🟨 Discipline Statistics
Yellow Cards
Red Cards
Fouls Committed
Fouls Drawn
🏟️ Match Information
Game ID
Match Date
Match Week
Match Day
Kickoff Time
Home Team
Away Team
Match Score
Venue
Attendance
Referee
📋 Dataset Columns
Column	Description
league	League name
season	Season identifier
game	Match description
team	Player's team
player	Player name
jersey_number	Player's jersey number
nation	Player nationality
position	Player's playing position
age	Player age
minutes	Minutes played
goals	Goals scored
assists	Assists provided
penalty_goals	Goals scored from penalties
penalty_attempts	Penalty attempts
shots	Total shots
shots_on_target	Shots on target
yellow_cards	Yellow cards received
red_cards	Red cards received
fouls_committed	Fouls committed
fouls_drawn	Fouls drawn
offsides	Offside occurrences
crosses	Crosses made
tackles_won	Successful tackles
interceptions	Interceptions made
own_goals	Own goals scored
penalties_won	Penalties won
penalties_conceded	Penalties conceded
game_id	Unique match identifier
match_date	Date of the match
match_week	Premier League match week
match_day	Day of the match
kickoff_time	Match kickoff time
home_team	Home team
away_team	Away team
match_score	Final match score
venue	Match venue
attendance	Match attendance
referee	Match referee
🛠️ Technologies Used

This project was developed using the following technologies:

Technology	Purpose
PostgreSQL	Database management and data storage
SQL	Data querying, manipulation, and analysis
pgAdmin 4	PostgreSQL database administration
GitHub	Version control and project documentation
📚 SQL Concepts Demonstrated

This project demonstrates a wide range of SQL concepts.

🔹 Basic SQL
SELECT
DISTINCT
WHERE
ORDER BY
LIMIT
🔹 Aggregation Functions
COUNT()
SUM()
AVG()
ROUND()
🔹 Data Grouping
GROUP BY
HAVING
🔹 Conditional Logic
CASE WHEN
Conditional filtering
NULLIF()
🔹 Advanced SQL
Common Table Expressions (WITH)
CTEs
Window Functions
RANK()
DENSE_RANK()
PARTITION BY
🔹 Data Cleaning
Data type conversion
ALTER TABLE
ALTER COLUMN
TYPE
USING
🟢 Easy Level Analysis

The first section of the project focuses on fundamental SQL concepts and basic data exploration.

Questions Covered
Display all unique teams that participated in the Premier League.
Identify the top players with the highest total goals.
Calculate player appearances for each team.
Find players who received at least one red card.
Calculate average minutes played by players for each team.
Calculate total goals and assists for every player.
Identify matches with attendance greater than 60,000.
SQL Concepts Used
SELECT
DISTINCT
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
COUNT()
SUM()
AVG()
🟡 Intermediate Level Analysis

The intermediate section introduces more complex calculations and multi-level analytical logic.

Questions Covered
Identify players with the highest goals-per-match ratio.
Calculate team-level goals, assists, yellow cards, and red cards.
Find players who scored more goals than the average player.
Analyze match-week statistics including goals, attendance, and number of matches.
Identify the referee who officiated the highest number of matches.
Find the player who played the most minutes for each team.
Calculate average shots on target per match for every team.
SQL Concepts Used
Subqueries
HAVING
Aggregate Functions
COUNT(DISTINCT ...)
CTEs
RANK()
GROUP BY
AVG()
🔴 Advanced Level Analysis

The advanced section focuses on complex analytical techniques and performance metrics.

Questions Covered
Rank players within each team based on total goals scored.
Identify players with the highest total goal contributions.
Find players who recorded both a goal and an assist in the same match.
Calculate goal conversion rates for every team.
Identify the player with the highest contribution to each team's performance.
Create an overall EPL Team Performance Report.
Determine the most disciplined team using a Fair Play Score.
📊 Key Analysis Performed

The project explores multiple dimensions of English Premier League performance.

⚽ Goal Scoring Analysis

The project identifies:

Top goal scorers.
Team goal totals.
Goal contributions.
Goals-per-match ratios.
Players scoring above average.
Team goal conversion rates.
🎯 Shooting Performance

The analysis evaluates:

Total shots.
Shots on target.
Average shots on target per match.
Goal conversion rates.

This helps evaluate how efficiently teams convert attacking opportunities into goals.

👥 Player Performance Analysis

The project analyzes:

Total appearances.
Minutes played.
Goals scored.
Assists provided.
Goal contributions.
Players with both goals and assists.
Player rankings within teams.
🏆 Team Performance Analysis

Team-level analysis includes:

Total goals.
Total assists.
Total shots.
Shots on target.
Player contributions.
Team performance reports.
🟨🟥 Discipline & Fair Play Analysis

The dataset is also used to evaluate disciplinary performance.

Metrics include:

Yellow cards.
Red cards.
Fouls committed.

A Fair Play Score is calculated using a weighted formula:

Fair Play Score =
(1 × Yellow Cards)
+
(3 × Red Cards)
+
(0.5 × Fouls Committed)

A lower Fair Play Score indicates better overall discipline.

🏟️ Match & Attendance Analysis

The project explores:

High-attendance matches.
Average attendance.
Match-week statistics.
Number of matches played.
Venue-related match information.
👨‍⚖️ Referee Analysis

The project identifies referees based on:

Number of matches officiated.
Match participation frequency.
🧠 Advanced Analytical Techniques

The project demonstrates several advanced SQL techniques.

Common Table Expressions (CTEs)

CTEs are used to simplify complex analytical queries and improve query readability.

Example structure:

WITH player_statistics AS (
    SELECT
        player,
        SUM(goals) AS total_goals
    FROM pl_stats
    GROUP BY player
)

SELECT *
FROM player_statistics;
Window Functions

Window Functions are used to perform ranking and comparison operations without collapsing the dataset.

Functions demonstrated include:

RANK()
DENSE_RANK()
PARTITION BY

Example:

DENSE_RANK() OVER (
    PARTITION BY team
    ORDER BY SUM(goals) DESC
)
📁 Project Structure
EPL-SQL-Data-Analysis/
│
├── README.md
│
├── Dataset/
│   └── epl.csv
│
├── Images/
│   └── epl_banner.webp
│
└── SQL/
    │
    ├── 01_create_table.sql
    │       └── Creates the PostgreSQL table
    │
    ├── 02_data_cleaning.sql
    │       └── Performs data type conversions and preparation
    │
    └── 03_epl_analysis.sql
            └── Contains all SQL analysis queries
🚀 How to Run This Project
Step 1: Clone the Repository
git clone https://github.com/YOUR-USERNAME/EPL-SQL-Data-Analysis.git
Step 2: Create a PostgreSQL Database

Create a new database in PostgreSQL using pgAdmin 4.

Example:

CREATE DATABASE epl_analysis;
Step 3: Create the Table

Run:

SQL/01_create_table.sql

This will create the pl_stats table.

Step 4: Import the Dataset

Import the EPL CSV dataset into PostgreSQL.

The dataset is located in:

Dataset/epl.csv
Step 5: Clean and Prepare the Data

Run:

SQL/02_data_cleaning.sql

This script performs necessary data type conversions.

Step 6: Run the Analysis Queries

Execute:

SQL/03_epl_analysis.sql

The file contains SQL queries ranging from basic analysis to advanced analytical techniques.

🎯 Skills Demonstrated

This project demonstrates practical knowledge of:

SQL Query Writing
PostgreSQL
Data Exploration
Data Cleaning
Data Type Conversion
Data Aggregation
Data Analysis
CTEs
Window Functions
Ranking Functions
Performance Metrics
Sports Data Analytics
GitHub Project Documentation
📈 Learning Outcomes

Through this project, the following practical SQL skills were developed and applied:

✔ Writing structured SQL queries
✔ Working with real-world datasets
✔ Performing data cleaning and transformation
✔ Using aggregate functions for analysis
✔ Applying GROUP BY and HAVING
✔ Creating reusable query logic with CTEs
✔ Using Window Functions for ranking
✔ Performing team and player performance analysis
✔ Calculating analytical metrics and ratios
✔ Organizing a professional SQL portfolio project

🔮 Future Improvements

Potential future enhancements for this project include:

Adding data visualizations using Power BI or Tableau.
Creating interactive dashboards.
Performing more advanced player performance analysis.
Adding team comparison dashboards.
Creating season-to-season comparisons.
Performing predictive analytics using Python.
Building a complete football analytics dashboard.
Integrating additional Premier League datasets.
👨‍💻 About the Author
MD Nur Hossain Joy

🎓 MBA, Institute of Business Administration (IBA)
🏛️ University of Rajshahi

💼 Professional Background
Former Finance Executive — MetLife Bangladesh
Former Accounts & Finance Executive — IFAD Motors
📊 Current Focus

I am currently developing practical expertise in:

SQL
PostgreSQL
Data Analysis
Data Analytics

My professional background is primarily in Finance and Accounts, and I am actively expanding my technical skills in SQL and Data Analytics.

This project represents part of my learning journey toward building practical expertise in data-driven analysis and analytical problem-solving.
