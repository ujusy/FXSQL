START TRANSACTION;

CREATE SCHEMA IF NOT EXISTS "test";

CREATE TABLE IF NOT EXISTS "test"."user" (
    "id" BIGSERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP WITH TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP WITH TIME ZONE NOT NULL
    );

CREATE TABLE IF NOT EXISTS "test"."course" (
    "id" BIGSERIAL PRIMARY KEY,
    "title" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP WITH TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE IF NOT EXISTS "test"."course_user" (
    "id" BIGSERIAL PRIMARY KEY,
    "user_id" BIGSERIAL NOT NULL
        CONSTRAINT "fk_course_user_user" REFERENCES "test"."user"
        ON DELETE RESTRICT ON UPDATE CASCADE,
    "course_id" BIGSERIAL NOT NULL
        CONSTRAINT "fk_course_user_course" REFERENCES "test"."course"
        ON DELETE RESTRICT  ON UPDATE CASCADE,
    "created_at" TIMESTAMP WITH TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP WITH TIME ZONE NOT NULL,
    CONSTRAINT "uk_user_id_course_id" UNIQUE ("user_id", "course_id")
);

COMMIT;