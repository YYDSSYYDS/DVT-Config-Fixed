ALTER TABLE character_info
ADD COLUMN lastserver INTEGER DEFAULT 0;

ALTER TABLE guild_matching
ADD COLUMN introduction_text VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
ADD COLUMN MinLevel INT,
ADD COLUMN MaxLevel INT;