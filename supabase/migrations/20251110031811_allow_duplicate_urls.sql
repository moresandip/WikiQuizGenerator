/*
  # Allow Duplicate URLs for Repeated Quiz Generation

  1. Changes
    - Remove unique constraint from URL column
    - Allows generating multiple quizzes from the same Wikipedia article
    - Each quiz generation creates a new entry with timestamp

  2. Rationale
    - Users may want to regenerate quizzes from the same article
    - Different AI runs produce different questions
    - Preserves learning flexibility without unlimited tier restrictions
*/

DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.table_constraints
    WHERE table_name = 'quizzes' AND constraint_type = 'UNIQUE' AND constraint_name LIKE '%url%'
  ) THEN
    ALTER TABLE quizzes DROP CONSTRAINT "quizzes_url_key";
  END IF;
END $$;
