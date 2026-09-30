# Habit Tracker with Supabase Cloud Sync

A sleek, lightweight habit tracker with real-time cloud synchronization via Supabase.

## Supabase Configuration

- **Project URL:** `https://eoruizcgzwlrlqiepljt.supabase.co`
- **Publishable Key:** `sb_publishable_X1CAEDfrCyR9WiiBZ1jNxg_swxVPH2Q`

## Database Setup

To enable cloud storage and real-time synchronization, run the following script in the [Supabase SQL Editor](https://supabase.com/dashboard/project/eoruizcgzwlrlqiepljt/sql):

```sql
-- 1. Create table
CREATE TABLE IF NOT EXISTS public.habit_tracker (
    id TEXT PRIMARY KEY,
    data JSONB NOT NULL DEFAULT '{}'::jsonb,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Enable Row Level Security (RLS)
ALTER TABLE public.habit_tracker ENABLE ROW LEVEL SECURITY;

-- 3. Allow anonymous & authenticated read/write
CREATE POLICY "Allow all access to habit_tracker"
ON public.habit_tracker
FOR ALL
TO anon, authenticated
USING (true)
WITH CHECK (true);

-- 4. Enable Realtime cross-device updates
ALTER PUBLICATION supabase_realtime ADD TABLE public.habit_tracker;
```

## Features
- ☁️ **Cloud Sync & Realtime Updates**: Synchronize habits seamlessly across all devices and tabs with Supabase.
- ⚡ **Offline Resilient**: Local storage caching ensures offline access and instant loading.
- 📊 **Progress Insights**: KPIs, donut charts, daily completion bar charts, and habit ranking analysis.
- 📝 **Mood & Sleep Tracking**: Daily rating log for mood (1-5) and sleep (hours).
- 🌓 **Light & Dark Theme**: Automatic system theme detection with sleek visual styling.