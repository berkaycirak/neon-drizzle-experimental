-- Migration file to track schema state
-- Tables already exist, this is just for tracking purposes
SELECT 1;

-- Current database state (DO NOT RUN - This is just for tracking)
CREATE TABLE IF NOT EXISTS "users" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	"name" varchar(255) NOT NULL,
	"age" integer NOT NULL,
	"email" varchar(255) NOT NULL,
	CONSTRAINT "users_email_unique" UNIQUE("email")
);

CREATE TABLE IF NOT EXISTS "posts" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	"userId" integer,
	"content" text NOT NULL,
	"created_at" timestamp DEFAULT now(),
	CONSTRAINT "posts_userId_users_id_fk" FOREIGN KEY ("userId") REFERENCES "users"("id")
); 