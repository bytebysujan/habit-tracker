-- Run this SQL query in your Supabase SQL Editor (https://supabase.com/dashboard/project/eoruizcgzwlrlqiepljt/sql)

-- 1. Create the habit_tracker table
CREATE TABLE IF NOT EXISTS public.habit_tracker (
    id TEXT PRIMARY KEY,
    data JSONB NOT NULL DEFAULT '{}'::jsonb,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Enable Row Level Security (RLS)
ALTER TABLE public.habit_tracker ENABLE ROW LEVEL SECURITY;

-- 3. Create access policy to allow read/write for all users (anon & authenticated)
DROP POLICY IF EXISTS "Allow all access to habit_tracker" ON public.habit_tracker;
CREATE POLICY "Allow all access to habit_tracker"
ON public.habit_tracker
FOR ALL
TO anon, authenticated
USING (true)
WITH CHECK (true);

-- 4. Enable Realtime for live cross-device synchronization
ALTER PUBLICATION supabase_realtime ADD TABLE public.habit_tracker;
