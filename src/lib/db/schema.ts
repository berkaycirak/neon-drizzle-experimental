import { integer, pgTable, text, varchar } from "drizzle-orm/pg-core";

export const usersTable = pgTable("users", {
	id: integer().primaryKey().generatedAlwaysAsIdentity(),
	name: varchar({ length: 255 }).notNull(),
	age: integer().notNull(),
	email: varchar({ length: 255 }).notNull().unique(),
});

export const postsTable = pgTable("posts", {
	id: integer().primaryKey().generatedAlwaysAsIdentity(),
	userId: integer().references(() => usersTable.id),
	content: text().notNull(),
});
