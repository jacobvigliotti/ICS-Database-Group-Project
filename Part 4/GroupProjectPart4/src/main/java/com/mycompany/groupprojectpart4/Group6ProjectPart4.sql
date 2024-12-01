drop database if exists GroupSixProject;
create database if not exists GroupSixProject;
use GroupSixProject;

create table users (
	userID int,
	fname varchar(20),
	lname varchar(20),
	role enum('illustrator', 'developer', 'player'),
	primary key(userID)
	);
    
    create table artworks (
	artID int,
    artFranchise varchar(20),
    artTitle varchar(20),
    artSubtitle varchar(20),
    illustrator int,
    primary key(artID),
    foreign key (illustrator) references users(userID)
    );
	
drop table if exists games;
create table games (
	gameID int auto_increment,
    gameType enum('Competitive', 'Casual'),
    gameDate date,
    gameLoc varchar(20),
    gameHost int,
    primary key(gameID),
    foreign key (gameHost) references users(userID)
    );
	
drop table if exists sets;
create table sets (
	setID int,
    setName varchar(35),
    setRelease date,
    primary key(setID)
    );
    
    drop table if exists decks;
    create table decks (
	deckID int,
    deckName varchar(35),
    deckOwner int,
    primary key(deckID),
    foreign key (deckOwner) references users(userID)
    );
    
create table cards (
	cardNum int,
	cardSet int,
    cardColor varchar(20),		
    cardType varchar(20),
    cardCreator int,
    cardArtwork int,
    primary key(cardNum, cardSet),
    foreign key (cardCreator) references users(userID),
    foreign key (cardArtwork) references artworks(artID)
    );
    
    create table cardInstances (
	cardInstID int,
	cardNum int, 
    cardSet int,
    cardOwner int,
    cardCond enum('New', 'Good', 'Fair', 'Poor'), 
    cardDeck int, 
    primary key(cardInstId),
	foreign key (cardNum, cardSet) references cards(cardNum, cardSet),
    foreign key (cardOwner) references users(userID),
    foreign key (cardDeck) references decks(deckID)
    );
    
drop table if exists transactions;
create table transactions (
	transID int, 				/*int to represent id of this transaction */
	cardInstID int,				/* int to represent the id of the card instance*/
    initiator int,				/* int to represent the userID of the seller*/
    initiatedOn date, 			
    price float,
    buyer int,					/*int for the UserID of the buyer*/
    primary key (transID, cardInstID, initiator),
	foreign key (initiator) references users(userID),
    foreign key (cardInstID) references cardInstances(cardInstID),
    foreign key (buyer) references users(userID)
	);

    

insert into users values (1, 'Jochem ', 'VanGool', 'illustrator');
insert into users values (2, 'Brianna ', 'Garcia', 'illustrator');
insert into users values (3, 'John ', 'Loren', 'illustrator');
insert into users values (4, 'Matthew ', 'Davis', 'illustrator');
insert into users values (5, 'Mila ', 'Useche', 'illustrator');
insert into users values (6, 'John', 'Doe', 'player');
insert into users values (7, 'Jane', 'Deer', 'player');
insert into users values (8, 'Jake', 'Vigliotti', 'player');
insert into users values (9, 'Justin ', 'Johnson', 'player');
insert into users values (10, 'Mason ', 'Day', 'player');
insert into users values (11, 'Ryan ', 'Miller', 'developer');
insert into users values (12, 'Steve ', 'Warner', 'developer');
insert into users values (13, 'Kenneth', 'Anderson', 'illustrator');
insert into users values (14, 'Tanisha', 'Cherislin', 'illustrator');
insert into users values (15, 'Jeremy', 'Adams', 'illustrator');
insert into users values (16, 'Cesar', 'Vegra', 'illustrator');

insert into artworks values (1, 'Mickey Mouse', 'Goofy', 'Musketeer', 1);
insert into artworks values (2, 'Big Hero 6', 'Baymax', 'Armored Companion', 2);
insert into artworks values (3, 'The Little Mermaid', 'Ariels Grotto', 'A Secret Place', 13);
insert into artworks values (4, 'The Little Mermaid', 'Ariel', 'On Human Legs', 4);
insert into artworks values (5, 'Moana', 'You''re Welcome', null, 16);

insert into games values (1, 'Competitive', '2024-11-02', 'Mall of America', 7);
insert into games values (2, 'Casual', '2024-12-13', 'John''s house', 6);
insert into games values (3, 'Casual', '2021-12-02', 'Community Center', 8);
insert into games values (4, 'Competitive', '2025-04-05', 'Library', 9);
insert into games values (5, 'Competitive', '2023-09-23', 'Game Shop', 10);

insert into sets values (1, 'The First Chapter', '2023-08-18');
insert into sets values (2, 'Rise of the Floodborn', '2023-11-17');
insert into sets values (3, 'Into the Inklands', '2024-02-23');
insert into sets values (4, 'Ursula''s Return', '2024-05-17');
insert into sets values (5, 'Shimmering Skies', '2024-08-09');
insert into sets values (6, 'Azurite Sea', '2024-11-15');

insert into decks values (1, 'LadyFinders', 8);
insert into decks values (2, 'Emerald Steel Discard', 9);
insert into decks values (3, 'Seattle PPG Event Deck', 10);
insert into decks values (4, 'PurpSteel Aggro', 7);
insert into decks values (5, 'Pirates!', 6);

insert into cards values (1, 1, 'Amber', 'Character', 11, 4);
insert into cards values (4, 1, 'Amber', 'Character', 11, 1);
insert into cards values (157, 6, 'Sapphire', 'Character', 12, 2);
insert into cards values (169, 4, 'Sapphire', 'Location', 12, 3);
insert into cards values (96, 5, 'Emrald', 'Song', 11, 5);

insert into cardInstances values (1, 1, 1, 6, 'Good',5);
insert into cardInstances values (2, 4, 1, 10, 'Fair',3);
insert into cardInstances values (3, 157, 6, 8, 'Poor',1);
insert into cardInstances values (4, 169, 4, 9, 'Good',2);
insert into cardInstances values (5, 96, 5, 7, 'New',4);

insert into transactions values (1, 1, 7, '2024-10-05', 100,6);
insert into transactions values (2, 2, 9, '2024-02-24', 12,10);
insert into transactions values (3, 3, 10, '2023-11-07', 1.5,8);
insert into transactions values (4, 4, 8, '2022-06-14', 2.25,9);
insert into transactions values (5, 5, 6, '2024-05-30', 21,7);

/* Criteria 6: The findGames procedure can be used for a player to search for games within a given range and find the host of said game*/

drop procedure if exists findGames;
delimiter /
create procedure findGames(startDate date, endDate date)
	begin
		select gameLoc as Location, gameDate as Date, gameType as 'Game Type', concat(fname, ' ', lname) as 'Host Name'
        from games natural join users
        where gameHost = userID and gameDate >= startDate and gameDate <= endDate;
    end
    /
delimiter ;

call findGames('2023-01-01', '2024-12-31');

use groupsixproject;
select * from games;

insert into games (gameType, gameDate, gameLoc, gameHost) values ('Competitive', '2026-11-02', 'Jakes House', 7);
