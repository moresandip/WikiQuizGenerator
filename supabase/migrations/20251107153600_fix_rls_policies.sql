/*
  # Fix RLS Policies for Quizzes Table

  1. Security
    - Drop existing policies that may be too restrictive
    - Add permissive policies for public read and write access
*/

DO $$
BEGIN
  DROP POLICY IF EXISTS "Anyone can read quizzes" ON quizzes;
  DROP POLICY IF EXISTS "Anyone can insert quizzes" ON quizzes;
END $$;

CREATE POLICY "Enable read access for all users"
  ON quizzes
  FOR SELECT
  USING (true);

CREATE POLICY "Enable insert access for all users"
  ON quizzes
  FOR INSERT
  WITH CHECK (true);
