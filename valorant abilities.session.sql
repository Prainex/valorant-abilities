-- DROP DATABASE valorant_abilities;

create DATABASE valorant_abilities;
use valorant_abilities;

CREATE TABLE Abilities (
    ability_id INT PRIMARY KEY AUTO_INCREMENT,
    ability_name VARCHAR(40) NOT NULL,
    ability_cost INT NOT NULL
);

CREATE TABLE Agents (
    agent_id INT PRIMARY KEY AUTO_INCREMENT,
    agent_name VARCHAR (40) NOT NULL,
    agent_role VARCHAR (10) NOT NULL
);

CREATE TABLE Agent_Abilities (
    aa_id INT PRIMARY KEY AUTO_INCREMENT,
    agent_id INT NOT NULL,
    ability_id INT NOT NULL,
    FOREIGN KEY (ability_id) REFERENCES Abilities (ability_id),
    FOREIGN KEY (agent_id) REFERENCES Agents (agent_id)
);

CREATE TABLE Ultimates (
    ult_id INT PRIMARY KEY AUTO_INCREMENT,
    agent_id INT NOT NULL,
    ult_name VARCHAR(40),
    ult_cost INT NOT NULL,
    FOREIGN KEY (agent_id) REFERENCES Agents (agent_id)
);

CREATE TABLE Recon ( 
    recon_id INT PRIMARY KEY AUTO_INCREMENT,
    aa_id INT NOT NULL,
    duration INT NOT NULL,
    recharge INT,
    pings INT,
    FOREIGN KEY (aa_id) REFERENCES Agent_Abilities (aa_id)
);

CREATE TABLE Damage (
    damage_id INT PRIMARY KEY AUTO_INCREMENT,
    aa_id INT NOT NULL,
    dps INT NOT NULL,
    full_damage INT NOT NULL,
    FOREIGN KEY (aa_id) REFERENCES Agent_Abilities (aa_id)
);

CREATE TABLE Smokes (
    smoke_id INT PRIMARY KEY AUTO_INCREMENT,
    aa_id INT NOT NULL,
    min_duration INT NOT NULL,
    full_duration INT NOT NULL,
    recharge INT NOT NULL,
    FOREIGN KEY (aa_id) REFERENCES Agent_Abilities (aa_id)
);

CREATE TABLE Decay ( 
    decay_id INT PRIMARY KEY AUTO_INCREMENT,
    aa_id INT NOT NULL,
    duration INT NOT NULL,
    full_damage INT NOT NULL, 
    FOREIGN KEY (aa_id) REFERENCES Agent_Abilities (aa_id)
);

CREATE TABLE Stun (
    stun_id INT PRIMARY KEY AUTO_INCREMENT,
    aa_id INT NOT NULL,
    duration INT NOT NULL,
    FOREIGN KEY (aa_id) REFERENCES Agent_Abilities (aa_id)
);
