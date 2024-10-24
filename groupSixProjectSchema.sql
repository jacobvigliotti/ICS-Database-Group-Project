create database GroupSixProject;
use GroupSixProject;

create table users (
	userID int,
	fname varchar(20),
	lname varchar(20),
	role int,					/*Int for roles. EX) 1 for developer, 2 for Illustrator, 3 for Buyer, ETC... */
	primary key(userID)
	);
	
create table games (
	gameID int,
    gameType int,				/*Int for game type. 1 could represent casual, 2 for competetive. Boolean might work better here, but then id change the attribute name to isCompetetive*/
    gameDate date,
    gameLoc varchar(20),
    primary key(gameID)
    );
	
	
create table sets (
	setID int,
    setName varchar(20),
    setRelease date,
    primary key(setID)
    );
    
create table transactions (
	cardInstance 				/* Not sure what variable type to go with on this one*/
    initiator int,				/* int to represent the userID of the seller*/
    initiatedOn date, 			/*Not sure if Initiated On meant the date, or somthing else*/
    price float,
    buyer int					/*int for the UserID of the buyer*/
								/*Would the cardInstance work for the primary? I think another attribute for transaction ID number would be cleaner*/
	);
create table decks (
	deckID int,
    deckName varchar(20),
    deckOwner int,
    primary key(deckID)
    );
    
create table cards (
	cardNum int,
	cardSet int,
    cardColor varchar(20),		
    cardType varchar(20),
    cardCreator int,
    primary key(cardNum)
    );
    
create table artworks (
	artID int,
    artFranchise varchar(20),
    artCharacter varchar(20),
    illustrator int,
    primary key(artID)
    );
    
create table cardInstances (
								/*this line for Card Definition. What variable type should be used?*/
    cardOwner int,
    cardCond int,				/*int to represent condition on a scale of 1 to 5*/
    );
