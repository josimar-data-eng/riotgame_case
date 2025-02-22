# Riot Games Case

## Introduction

This project was created to deliver the result of an SQL challenge proposed by Riot Games during its interview process.


Challenge:

Having set the sample data, for each puuid:

1 - Provide their total number of kills, assists (assist_count), and deaths (death_count).<br />
2 - Calculate their KDA ratio (which is (Kills + Assists) / Deaths) and display with two decimal points (e.g. 1.45).<br />
3 - Provide their total number of rounds won and their round win rate (rounds won / total rounds played) display win rate as a percentage with no decimal points (e.g. 15%).<br />
4 - Provide the top 3 players an individual killed the most frequently ordered by the number of times they killed each puuid, if a player didn't kill 3 players display N/A for that spot. (use kill_victim_puuids column).<br />
5 - Provide the total number of headshots, legshots, and bodyshots for each player. [damage_done column]<br />
6 - Provide the headshot accuracy for each player (headshots / (headshots + legshots + bodyshots) as a percentage with 2 decimal points [damage_done]).<br />
7 - Provide percentile ranking each player's headshot accuracy.

## Technologies Used

This project leverages Python's built-in SQLite and Pandas for data processing:

SQLite → A lightweight, built-in database engine used for efficient data storage and querying. No installation is required as it comes with Python.

Pandas → A powerful data manipulation library used to load, transform, and analyze the CSV dataset. This is the only dependency that needs to be installed.

## Execution Instructions

To run this program it' necessary to install pandas library to make sure that all transformations will be executed correctly.

I suggest you to create a virtual environment, as a best practice, and run the code inside that.

### Creating Virtual Environment
 - Create venv:
    ```
    python3.10 -m venv {name_venv}
    ```
 - Activate venv: 
    ```
    source {name_venv}/bin/activate
    ```

 - Deactivate vm (ONLY AFTER GET THE EXECUTION DONE):
    ```
    deactivate
    ```


### Installing libraries
```
pip3 install -r requirements.txt
```

### Then run the main.py file in the root directory:
```
python3 main.py
```
<br />

## Results

<img width="587" alt="image" src="https://github.com/user-attachments/assets/b3998f94-696c-4e6f-aa2b-fd4321de64b9" />
<img width="1243" alt="image" src="https://github.com/user-attachments/assets/1053ab2a-d03b-42a5-b5b8-591188d4a358" />
<img width="506" alt="image" src="https://github.com/user-attachments/assets/17a7bcac-b414-44bd-92b9-826483a5f50e" />



