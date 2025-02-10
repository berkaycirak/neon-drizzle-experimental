import "dotenv/config";
import { drizzle } from "drizzle-orm/neon-http";

const db = drizzle(process.env.DIRECT_URL!);

export default db;
