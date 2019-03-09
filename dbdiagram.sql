CREATE TABLE "feed" (
  "id" int,
  "name" varchar,
  "rss_url" varchar,
  "website_url" varchar,
  "created_at" date,
  "updated_at" date
);

CREATE TABLE "user" (
  "id" int,
  "email" varchar,
  "password" varchar,
  "created_at" date,
  "updated_at" date,
  "deleted_at" date
);

CREATE TABLE "user_to_feed" (
  "id" int,
  "user_id" int,
  "feed_id" int
);

CREATE TABLE "article" (
  "id" int,
  "feed_id" int,
  "title" varchar,
  "text" varchar,
  "url" varchar,
  "published_at" date,
  "created_at" date,
  "updated_at" date
);

CREATE TABLE "bookmark" (
  "id" int,
  "user_id" int,
  "article_id" int
);

ALTER TABLE "user_to_feed" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_to_feed" ADD FOREIGN KEY ("feed_id") REFERENCES "feed" ("id");

ALTER TABLE "article" ADD FOREIGN KEY ("feed_id") REFERENCES "feed" ("id");

ALTER TABLE "bookmark" ADD FOREIGN KEY ("article_id") REFERENCES "article" ("id");

ALTER TABLE "bookmark" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");